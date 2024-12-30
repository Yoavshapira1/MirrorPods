from abc import abstractmethod
import pandas as pd
import scipy.stats
from Tapper.App_Utilities.utils import target_srate
from Development.util import EXCEL_COLS_PER_TASK as head_lines
from Development.util import *
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from scipy import signal
from os import path, mkdir


def session_factory(path):
    arr = path.split('\\')
    session = arr[-1].split('_')[0]
    if session == TAPPING:
        return Tapper(path, arr)

    elif session == FREE_MOTION:
        return FreeMotion(path, arr)

    elif session == CIRCLES:
        return Circles(path, arr)

def recognize_screen(str):
    if str == '1':
        return "small"
    elif str == '2':
        return "big"
    else:
        return "last session"

class SubjectSession:

    def __init__(self, file_path, arr, session, data_frame=None):
        if data_frame is None:
            self.data = self.fit_headlines(file_path, session)
            self.session_number = arr[-1].split('_')[1].split('.')[0]
            self.screen_type = recognize_screen(self.session_number)
            self.subject = self.data['subject'][2]
            self.sample_rate = target_srate
        else:
            self.data = data_frame
        self.is_dyadic = False

        # trim the beginning of the data and normalize the time stamp and the sample count accordingly
        trim_idx = int(TRIM_SEC * self.sample_rate)
        self.data = self.data.iloc[trim_idx:].reset_index()

        # old index and name of subject are not necessary anymore
        if data_frame is None:
            self.data = self.data.drop(['subject', 'index'], axis=1)[:-2]
        else:
            self.data = self.data.drop(['index'], axis=1)[:-2]

        self.n_samples = len(self.data)
        self.analyzed = False

    def fit_headlines(self, file_path, session):
        if session != TAPPING:
            return pd.read_excel(file_path, usecols=head_lines[session])
        try:
            return pd.read_excel(file_path, usecols=head_lines[session])
        except ValueError:
            old_head_lines = head_lines[session]
            old_head_lines[1] = "tapNum"
            data = pd.read_excel(file_path, usecols=old_head_lines)
            data.rename(columns={'tapNum':'tap_ID %d'%1}, inplace=True)
            return data

    @abstractmethod
    def analyze(self):
        raise NotImplementedError("Session.analyze must be implemented")

    @abstractmethod
    def save(self, dir):
        raise NotImplementedError("Session.save must be implemented")

    @abstractmethod
    def plot(self, ax_arr, outliers_tol):
        pass

    def __iter__(self):
        for key in self.__dict__:
            if key in ATTRIBUTES_TO_SAVE:
                yield key, getattr(self, key)

    def __repr__(self):
        return dict(self)

    def __str__(self):
        s = "%s %s\n" % (self.session, self.screen_type)
        if self.session != TAPPING:
            s += "Sample Rate: %d Hz, Samples: %d, Filter Frequency: %d\n" % \
                 (int(self.sample_rate), self.n_samples, self.filter_freq)
        for key in dict(self):
            if key in ATTRIBUTES_TO_SAVE:
                s += str(key) + ": " + str(getattr(self, key)) + "\n"
        return s



class Motion(SubjectSession):

    def __init__(self, file_path, arr, session, data_frame=None):
        super().__init__(file_path=file_path, arr=arr, session=session, data_frame=data_frame)
        self.session = session

    def analyze(self):
        self.data = preprocess_raw_data(self.data)

        # generate positional data as numpy array
        self.npdata = np.array([self.data[ch_x%1], self.data[ch_y%1]]).T
        if self.is_dyadic:
            self.npdata2 = np.array([self.data[ch_x % 2], self.data[ch_y % 2]]).T

        # generate velocity vector
        self.vel = get_velocity_vector(pos=self.npdata, time=np.array(self.data[time_stamp]))
        if self.is_dyadic:
            self.vel2 = get_velocity_vector(pos=self.npdata2, time=np.array(self.data[time_stamp]))

        # Generate smoothed vector with Gaussian Filter
        self.vel_filtered, self.filter_freq = smooth_vector(self.vel, FILTER_SIZE_FREQ, self.sample_rate)
        if self.is_dyadic:
            self.vel_filtered2, self.filter_freq2 = smooth_vector(self.vel2, FILTER_SIZE_FREQ, self.sample_rate)

        # Find the peaks (*minima*) of the velocity vector
        self.peaks_idx, _ = signal.find_peaks(PEAKS_SGN * self.vel_filtered, height=-np.inf)
        if self.is_dyadic:
            self.peaks_idx2, _ = signal.find_peaks(PEAKS_SGN * self.vel_filtered2, height=-np.inf)

        if self.session == CIRCLES:
            # Separate the peaks to 2 groups: "high_peaks" & "not_high_peaks"
            # data.high_peaks. ---> All peaks located on the TOP of the circle
            # data.not_high_peaks. ---> All the rest
            self.high_peaks_idx, self.not_high_peaks_idx = separate_high_peaks(self.npdata, self.peaks_idx)

            # Generate IPI vector- between the high peaks, and analysis
            high_peaks_idx_and_ts = (self.data[time_stamp].reset_index(drop=True))[self.high_peaks_idx]
            self.IPI, self.IPI_time_stamps, self.IPI_mean, self.IPI_sd, self.IPI_cv, \
            self.IPI_outliers_ratio_per_tolerance = analyze_intervals(high_peaks_idx_and_ts)

        # Generate ISI vector- between ALL peaks
        isi_idx_and_ts = (self.data[time_stamp].reset_index(drop=True))[self.peaks_idx]
        self.ISI, self.ISI_time_stamps, self.ISI_mean, self.ISI_sd, self.ISI_cv, \
        self.ISI_outliers_ratio_per_tolerance = analyze_intervals(isi_idx_and_ts)

        self.analyzed = True

    def save(self, dir):
        if not self.analyzed:
            raise NotImplementedError("Session.save cannot be called before it analyzed")
        df = pd.DataFrame({subject: self.subject, time_stamp: self.data[time_stamp][:-1], vel: self.vel,
                          filtered_vel: self.vel_filtered, tap_ID % 1: self.data[tap_ID % 1][:-1]})
        df.to_excel(r'%s\%s_%s_filter_%dHz.xlsx' % (dir, self.session, self.session_number, self.filter_freq), index=False)

    def animate(self, name):
        data = self.npdata[1:]

        fig, ax = plt.subplots(figsize=(16, 9))
        ax.set_title("Subject: %s, Session: %s, Screen: %s" % (name, self.session, self.screen_type), fontdict=None, loc='center',
                     pad=None)
        xdata, ydata, col = [], [], []
        ln, = plt.plot([], [], 'o')
        global FRAME_COUNTER
        FRAME_COUNTER = len(data)

        ax.set_xlim(0, 1)
        ax.set_ylim(0, 1)
        ax.get_xaxis().set_visible(False)
        ax.get_yaxis().set_visible(False)

        def init():
            return ln,

        def update(frame):
            global FRAME_COUNTER
            FRAME_COUNTER -= 1
            if FRAME_COUNTER == 0:
                plt.pause(1)
                plt.close(fig)
            xdata.append(frame[0])
            ydata.append(frame[1])
            ln.set_data(xdata[-ANIMATION_TAIL:], ydata[-ANIMATION_TAIL:])
            return ln,

        ani = FuncAnimation(fig, update, frames=data, init_func=init,
                            interval=self.time_length / self.n_samples / ANIMATION_SPEED, blit=True, repeat=False)

        plt.show()

    def _plot_velocity_vector(self, ax, filtered=False, filter_size=None):
        ts = self.data.loc[1:]['TS']
        # ax.set_yticks([])
        if filtered:
            c = COLORS['vel_filtered']
            ax.plot([], [], ' ', label="filter freq: %d Hz" % filter_size)
            ax.set(ylabel="Filtered.")
            ax.plot(ts, self.vel_filtered, c=c)
        else:
            c = COLORS['vel']
            ax.plot([], [], ' ', label=r'$\mu$: %.5f.  $\sigma$: %.5f' % (np.mean(self.vel), np.sqrt(np.var(self.vel))))
            ax.set(ylabel="Vel.")
            ax.plot(ts, self.vel, c=c)

        ax.legend(loc='upper left', prop={'size': 8})

    def _plot_peaks(self, ax):
        ax.set_yticks([])
        ax.set_xticks([])
        ax.set(ylabel="vel.")
        ax.plot(self.vel, alpha=1)
        if self.session == CIRCLES:
            for x in self.high_peaks_idx:
                ax.axvline(x, color='red', linestyle='--', linewidth=0.8)
            for x in self.not_high_peaks_idx:
                ax.axvline(x, color='Orange', linestyle='--', linewidth=0.8)
            ax.scatter(self.not_high_peaks_idx, self.vel[self.not_high_peaks_idx], marker="^", color='Orange', zorder=2,
                       linewidth=0.3, edgecolors='black', s=20)
            ax.scatter(self.high_peaks_idx, self.vel[self.high_peaks_idx], marker='o', color='red', zorder=2,
                       linewidth=0.3,
                       edgecolors='black', s=20)
        else:
            for x in self.peaks_idx:
                ax.axvline(x, color='Orange', linestyle='--', linewidth=0.8)
            ax.scatter(self.peaks_idx, self.vel[self.peaks_idx], marker="^", color='Orange', zorder=2,
                       linewidth=0.3, edgecolors='black', s=20)

    def plot(self, ax_arr, outliers_tol):
        ax_arr[0].set_title(
            "Session: %s, Screen: %s" % (self.session, self.screen_type))
        self._plot_velocity_vector(ax_arr[0])
        self._plot_velocity_vector(ax_arr[1], filtered=True, filter_size=self.filter_freq)
        self._plot_peaks(ax_arr[2])
        plot_interval_hist(ax_arr[3], self.ISI, outliers_tol, title='ISI (all points)')


class Tapper(SubjectSession):
    #   session             : <String> = "Tapper"
    def __init__(self, file_path, arr):
        super().__init__(file_path=file_path, arr=arr, session=TAPPING)
        self.session = TAPPING

    def analyze(self):
        self.IPI, self.IPI_time_stamps, self.IPI_mean, self.IPI_sd, self.IPI_cv, \
        self.IPI_outliers_ratio_per_tolerance = analyze_intervals \
            ((self.data[time_stamp].reset_index(drop=True)))
        self.analyzed = True

    def _plot_tapping_tempo(self, ax, outliers_tol, include_outliers=True):
        ax.set_xticks([])
        ax.yaxis.set_tick_params(labelsize=6)
        if include_outliers:
            ax.set_title("ITI, including outliers:")
            ax.plot(self.IPI_time_stamps / 1000, self.IPI)

        if not include_outliers:
            y = self.IPI
            z_score = scipy.stats.zscore(y)
            y = y[np.abs(z_score) <= outliers_tol]
            x = self.IPI_time_stamps
            x = x[np.abs(z_score) <= outliers_tol]
            ax.set_title("not including outliers:")
            ax.set(xlabel="Time.")
            ax.plot(x / 1000, y, color='Orange')

    def plot(self, ax_arr, outliers_tol):
        ax_arr[0].set_title(
            "Session: %s, Screen: %s" % (self.session, self.screen_type))
        ax_arr[0].set_yticks([])
        ax_arr[0].set_xticks([])
        self._plot_tapping_tempo(ax_arr[1], outliers_tol, include_outliers=True)
        self._plot_tapping_tempo(ax_arr[2], outliers_tol, include_outliers=False)
        plot_interval_hist(ax_arr[3], self.IPI, outliers_tol)

class Circles(Motion):
    #   session             : <String> = "Circles"
    def __init__(self, file_path, arr):
        super().__init__(file_path=file_path, arr=arr, session=CIRCLES)


class FreeMotion(Motion):
    #   session             : <String> = "FreeMotion"
    def __init__(self, file_path, arr):
        super().__init__(file_path=file_path, arr=arr, session=FREE_MOTION)

class DyadicMotion(Motion):
    #   session             : <String> = "Dyadic"
    def __init__(self, subject, session_number, session, sample_rate, data_frame):
        self.session_number = session_number
        self.screen_type = "Big"
        self.subject = subject
        self.sample_rate = sample_rate
        super().__init__(file_path=None, arr=None, session=session, data_frame=data_frame)
        self.is_dyadic = True


class Subject:
    def __init__(self, path):
        self.path = path
        self.velocity_vectors_dir = self.make_dir()
        arr = path.split('\\')[-2:]
        self.df_path = arr[1] + r'_DF.xlsx'
        arr = arr[1].split('_')
        self.num, self.name, self.dyad = arr[0].replace('s', ''), arr[1], arr[2].replace('d', '')
        self.parse_raw_data()
        self.analyze()

    def make_dir(self):
        dir = self.path + r'/Velocity_Vectors'
        if not path.isdir(dir):
            mkdir(dir)
        return dir

    def parse_raw_data(self):
        self.sessions = {}
        for session in suffix.keys():
            try:
                self.sessions[session] = session_factory(self.path + suffix[session])
            except Exception as e:
                print("Couldn't parse data from the file: %s.\nThe file may be"
                      " corrupted or not exists. ERROR: %s\n" % (self.path + suffix[session], e.args))
                self.sessions[session] = None

    def analyze(self):
        for session in suffix.keys():
            try:
                if self.sessions[session]:
                    self.sessions[session].analyze()
            except Exception as e:
                print("Couldn't analyze data from the file: %s.\nThe data is may be not good enough, "
                      "i.e. a lot of disconnections. ERROR: %s\n" % (self.path + suffix[session], e.args))

    def save(self):
        for title, session in self.sessions.items():
            if session.session != TAPPING:
                session.save(self.velocity_vectors_dir)

    def save_df(self, dir=""):
        df = pd.DataFrame.from_dict(dict(self))
        if dir:
            file = path.dirname(self.path) + r'\%s\%s' % (dir, self.df_path)
        else:
            file = self.path + r'\%s' % self.df_path
        df.to_excel(file)

    def animate(self, session):
        if issubclass(type(self.sessions[session]), Motion):
            self.sessions[session].animate(self.name)
        else:
            raise ValueError("Animation can be requested only for sessions: %s, %s, %s, %s" % (motion_small, motion_big, circles_small, circles_big))

    def plot(self, sessions, outliers_tol=DEFAULT_OUTLIERS_TOL):
        if len(sessions) == 0:
            sessions = [motion_small, motion_big, circles_small, circles_big, tapping_small, tapping_big]
        axis_slots = 4
        map = False if len(sessions) > 1 else True
        if not map:
            fig, axs = plt.subplots(axis_slots, len(sessions))
        else:
            fig, axs = plt.subplots(axis_slots, 2)

        fig.suptitle('Subject: %s, num: %s, dyad: %s' % (self.name, self.num, self.dyad), fontsize=16)

        for session, ax in zip(sessions, axs.T):
            self.sessions[session].plot(ax, outliers_tol)

        if map:
            if sessions[0] in [circles_small, circles_big]:
                self._plot_circles_map(fig, axs, sessions, outliers_tol)
            else:
                self._plot_motion_map(fig, axs, sessions, outliers_tol)

        plt.show()

    def _plot_circles_map(self, fig, axs, sessions, outliers_tol=DEFAULT_OUTLIERS_TOL):
        session = self.sessions[sessions[0]]
        gs = axs[1, 0].get_gridspec()
        for ax in axs[0:, -1]:
            ax.remove()
        axbig = fig.add_subplot(gs[0:3, -1])
        axsmall = fig.add_subplot(gs[3, -1])
        self._draw_movement(axbig, sessions)
        plot_interval_hist(axsmall, session.IPI, outliers_tol, title='IPI (red points)')

    def _plot_motion_map(self, fig, axs, sessions, outliers_tol=DEFAULT_OUTLIERS_TOL):
        gs = axs[1, 0].get_gridspec()
        for ax in axs[0:, -1]:
            ax.remove()
        axbig = fig.add_subplot(gs[0:4, -1])
        self._draw_movement(axbig, sessions)

    def _draw_movement(self, ax, sessions):
        session = self.sessions[sessions[0]]
        ax.set_xlim(0, 1)
        ax.set_ylim(- BOARD_DIMS / 2, 1 + (BOARD_DIMS / 2))
        ax.get_xaxis().set_visible(False)
        ax.get_yaxis().set_visible(False)
        ax.set_title("Minimal velocity points along the move")
        ax.scatter(session.npdata[:, 0], session.npdata[:, 1], alpha=0.8)
        if sessions[0] in [circles_small, circles_big]:
            ax.scatter(session.npdata[:, 0][session.not_high_peaks_idx],
                          session.npdata[:, 1][session.not_high_peaks_idx],
                          marker="^", color='Orange', zorder=2, edgecolors='black', linewidths=1.)
            ax.scatter(session.npdata[:, 0][session.high_peaks_idx], session.npdata[:, 1][session.high_peaks_idx],
                          marker="o",
                          color='r', zorder=2, edgecolors='black', linewidths=1.)
        else:
            ax.scatter(session.npdata[:, 0][session.peaks_idx],
                       session.npdata[:, 1][session.peaks_idx],
                       marker="^", color='Orange', zorder=2, edgecolors='black', linewidths=1.)

    def __iter__(self):
        for session in self.sessions.values():
            if session:
                yield session.session + r' ' + session.screen_type, dict(session)

    def __repr__(self):
        return dict(self)

    def __str__(self):
        res = "*****************************\n"
        res += "Subject name: %s, number: %s\n" % (self.name, self.num)
        for s in self.sessions:
            res += str(self.sessions[s]) + "\n"
        return res + "*****************************\n\n"

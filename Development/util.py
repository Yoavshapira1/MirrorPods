import numpy as np
from scipy.ndimage import gaussian_filter1d
from scipy import stats
from scipy.signal import butter, lfilter


BOARD_DIMS = 16 / 9
Y_AXIS_RATIO = 9/16

ATTRIBUTES_TO_SAVE = ['IPI_mean', 'IPI_sd', 'IPI_cv', 'ISI_mean', 'ISI_sd', 'ISI_cv']

SAVE_DATA_FRAMES = "1"
PLOT_SUBJECT = "2"

MENU1 = "Menu1"
MENU2 = "Menu2"
REGISTER1 = "Register1"
REGISTER2 = "Register2"
DYADIC_FL = "Dyadic_FL"
DYADIC_LF = "Dyadic_LF"
DYADIC = "Dyadic"
ENTER_NAME = "Name"
TAPPING = "Tapper"
FREE_MOTION = "Motion"
CIRCLES = "Circles"
EXIT = "Exit"


HANDS_ALLOWED = 2

STASH_MARKER = "SESSION STOPPED"


# DataFrames columns
subject = 'subject'
time_stamp = "TS"
ch_x = "ch%d_x"
ch_y = "ch%d_y"
tap_ID = "tap%d_ID"
vel = 'vel'
filtered_vel = 'filtered'
type_col = "type"
type_num_col = "# type"
order_col = "order"

def generate_head_columns():
    col = []
    for ch in range(HANDS_ALLOWED):
        col.append(ch_x % (ch + 1))
        col.append(ch_y % (ch + 1))
        col.append(tap_ID % (ch + 1))
    return col + [time_stamp]


# Excel headlines per task
EXCEL_COLS_PER_TASK = {
    TAPPING: [subject, tap_ID % 1, time_stamp],
    FREE_MOTION: [subject] + generate_head_columns(),
    CIRCLES: [subject] + generate_head_columns(),
    DYADIC: [subject+'1'] + generate_head_columns() + [subject+'2'] + generate_head_columns()
}

motion_small = 'Motion small'
motion_big = 'Motion big'
circles_small = 'Circles small'
circles_big = 'Circles big'
circles_last = 'Circles last'
tapping_small = 'Tapping small'
tapping_big = 'Tapping big'
tapping_last = 'Tapping last'


suffix = {motion_small: r'\Motion_1.xlsx',
          motion_big: r'\Motion_2.xlsx',
          circles_small: r'\Circles_1.xlsx',
          circles_big: r'\Circles_2.xlsx',
          circles_last: r'\Circles_3.xlsx',
          tapping_small: r'\Tapper_1.xlsx',
          tapping_big: r'\Tapper_2.xlsx',
          tapping_last: r'\Tapper_3.xlsx'}

################# animation parameters ####################
ANIMATION_TAIL = 90  # Tail of the animation factor
ANIMATION_SPEED = 2  # FastForward factor
FRAME_COUNTER = 0  # don't change this

############### pre-process parameters ####################
TRIM_SEC = 0  # time of the beginning of the trial to be cut, in sec.
CHUNK_SAMPLES = 1  # bulking factor of the samples

############## velocity process parameters ################
# The next variables are for the filter size of the velocity vector.
# Define the points on the circle where the velocity on the axis decreases as 'intentionally slowing' points.
# The faster the movement --> The less 'noisy' points (which are not intentionally slowing) on the velocity vector
# Therefor, The slower the movement --> The bigger filter size required to detect the intentionally slowing and
# extract the peaks for the intervals analyzing.
# Here, an arbitrary mean (of velocity) was chosen from observations, and this value requires minial filtering.
# Every 0.1 below this value requires (about) 1 more filter size unit
VEL_FILTER_SIZE = 3
VEL_MAX_BASE = 0.0013
MULTIPY_FACTOR = 10000  # in order to get a reasonable integer to for the filter kernel
FILTER_SIZE_FREQ = 30  # change here to a constant filter size, in frequency. avoid filter size adaptation
FILTER_MODE = 'LP'

FILTER_SIZE_SAMPLES = 7  # change here to a constant filter size, in samples. avoid filter size adaptation
# frequency filter is in priority

INTERVALS_BINS = 20  # bins for the intervals histogram
MAX_OUTLIERS_TOL = 4  # tolerance for outliers. POSITIVE INTEGER
DEFAULT_OUTLIERS_TOL = 2
PEAKS_SGN = -1  # sign of the peaks: 1 for Max and -1 for Min
COLORS = {'vel': 'C0', 'vel_smooth': 'C1', 'vel_filtered': 'C2'}


def preprocess_raw_data(data):
    for ch in range(1, HANDS_ALLOWED+1):
        data[ch_y % 1] = data[ch_y % 1] * Y_AXIS_RATIO

    # Chunks the data into bulks of size of CHUNK_SAMPLES
    processed_data = data.iloc[::CHUNK_SAMPLES, :]

    # # replaces -1 to nan
    # processed_data.replace(-1, np.nan, inplace=True)

    # # interpolate to fill the nan values
    # processed_data['ch1_x'].interpolate(method="linear", inplace=True)
    # processed_data['ch1_y'].interpolate(method="linear", inplace=True)

    return processed_data


def get_velocity_vector(pos, time):
    dt = time[1:] - time[:-1]
    dist = np.linalg.norm(pos[1:] - pos[:-1], axis=1)
    return dist / dt


def butter_bandpass(lowcut, highcut, fs, order=5):
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b, a = butter(order, [low, high], btype='band')
    return b, a


def butter_bandpass_filter(data, lowcut, highcut, fs, order=5):
    b, a = butter_bandpass(lowcut, highcut, fs, order=order)
    y = lfilter(b, a, data)
    return y


def smooth_vector(vel, filter_size_freq=30, sample_rate=None):
    if filter_size_freq:
        if not sample_rate:
            raise ValueError("samples rate must passed to filter function")
        kernel = int(np.floor(sample_rate / filter_size_freq))
        return gaussian_filter1d(vel, kernel), filter_size_freq


def separate_high_peaks(data, peaks):
    center_y = np.mean(data[:, 1])

    # for every peak P, check if the next points in data are in descending order in the y axis
    # check out half of the points between two peaks
    # if YES: insure that P_y is > center_y
    res = []
    for i in range(len(peaks[:-1])):
        p_cur = peaks[i]
        p_next = peaks[i + 1]
        if data[p_cur][1] > np.average(data[p_cur:p_next][:, 1]) and data[p_cur][1] > center_y:
            res.append(p_cur)
    p_last = peaks[-1]
    if data[p_last][1] > np.average(data[p_last:][:, 1]):
        res.append(p_last)

    h_peaks = np.array(res)
    return h_peaks, np.setdiff1d(peaks, h_peaks)


def analyze_intervals(idx_and_ts):
    # extract intervals
    intervals = idx_and_ts[1:].copy().reset_index(drop=True).subtract(idx_and_ts[:-1].copy().reset_index(drop=True))

    # stamp every interval [a,b] with the time of (a+b)/2
    II_time_stamps = (idx_and_ts[1:].copy().reset_index(drop=True).add(
        idx_and_ts[:-1].copy().reset_index(drop=True))) / 2

    II_mean = np.mean(intervals)
    II_sd = np.sqrt(np.var(intervals))
    II_cv = II_sd / II_mean
    z_score = stats.zscore(intervals)
    II_outliers_ratio_per_tolerance = {}
    for tol in range(2 * MAX_OUTLIERS_TOL):
        t = (tol / 2) + 0.5
        II_outliers_ratio_per_tolerance[t] = len(intervals[np.abs(z_score) > t]) / len(intervals)
    return intervals, II_time_stamps, II_mean, II_sd, II_cv, II_outliers_ratio_per_tolerance


def plot_interval_hist(ax, data, outliers_tol, color, title=''):
    ax.set_yticks([])
    x = data * 1000             # to milliseconds
    z_score = stats.zscore(x)
    outliers_ratio = len(x[np.abs(z_score) > outliers_tol]) / len(x)
    x = x[np.abs(z_score) <= outliers_tol]
    ax.plot([], [], ' ',
            label=r'$\mu$: %.0f.  $\sigma$: %.0f, med: %.0f, samples: %d' % (
                np.mean(np.array(x)), np.sqrt(np.var(np.array(x))), np.median(np.array(x)), x.shape[0]))

    density, bins, patches = ax.hist(x, density=True, bins=20, edgecolor='black', linewidth=1.,
                                     color=color, alpha=0.2)
    mn, mx = ax.set_xlim()
    ax.set_xlim(mn, mx)
    kde_xs = np.linspace(mn, mx, 300)
    kde = stats.gaussian_kde(x)
    pdf = kde.pdf(kde_xs)
    ax.plot(kde_xs, pdf, c='r', alpha=0.5)
    ax.legend(loc='best', prop={'size': 8})

    return np.min(x), np.max(x)

from sys import stdout

class ProgressBar:
    def __init__(self, total, bar_length=20, char='#', parent=["[", "]"]):
        self.total = total
        self.bar_length = bar_length
        self.curr = 0
        self.open_par, self.close_par = parent[0], parent[1]
        self.char = char
        self.step_and_print(step=0, text="Start job")

    def step_and_print(self, step=1, text=""):
        self.curr += step

        # Calculate the progress as a percentage
        progress = self.curr / self.total

        # Calculate the length of the progress bar in characters
        num_chars = int(progress * self.bar_length)

        # Create the progress bar line
        bar_line = self.open_par + self.char * num_chars + ' ' * (self.bar_length - num_chars) + self.close_par

        # Print the progress bar line and update the console output
        stdout.write('\r' + bar_line + f' {int(progress * 100):3d}% {str(text)}\n')
        stdout.flush()
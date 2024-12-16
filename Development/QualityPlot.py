import os
from xdfFilesUtilities import realize_pandas_df, read_xdf_df, read_excel_df
from matplotlib import pyplot as plt
from matplotlib.gridspec import GridSpec, GridSpecFromSubplotSpec
from Development.Subject import Subject
import numpy as np
from matplotlib.patches import Rectangle
from Development.util import motion_small, motion_big, circles_small, circles_big, circles_last,\
                             tapping_small, tapping_big, tapping_last, FREE_MOTION, CIRCLES, TAPPING, plot_interval_hist
from Tapper.App_Utilities.utils import markers_dict, target_srate, ch_x, ALL_DYADIC_DIR, ALL_SUBJECTS_DIR

stuck_threshold = 5.

def get_touch_starts_idx(data, hand=1, markers_idx=[], single=False, stuck_threshold=stuck_threshold):
    if not single:                  # for dyad plot
        ch = 0 if hand == 1 else 3
    else:                      # for single plot
        ch = hand

    try:
        # start of touches information
        touch_idx = np.argwhere(data[:, ch] != -1)
        touches_diff = touch_idx[1:] - touch_idx[:-1]
        starts = np.argwhere(touches_diff != 1)[:, 0] + 1
        data_touch_starts = np.r_[touch_idx[0], touch_idx[starts].flatten()]

        # end of touches information
        ends = np.argwhere(touches_diff != 1)[:, 0]
        data_touch_ends = np.r_[touch_idx[ends].flatten(), touch_idx[-1]]

        # looking for areas where the touch is stuck, meanly more than Threshold samples are equal to last touch point
        # NOTICE: stuck point P means that all points [P:end_marker] are equal, and this is what we looking for here
        # by iterating all sessions, and look for P. If doesnt find - put None for this session
        # stuck list should maintain: len(stuck) = len(starts) = len(ends)
        stuck_indices = []
        cur_mark = 1        # start with the first end-marker
        from DyadicPostProcess import find_first_sequence_indices
        for start, end in zip(data_touch_starts, data_touch_ends):
            # only this case is fit for what we are looking for, otherwise put None in the list
            try:
                if end >= markers_idx[cur_mark] >= start:
                    end = markers_idx[cur_mark]  # stuck event should be in the range [start:end_marker]
                    cur_mark += 2  # skip to next end-marker
            except IndexError:
                # simply means that we have reached to the last session
                pass
            if (end - start) / target_srate > stuck_threshold:      # if the touch event is longer than threshold
                stuck_idx = find_first_sequence_indices(np.c_[data[start:end, ch], data[start:end, ch + 1]],
                                                        seq=int(stuck_threshold * target_srate),
                                                        cond=lambda x: np.all(x == x[-1], axis=1))
                # stuck_idx is now relative to the sequence (In not None). Add start time stamp to it
                if stuck_idx is not None: stuck_idx += start
                stuck_indices.append(stuck_idx)
            else:
                # meanly, the range [start:end] doesn't reach to end_marker
                stuck_indices.append(None)

        return {"starts": data_touch_starts,
                "ends": data_touch_ends,
                "stuck": stuck_indices,
                "dis_times": touches_diff[ends].flatten()}

    except Exception as e:
        # print("ERROR: The data array might be empty. ARGS: %s" % e.args)
        return None, None


def get_session(start, end, session_idx, markers_idx, markers_labels, data, ts):
    _LL_start = markers_idx[markers_labels == start][session_idx]
    _LL_end = markers_idx[markers_labels == end][session_idx]
    _LL_ts, _LL_data = ts[_LL_start:_LL_end], data[_LL_start:_LL_end]
    return _LL_data, _LL_ts


def plot_session(screen1_data, screen1_ts, screen2_data, screen2_ts, markers_idx, markers_labels, session, session_idx=0):
    _FL_1_data, _FL_1_ts = get_session(markers_dict[session]["START"],
                                       markers_dict[session]["STOP"], session_idx, markers_idx,
                                       markers_labels, screen1_data, screen1_ts)
    _FL_2_data, _FL_2_ts = get_session(markers_dict[session]["START"],
                                       markers_dict[session]["STOP"], session_idx, markers_idx,
                                       markers_labels, screen2_data, screen2_ts)

    screen1_hand1_touch_starts, screen1_hand1_touch_total = get_touch_starts_idx(_FL_1_data, hand=1)
    screen1_hand2_touch_starts, screen1_hand2_touch_total = get_touch_starts_idx(_FL_1_data, hand=2)
    screen2_hand1_touch_starts, screen2_hand1_touch_total = get_touch_starts_idx(_FL_2_data, hand=1)
    screen2_hand2_touch_starts, screen2_hand2_touch_total = get_touch_starts_idx(_FL_2_data, hand=2)

    diff = np.abs(screen2_ts - screen1_ts)
    _max, _min, _miu, _std = np.max(diff), np.min(diff), np.mean(diff), np.std(diff)
    plt.suptitle("session: %s, number %d" % (markers_dict[session]["START"], session_idx+1))
    plt.title('$\delta$ between 2 match samples. Max: %.3f, min: %.3f, $\mu$: %f, $\sigma$: %f' % (_max, _min, _miu, _std))

    if screen1_hand1_touch_starts is not None:
        plt.vlines(screen1_hand1_touch_starts, ymin=0, ymax=0.005, colors="blue", alpha=0.4,
                   label="Screen1 Hand1. Counter: %d. Total Samples: %d" % (
                   screen1_hand1_touch_starts.shape[0], len(screen1_hand1_touch_total)))
    if screen1_hand2_touch_starts is not None:
        plt.vlines(screen1_hand2_touch_starts, ymin=0, ymax=0.005, colors="green", alpha=0.4,
                   label="Screen1 Hand2. Counter: %d. Total Samples: %d" % (
                   screen1_hand2_touch_starts.shape[0], len(screen1_hand2_touch_total)))
    if screen2_hand1_touch_starts is not None:
        plt.vlines(screen2_hand1_touch_starts, ymin=0, ymax=0.005, colors="red", alpha=0.4,
                   label="Screen2 Hand1. Counter: %d. Total Samples: %d" % (
                   screen2_hand1_touch_starts.shape[0], len(screen2_hand1_touch_total)))
    if screen2_hand2_touch_starts is not None:
        plt.vlines(screen2_hand2_touch_starts, ymin=0, ymax=0.005, colors="yellow", alpha=0.4,
                   label="Screen2 Hand2. Counter: %d. Total Samples: %d" % (
                   screen2_hand2_touch_starts.shape[0], len(screen2_hand2_touch_total)))

    for t, lab in zip(markers_idx, markers_labels):
        plt.vlines(t, ymin=0, ymax=0.005, colors="black", linestyles='--')
        plt.text(t - 100, -0.0001, lab, fontsize=7)

    plt.legend()
    plt.show()


def plot_touch_information_single_hand(dict, color, y_vals, ax, include_disconnect_text=False):
    touch_starts, touch_ends, touch_stuck, disc_times = dict["starts"], dict["ends"], dict["stuck"], dict["dis_times"]

    # color the areas corresponding to touches
    for x1, st, x2 in zip(touch_starts, touch_stuck, touch_ends):
        if st is not None:     # in case a stuck area was identified here
            rect = Rectangle((st, y_vals[0]), x2 - st, y_vals[1] - y_vals[0],
                             linewidth=1, edgecolor=color, facecolor='gray', alpha=0.1)
            ax.add_patch(rect)
            x2 = st
        rect = Rectangle((x1, y_vals[0]), x2 - x1, y_vals[1] - y_vals[0],
                             linewidth=1, edgecolor=color, facecolor=color, alpha=0.1)
        ax.add_patch(rect)

    # plot disconnections information, only above a threshold of 1 sec.
    ax.vlines(touch_ends, ymin=y_vals[0], ymax=y_vals[1], colors=color, alpha=0.5)
    idx = np.argwhere(disc_times / target_srate > 1.)
    touch_ends = touch_ends[idx]
    disc_times = disc_times[idx]
    if include_disconnect_text:
        for i, x in enumerate(touch_ends[:-1]):
            ax.text(x, (y_vals[1] + y_vals[0]) / 2, "sec: %.3f" % (disc_times[i] / target_srate), rotation=90,
                    va='center', fontsize=8, color=color)

    return touch_starts.shape[0]


def plot_dyad_data(screen1_data, screen2_data, ax, markers_idx):
    params = [(screen1_data, 1), (screen1_data, 2), (screen2_data, 1), (screen2_data, 2)]
    colors = ["blue", "green", "brown", "orange"]
    y_vals = [((0.005 / 5 * i) - (0.005 / 10), (0.005 / 5 * i) + (0.005 / 10)) for i in range(1, 5)]
    screens = [1, 1, 2, 2]
    hands = [1, 2, 1, 2]
    total_touch_events = []

    for i in range(4):
        dict = get_touch_starts_idx(*params[i], markers_idx=markers_idx)
        if dict != (None, None):
            total = plot_touch_information_single_hand(dict, colors[i], y_vals[i], ax)
            total_touch_events.append(total)
        else:
            total_touch_events.append(0)

    yticks = ["Subject %d, Hand %d. Total: %d" % (screens[i], hands[i], total_touch_events[i]) for i in range(4)]
    ax.set_yticks([(y[0] + y[1]) / 2 for y in y_vals], yticks)


def plot_motion_information(n, sessions, y_vals, ax, colors):
    for i in range(n):
        if sessions[-i-1] is not None:
            data_2_channels = np.c_[sessions[-i-1].data[ch_x % 1].to_numpy(), sessions[-i-1].data[ch_x % 2].to_numpy()]
            left_side_x_lim = - data_2_channels.shape[0] // 14
            ax.set_xlim(left_side_x_lim, data_2_channels.shape[0])
            dict_ch_1 = get_touch_starts_idx(data_2_channels, hand=0, single=True)
            dict_ch_2 = get_touch_starts_idx(data_2_channels, hand=1, single=True)
            y_val_ch1, y_val_ch2 = [(y_vals[i][0] + y_vals[i][1]) / 2, y_vals[i][1]],\
                                   [y_vals[i][0], (y_vals[i][0] + y_vals[i][1]) / 2]
            center1 = ((y_val_ch1[0] + y_val_ch1[1]) / 2) - 0.035
            center2 = ((y_val_ch2[0] + y_val_ch2[1]) / 2) - 0.035
            ax.text(left_side_x_lim * 4/5, center1, "CH1:", fontsize=8)
            ax.text(left_side_x_lim * 4/5, center2, "CH2:", fontsize=8)
            if dict_ch_1 != (None, None):
                plot_touch_information_single_hand(dict_ch_1, colors[i], y_val_ch1, ax, include_disconnect_text=False)
            if dict_ch_2 != (None, None):
                plot_touch_information_single_hand(dict_ch_2, colors[i], y_val_ch2, ax, include_disconnect_text=False)
            for y in y_vals[i]:
                ax.axhline(y=y, color="black", linestyle='--', alpha=0.3)


def plot_tapping_information(n, sessions, y_vals, ax, colors, fig):
    sub_axs = GridSpecFromSubplotSpec(n, 1, subplot_spec=ax, wspace=0.1, hspace=0.1)
    axis_lst = []
    for i in range(n):
        if sessions[-i - 1] is not None:
            ax = plt.Subplot(fig, sub_axs[-i-1])

            if i == 0:
                ax.set(xlabel="ms.")
            else:
                ax.set_xticks([])

            axis_lst.append(ax)
            sess = sessions[-i-1]
            plot_interval_hist(ax, sess.IPI, color=colors[i], outliers_tol=np.inf)
            fig.add_subplot(ax)

    # set x limits
    for ax in axis_lst:
        ax.set_xlim(200, 1200)


def plot_single_section(sessions, ax, subject, fig=None):
    n = len(sessions)
    if subject == 1:
        colors = ["blue", "green", "darkcyan"][:n]
    else:
        colors = ["brown", "orange", "gold"][:n]
    y_vals = [(i/n, (i+1)/n) for i in range(n)]
    screens = [sess.screen_type if sess is not None else "N/A" for sess in sessions]
    name = sessions[0].session

    if name in [FREE_MOTION, CIRCLES]:
        ax.set_ylim(0, 1)
        plot_motion_information(n, sessions, y_vals, ax, colors)
    elif name == TAPPING:
        plot_tapping_information(n, sessions, y_vals, ax, colors, fig)

    yticks = ["%s, %s" % (name, screens[::-1][i]) for i in range(n)]
    ax.set_yticks([(y[0] + y[1]) / 2 for y in y_vals], yticks)


def plot_markers(markers, screen1_ts, ax):
    markers_labels, markers_ts = np.array(markers["time_series"]), np.array(markers["time_stamps"])
    markers_labels = markers_labels.reshape(markers_ts.shape)
    markers_idx = np.searchsorted(screen1_ts, markers_ts)
    for i, (t, lab) in enumerate(zip(markers_idx, markers_labels)):
        ax.vlines(t, ymin=0, ymax=0.005, colors="black", linestyles='--', alpha=0.7)
        text_pos = (t - 200, -0.0001) if i % 2 == 0 else (t - 3800, -0.0001)
        ax.text(text_pos[0], text_pos[1], lab, fontsize=7)
    return markers_labels, markers_ts, markers_idx


def plot_dyad_section(df, ax, from_pandas=True) -> None:
    if not from_pandas:
        screen1_data, screen1_ts, screen2_data, screen2_ts, markers = df
    else:
        screen1_data, screen1_ts, screen2_data, screen2_ts, markers = realize_pandas_df(df)

    # markers extract
    _, _, markers_idx = plot_markers(markers, screen1_ts, ax)

    # touches information extract
    plot_dyad_data(screen1_data, screen2_data, ax, markers_idx)

    # Ts. difference calculation
    diff = np.abs(screen2_ts - screen1_ts)
    _max, _min, _miu, _std = np.max(diff), np.min(diff), np.mean(diff), np.std(diff)
    ax.set_title('Sync info: $\delta$ between 2 match samples. Max: %.3f, min: %.3f, $\mu$: %f, $\sigma$: %f' % (_max, _min, _miu, _std))


def create_grid():
    fig = plt.figure()
    gs = GridSpec(4, 2)
    plt.subplots_adjust(wspace=0.01)

    dyad_ax = fig.add_subplot(gs[0, :])

    subj1_motion_ax = fig.add_subplot(gs[1, 0])
    subj1_circles_ax = fig.add_subplot(gs[2, 0])
    subj1_tapping_ax = fig.add_subplot(gs[3, 0])
    subj1_motion_ax.set_title("Subject1")

    subj2_motion_ax = fig.add_subplot(gs[1, 1])
    subj2_circles_ax = fig.add_subplot(gs[2, 1])
    subj2_tapping_ax = fig.add_subplot(gs[3, 1])
    subj2_motion_ax.set_title("Subject2")
    slots = [dyad_ax, subj1_motion_ax, subj1_circles_ax, subj1_tapping_ax,
               subj2_motion_ax, subj2_circles_ax, subj2_tapping_ax]
    for ax in slots:
        ax.set_yticks([])
        ax.set_xticks([])

    fig.set_size_inches(18, 10)
    return [fig] + slots


def plot_dyad(ax, path, from_pandas=False):
    if not from_pandas:
        df = read_xdf_df(path)
        plot_dyad_section(df, ax, from_pandas=from_pandas)
    else:
        df = read_excel_df(path)
        plot_dyad_section(df, ax, from_pandas=from_pandas)


def plot_single(motion_ax, circles_ax, tapping_ax, path, subj_num=1, fig=None):
    subject = Subject(path)
    sessions_motion = [subject.sessions[s] for s in [motion_small, motion_big]]
    sessions_circles = [subject.sessions[s] for s in [circles_small, circles_big, circles_last]]
    sessions_tapping = [subject.sessions[s] for s in [tapping_small, tapping_big, tapping_last]]

    plot_single_section(sessions_motion, motion_ax, subject=subj_num)
    plot_single_section(sessions_circles, circles_ax, subject=subj_num)
    plot_single_section(sessions_tapping, tapping_ax, subject=subj_num, fig=fig)

    if subj_num == 2:
        motion_ax.set_yticks([])
        circles_ax.set_yticks([])
        tapping_ax.set_yticks([])


def get_dirs(dyad):
    dyad_dir, s1_dir, s2_dir = "", "", ""
    for f in os.listdir(ALL_DYADIC_DIR):
        if f.endswith(dyad):
            dyad_dir = ALL_DYADIC_DIR + "\\" + f
            break

    if dyad_dir == "":
        raise ValueError("Couldn't find directory of dyad")

    for f in os.listdir(ALL_SUBJECTS_DIR):
        if f.endswith(dyad):
            if s1_dir == "":
                s1_dir = ALL_SUBJECTS_DIR + "\\" + f
            else:
                s2_dir = ALL_SUBJECTS_DIR + "\\" + f
                break

    if s1_dir == "":
        raise ValueError("Couldn't find directory of subject1")
    if s2_dir == "":
        raise ValueError("Couldn't find directory of subject2")

    return dyad_dir, s1_dir, s2_dir


def quality_plot(dyad_dir: str, overwrite=False):
    for f in os.listdir(dyad_dir):
        if f == 'Quality_Plot.png' and not overwrite:
            return
    dyad = dyad_dir[-3:]
    dyad_dir, s1_dir, s2_dir = get_dirs(dyad)
    fig, dyad_ax, subj1_motion_ax, subj1_circles_ax, subj1_tapping_ax, \
    subj2_motion_ax, subj2_circles_ax, subj2_tapping_ax = create_grid()
    plot_dyad(dyad_ax, dyad_dir, from_pandas=True)
    try:
        plot_single(subj1_motion_ax, subj1_circles_ax, subj1_tapping_ax, s1_dir, subj_num=1, fig=fig)
        plot_single(subj2_motion_ax, subj2_circles_ax, subj2_tapping_ax, s2_dir, subj_num=2, fig=fig)
    except Exception as e:
            print("Error: {}".format(e.args))
    finally:
        fig.suptitle("Grays area length > {} seconds".format(stuck_threshold))
        plt.savefig(dyad_dir + "\\" + 'Quality_Plot.png')


if __name__ == "__main__":
    quality_plot(r'C:\Users\ayeletlab\Desktop\Data\d\d050', overwrite=True)


import pyxdf as xdf
import re
from util import ProgressBar as Bar
from Tapper.utils import *
from DyadicPostProcess import *


smooth = False

def identify_time_series(data):
    time_series = {}
    for ts in data:
        time_series[ts['info']['name'][0]] = ts
    return time_series


def extract_data(screen1, screen2):
    # get the time stamps
    screen1_ts = np.array(screen1['time_stamps'], dtype="float64")
    screen2_ts = np.array(screen2['time_stamps'], dtype="float64")
    _n1, _n2 = screen1_ts.shape[0], screen2_ts.shape[0]

    # get the data
    screen1_ts, screen2_ts = screen1_ts[:_n1], screen2_ts[:_n2]

    # align the data to the real-axis values
    screen1_data, screen2_data = screen1['time_series'][:_n1], screen2['time_series'][:_n2]
    screen1_data[:, 1] = screen1_data[:,1] * Y_AXIS_RATIO
    screen1_data[:, 4] = screen1_data[:, 4] * Y_AXIS_RATIO
    screen2_data[:, 1] = screen2_data[:, 1] * Y_AXIS_RATIO
    screen2_data[:, 4] = screen2_data[:, 4] * Y_AXIS_RATIO

    return screen1_data, screen1_ts, screen2_data, screen2_ts


def down_sample(screen1_data, screen1_ts, screen1_Hz, screen2_data, screen2_ts, screen2_Hz, target_Hz):
    screen1_N, screen2_N = screen1_ts.shape[0], screen2_ts.shape[0]

    # choose the short array to be down-sampled first
    if screen1_N < screen2_N:
        down_s_sec, down_s_first, N, orig_Hz = screen2_ts, screen1_ts, screen1_N, screen1_Hz
    else:
        down_s_sec, down_s_first, N, orig_Hz = screen1_ts, screen2_ts, screen2_N, screen2_Hz

    target_down_sampling_idx = np.arange(0, N, round(orig_Hz / target_Hz))
    down_s_first = down_s_first[target_down_sampling_idx]
    l, r, min_d = 0, 0, np.inf
    down_s_idx = []
    while r < len(down_s_sec) and l < len(down_s_first):
        diff = np.abs(down_s_first[l] - down_s_sec[r])
        if np.abs(diff) < min_d:
            min_d = diff
        else:
            down_s_idx.append(r - 1)
            l += 1
            min_d = np.inf
            r -= 1
        r += 1
    if r == len(down_s_sec):
        down_s_first = down_s_first[:len(down_s_idx)]
        target_down_sampling_idx = target_down_sampling_idx[:len(down_s_idx)]

    # remote_data, remote_data_ts, local_data, local_data_ts
    if screen1_N < screen2_N:
        return screen2_data[np.array(down_s_idx)], down_s_sec[np.array(down_s_idx)], screen1_data[target_down_sampling_idx], down_s_first
    else:
        return screen2_data[target_down_sampling_idx], down_s_first, screen1_data[np.array(down_s_idx)], down_s_sec[np.array(down_s_idx)]


def build_df(subj1, screen1_data, screen1_ts, subj2, screen2_data, screen2_ts, markers_cont):
    N = len(screen1_ts)
    columns = EXCEL_COLS_PER_TASK[DYADIC] + ['session']
    subj1_col, sub2_col = np.array([subj1] * N), np.array([subj2] * N)
    screen1_list = [sc_1 for sc_1 in screen1_data.T]
    screen2_list = [sc_2 for sc_2 in screen2_data.T]
    all_data_list = [subj1_col] + screen1_list + [screen1_ts, sub2_col] + screen2_list + [screen2_ts, markers_cont]
    df = pd.DataFrame(all_data_list).T
    df.columns = columns

    return df


def build_continuous_markers(markers, screen1_ts):
    markers_labels, markers_ts = np.array(markers["time_series"]), np.array(markers["time_stamps"])
    if markers_labels.shape[0] % 2 != 0:
        markers_labels = np.append(markers_labels, markers_dict[dyadic_no_leader_state]["STOP"])
        markers_ts = np.append(markers_ts, screen1_ts[-1])
    markers_labels = markers_labels.reshape(markers_ts.shape)
    markers_idx = np.searchsorted(screen1_ts, markers_ts)
    results = np.empty(len(screen1_ts), dtype='U15')    # 15 = length of stash marker
    results.fill("-----")
    for i in range(0, len(markers_labels), 2):
        start, end = markers_idx[i], markers_idx[i+1]
        label = markers_labels[i+1]
        label = label[2:] if label != STASH_MARKER else label  # fix stop label
        results[start:end] = label
    return results


def reset_between_markers(data, ts, markers):
    markers_ts = np.array(markers["time_stamps"])
    markers_idx = np.searchsorted(ts, markers_ts)
    markers_idx = np.r_[0, markers_idx]
    for i in range(1, len(markers_idx), 2):
        data[markers_idx[i-1,]:markers_idx[i],:] = -1
    return data

def load_xdf_as_data_frame(filename, to_pandas=False, smooth=False, downsample=True):
    """
    given a path to a .xdf file, convert it to raw arrays of data
    :param filename: path to .xdf file
    :param to_pandas: if specified, the function returns a pandas.DataFrame object
    :param smooth: if specified, a soft smooth operation is done
    :param downsample: if specified, a down-sampling is done. NOTICE that this is by default True, since the
                       down-sampling operation is crucial for the time series to be synchronized.
                       if False, than the results arrays will be in different dimensions
    :return: if to_pandas=False: return tuples of (screen1_data, screen1_ts, screen2_data, screen2_ts, markers)
                                 where  all data are the time series of the session, and markers is dictionary
                                 contains the keys: "time_series" & "time_stamps" that hold the markers information
             if to_pandas=True:  return a single DataFrame object
    """
    if to_pandas and not downsample:
        raise ValueError("'to_pandas' cannot be true if 'downsample' is false")

    data, header = xdf.load_xdf(filename, synchronize_clocks=True)

    # clear any irrelevant data LSL accidentally recorded...
    new_data = []
    for d in data:
        if d['info']['name'][0] in LSL_OUTLETS_NAMES:
            new_data.append(d)
    data = new_data

    subjects = re.findall(r"_s\d{3}_", filename)
    subj1, subj2 = subjects[0].strip("_").strip("s"), subjects[1].strip("_").strip("s")

    time_series_dict = identify_time_series(data)
    screen1, screen2, markers = time_series_dict[SCREEN_1_NAME], time_series_dict[SCREEN_2_NAME], time_series_dict[
        MARKERS_OUTLET_NAME]

    screen1_data, screen1_ts, screen2_data, screen2_ts = extract_data(screen1, screen2)

    # reset all out-of-sessions to -1 (in between markers)
    screen1_data = reset_between_markers(screen1_data, screen1_ts, markers)
    screen2_data = reset_between_markers(screen2_data, screen2_ts, markers)

    if smooth:
        # soft smooth
        screen1_data = soft_smooth(screen1_data, screen1_ts, markers)
        screen2_data = soft_smooth(screen2_data, screen2_ts, markers)

    # extract effectively sample rates
    screen1_Hz, screen2_Hz = screen1['info']['effective_srate'], screen2['info']['effective_srate']

    if downsample:
        # down sample
        screen2_data, screen2_ts, screen1_data, screen1_ts = down_sample(screen1_data, screen1_ts, screen1_Hz, screen2_data,
                                                                         screen2_ts, screen2_Hz, target_Hz=target_srate)
    if to_pandas:
        markers_cont = build_continuous_markers(markers, screen1_ts)
        return build_df(subj1, screen1_data, screen1_ts, subj2, screen2_data, screen2_ts, markers_cont)
    return screen1_data, screen1_ts, screen2_data, screen2_ts, markers


def convert_xdf_to_excel(directory, smooth=False, downsample=True):

    files = os.listdir(directory)
    to_analyze = True
    # for file in files:
    #     if file.endswith(".xlsx"):
    #         to_analyze = False
    #         break
    if to_analyze:
        for file in files:
            if file.endswith(".xdf"):
                filename = directory + "\\" + file
                df = load_xdf_as_data_frame(filename, to_pandas=True)
                if smooth:
                    df.to_excel(filename[:-4] + "_smooth.xlsx")
                else:
                    df.to_excel(filename[:-4] + ".xlsx")


def realize_pandas_df(df):
    data_col = [ch_x % 1, ch_y % 1, tap_ID % 1, ch_x % 2, ch_y % 2, tap_ID % 2]
    ts_col = "TS"

    # data from screen 1
    screen1_data = df[data_col].to_numpy()
    screen1_ts = df[ts_col].to_numpy()

    # data from screen 1
    screen2_data = df[["{}.1".format(c) for c in data_col]].to_numpy()
    screen2_ts = df[ts_col + ".1"].to_numpy()

    # markers dictionary
    dict = {"time_series" : [], "time_stamps" :[]}
    markers = df["session"].to_numpy()
    not_sessions = np.argwhere(markers == "-----").flatten()
    diff = (not_sessions[1:] - not_sessions[:-1]).flatten()
    starts = not_sessions[np.argwhere(diff > 1)].flatten() + 1
    ends = not_sessions[np.argwhere(diff > 1) + 1].flatten() - 1
    labels = markers[starts]
    for label, st, en in zip(labels, starts, ends):
        dict["time_series"].append(label)
        dict["time_series"].append(label)
        dict["time_stamps"].append(min(df["TS"][st], df["TS.1"][st]))
        dict["time_stamps"].append(max(df["TS"][en], df["TS.1"][en]))

    return screen1_data, screen1_ts, screen2_data, screen2_ts, dict


def read_excel_df(path):
    for file in os.listdir(path):
        if file.endswith(".xlsx"):
            return pd.read_excel(path + "\\" + file)
    raise ValueError("Directory does not contain excel file")


def read_xdf_df(path):
    for file in os.listdir(path):
        if file.endswith(".xdf"):
            df = load_xdf_as_data_frame(path + "\\" + file)
            return df
    raise ValueError("Directory does not contain xdf file")


def do_for_all_directories(root_dir, func, **kwargs):
    total = 0
    for subdir, dirs, files in os.walk(root_dir):
        total += len(dirs)

    bar = Bar(total)
    # traverse the root directory and its children directories
    for subdir, dirs, files in os.walk(root_dir):
        try:
            if subdir != root_dir:
                func(subdir, **kwargs)
        except Exception as e:
            print("Couldn't operate in directory: {}. Error: {}".format(subdir, e.args))
        finally:
            bar.step_and_print()

def create_smooth_and_unsmooth_df(dyads : list):
    smooth = True
    for d in dyads:
        dir = SINGLE_DYADIC_DIR % d
        convert_xdf_to_excel(dir, smooth)
        smooth = not smooth
        convert_xdf_to_excel(dir, smooth)
        smooth = not smooth
    exit()

def animate_original_xdf(explicit_xdf_path):
    screen1_data, screen1_ts, screen2_data, screen2_ts, markers = load_xdf_as_data_frame(explicit_xdf_path,
                                                                                         smooth=False, downsample=True)
    from SessionAnimator import DataPlotApp             # comment this for debugging
    DataPlotApp(screen1_data, screen2_data, 2).run()       # comment this for debugging
    exit()


def specific_dyads(dyads):
    bar = Bar(len(dyads) * 2)
    for d in dyads:
        dir = SINGLE_DYADIC_DIR % d
        convert_xdf_to_excel(dir)
        bar.step_and_print(text="Converted dyad %s to excel" % d)
        quality_plot(dir, overwrite=True)
        bar.step_and_print(text="Plotted dyad %s quality-plot" % d)
    exit()


if __name__ == "__main__":
    from QualityPlot import quality_plot
    # Each function here EXIT the program upon return, so only the first one actually runs

    # create a single .xlsx dataframe from .xdf file
    convert_xdf_to_excel(SINGLE_DYADIC_DIR % "035")
    exit()

    animate_original_xdf(ALL_DYADIC_DIR + r"\d035\d035_s069_rk_s070_ab.xdf")

    dyads = ["0%d" % d for d in [30, 42]]
    create_smooth_and_unsmooth_df(dyads)

    # specific processing
    specific_dyads(dyads)

    # batch processing
    root_dir = ALL_DYADIC_DIR
    # convert all .xdf files to excel DataFrames
    do_for_all_directories(root_dir, convert_xdf_to_excel)
    # plot quality of the session
    do_for_all_directories(root_dir, quality_plot, overwrite=False)

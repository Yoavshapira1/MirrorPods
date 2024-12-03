from Development.QualityPlot import *
import pandas as pd
from scipy.ndimage import gaussian_filter1d


def interpolate(data):
    nan = np.argwhere(data == -1)
    data[nan] = np.nan
    not_nan = np.logical_not(np.isnan(data))
    idx = np.arange(len(data))
    data = np.interp(idx, idx[not_nan], data[not_nan])
    return data


def preprocess_raw_data(data, hands=1):
    data[:, 0] = interpolate(data[:, 0])
    data[:, 1] = interpolate(data[:, 1])
    if hands == 2:
        data[:, 3] = interpolate(data[:, 3])
        data[:, 4] = interpolate(data[:, 4])
    return data


def get_velocity_vector(pos, time, hands=1):
    dt = time[1:] - time[:-1]
    hand1 = pos[:, 0:2]
    vel2 = None
    dist1 = np.linalg.norm(hand1[1:] - hand1[:-1], axis=1)
    vel1 = dist1 / dt
    if hands == 2:
        hands2 = pos[:, 3:5]
        dist2 = np.linalg.norm(hands2[0:] - hands2[:-1], axis=1)
        vel2 = dist2 / dt,
    return vel1, vel2


def smooth_vector(vel, filter_size_freq=None, sample_rate=None):
    kernel = int(np.floor(sample_rate / filter_size_freq))
    return gaussian_filter1d(vel, kernel), kernel


def export_session_velocity_vec(data, ts, markers_idx, markers_labels, session, session_idx=0, filter_size=6):
    _LL_data, _LL_ts = get_session(markers_dict[session]["START"],
                                   markers_dict[session]["STOP"], session_idx,
                                   markers_idx, markers_labels, data, ts)
    _LL_touch = np.argwhere(_LL_data[:,0] != -1)
    _LL_start, _LL_end = _LL_touch[0][0], _LL_touch[-1][0]
    _LL_data, _LL_ts = _LL_data[_LL_start:_LL_end], _LL_ts[_LL_start:_LL_end]
    _LL_data = preprocess_raw_data(_LL_data)
    _LL_vel1, _ = get_velocity_vector(_LL_data, _LL_ts)
    _LL_vel1_filtered, kernel = smooth_vector(_LL_vel1, filter_size_freq=filter_size, sample_rate=target_srate)
    vel_df = pd.DataFrame({"vel": _LL_vel1, "filtered": _LL_vel1_filtered})
    vel_df.to_excel("vel.xlsx", index=False)
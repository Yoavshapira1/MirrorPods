import os

import numpy
from matplotlib import pyplot as plt
import numpy as np
import pandas as pd

from Tapper.utils import SINGLE_DYADIC_DIR, target_srate, ch_x, ch_y, tap_ID, time_stamp, right_x, left_x, right_y, \
    left_y

sess = 1
path = r'C:\Users\yoavsha\Desktop\LSL\Development\distancesHistograms\new'

def intersection_points(a, *others):
    if a.ndim != 1 or any(other.shape != a.shape for other in others):
        raise ValueError('The arrays must be single dimensional and the same length')
    others = np.array(others)
    indices = np.argwhere(
        ((a[:-1] < others[..., :-1]) & (a[1:] > others[..., 1:])) |
        ((a[:-1] > others[..., :-1]) & (a[1:] < others[..., 1:])) |
        (a[:-1] == others[..., :-1]))
    results = indices[indices[:, 1].argsort()][:, 1]  # sort by i
    # if there are odd number of intersections, consider the last index as an intersection point
    if len(results) % 2 != 0:
        results = np.append(results, a.shape[0])
    return results


def get_ds(data):
    dist = np.linalg.norm(data[1:] - data[:-1], axis=1)
    return dist / (1 / target_srate)


def find_first_sequence_indices(raw_data, seq, cond):
    # find the first index where a sequence of len(seq) is satisfying a given condition (cond)
    # ! ! ! Data MUST be in a proper shape for condition to work at ! ! !

    try:
        arg = np.argwhere(cond(raw_data)).flatten()
        diff = (arg[1:] - arg[:-1]).flatten()
        sequence = [1] * seq
        sequence_idx = [i for i in range(0, len(diff)) if list(diff[i:i + len(sequence)]) == sequence]
        first_idx = arg[sequence_idx[0]]
    except Exception:
        first_idx = None
    return first_idx


def rename_columns(subj, left, right):
    subj.rename(columns={ch_x % right: right_x}, inplace=True)
    subj.rename(columns={ch_y % right: right_y}, inplace=True)
    subj.rename(columns={ch_x % left: left_x}, inplace=True)
    subj.rename(columns={ch_y % left: left_y}, inplace=True)


def distinguish_left_and_right(subj1, subj2):
    # find out what channel is corresponding with left hand and what channels
    # is corresponding with right hand  for both subjects

    # find first time stamp where both hands on the screen
    condition = lambda arr: np.all(arr > 0, axis=1)
    subj1_first = find_first_sequence_indices(np.c_[subj1[ch_x % 1], subj1[ch_x % 2]], seq=target_srate, cond=condition)

    if subj1[ch_x % 1][subj1_first] < subj1[ch_x % 2][subj1_first]:
        rename_columns(subj1, left=2, right=1)
    else:
        rename_columns(subj1, left=1, right=2)

    subj2_first = find_first_sequence_indices(np.c_[subj2[ch_x % 1], subj2[ch_x % 2]], seq=target_srate, cond=condition)
    if subj2[ch_x % 1][subj2_first] < subj2[ch_x % 2][subj2_first]:
        rename_columns(subj2, left=1, right=2)
    else:
        rename_columns(subj2, left=2, right=1)

    return subj1_first, subj2_first


def plot_histograms(data_list, titles, colors, path):
    plt.cla()
    global sess, dyad
    fig, axs = plt.subplots(2, 2, sharey=True)
    fig.set_size_inches(18, 10)
    for data, title, ax, c in zip(data_list, titles, axs.flatten(), colors):
        ax.hist(data, color=c, bins=60)
        ax.set_title(title)
        ax.set_xlim(0, 1)
        ax.set_ylim(0, 10000)

    plt.savefig(r'%s\%s\d%s_%d' % (path, dyad, dyad, sess))


def cast_df_to_numpy_coor(subj1, subj2):
    subj1_right = np.c_[subj1[right_x].to_numpy(), subj1[right_y].to_numpy()]
    subj1_left = np.c_[subj1[left_x].to_numpy(), subj1[left_y].to_numpy()]
    subj2_right = np.c_[subj2[right_x].to_numpy(), subj2[right_y].to_numpy()]
    subj2_left = np.c_[subj2[left_x].to_numpy(), subj2[left_y].to_numpy()]

    return subj1_right, subj1_left, subj2_right, subj2_left


def define_distances(subj1_right, subj1_left, subj2_right, subj2_left, subj1_first, subj2_first):
    sub1_right_twin_ds = np.linalg.norm((subj1_right - subj2_left), axis=1)
    sub1_right_other_ds = np.linalg.norm((subj1_right - subj2_right), axis=1)
    sub1_left_twin_ds = np.linalg.norm((subj1_left - subj2_right), axis=1)
    sub1_left_other_ds = np.linalg.norm((subj1_left - subj2_left), axis=1)
    subj1_self_ds = np.linalg.norm((subj1_right - subj1_left), axis=1)
    subj2_self_ds = np.linalg.norm((subj2_right - subj2_left), axis=1)

    subj1_dist_dict = {"self_ds": subj1_self_ds,
                       "right_twin_ds": sub1_right_twin_ds,
                       "right_other_ds": sub1_right_other_ds,
                       "left_twin_ds": sub1_left_twin_ds,
                       "left_other_ds": sub1_left_other_ds,
                       "both_hands_first_sample": subj1_first
                       }
    subj2_dist_dict = {"self_ds": subj2_self_ds,
                       "right_twin_ds": sub1_left_twin_ds,
                       "right_other_ds": sub1_right_other_ds,
                       "left_twin_ds": sub1_right_twin_ds,
                       "left_other_ds": sub1_left_other_ds,
                       "both_hands_first_sample": subj2_first
                       }

    dist_dict = {1: subj1_dist_dict, 2: subj2_dist_dict}

    return dist_dict


def find_switching_point(left, right):
    # Algorithm:
    # initialize P, seq = [], [] hold for suspected points
    # define distances vector between 2 consecutive samples (total 4 vectors)
    #   i.e: LR will be the distance from right hand position in sample t+1, to left hand position in sample t
    # define T = argwhere(LL > LR), hold for the suspected points for switching hands
    # for t in T:
    #   if LL[t-1] <= LR[t-1] and L[t-1] != R[t-1]:
    #       add t to P
    #
    # define eq = argwhere(L == R), a boolean array
    # define inter = intersections of eq with the line x=0.5
    # initialize seq = []
    # for s,e consecutive indices in inter:
    #   if e - s < TH:
    #       add (s,e) to seq
    #
    # for s,e in seq:
    #   if LL[e+1] > RL[s-1]:
    #       add s to P
    #
    # sort P
    # return?? supposed to be exactly 1 point

    # initialize P = [], hold for suspected points
    P, seq = [0], []
    TH = 5  # threshold, in seconds
    # define distances vector between 2 consecutive samples (total 4 vectors)
    LL = np.linalg.norm((left[1:] - left[:-1]), axis=1)
    LR = np.linalg.norm((right[1:] - left[:-1]), axis=1)
    RR = np.linalg.norm((right[1:] - right[:-1]), axis=1)
    RL = np.linalg.norm((left[1:] - right[:-1]), axis=1)

    # define T = argwhere(LL > LR), hold for the suspected points for switching hands
    T = np.argwhere(LL > LR)[1:] + 1
    for t in T:
        if not np.all((left[t - 1] == right[t - 1])):
            if t[0] - P[-1] > 5:
                P.append(t[0])

    P = P[1:]
    # define eq = argwhere(L == R), a boolean array
    eq = np.zeros(left.shape[0])
    eq[np.argwhere((left[:, 0] == right[:, 0]) & (left[:, 1] == right[:, 1]))] = 1
    # define inter = intersections of eq with the line x=0.5
    inter = intersection_points(eq, np.ones(eq.shape) * 0.5)[1:-1]
    seq = []
    if inter.shape[0] % 2 != 0:
        inter = np.c_[inter, left.shape[0]]
    # for s,e consecutive indices in inter:
    for j in range(inter.shape[0] // 2):
        s, e = inter[2 * j], inter[(2 * j) + 1]
        if e - s < TH * target_srate:
            seq.append((s, e))

    for s, e in seq:
        if LL[e + 1] > LR[s - 1]:
            P.append(s)

    return P


def check_if_subjects_agree(distances, a, b, window=1., per=0.9):
    # check if subjects' hands are compatible around two specific samples of a and b
    # the windows been calculated before and after a, b - respectively
    # compatibility = agreement on hands for more than 'per' percents

    # convert window (in sec.) to sample
    offset = int(window * target_srate)
    right_twin_ds = distances[1]["right_twin_ds"]
    right_other_ds = distances[1]["right_other_ds"]
    left_twin_ds = distances[1]["left_twin_ds"]
    left_other_ds = distances[1]["left_other_ds"]

    before_left = left_twin_ds[a - offset:a] < left_other_ds[a - offset:a]
    before_left_agrees = np.sum(before_left) / before_left.shape[0] > per
    before_right = right_twin_ds[a - offset:a] < right_other_ds[a - offset:a]
    before_right_agrees = np.sum(before_left) / before_right.shape[0] > per and before_left_agrees

    after_left = left_twin_ds[b:b + offset] < left_other_ds[b:b + offset]
    after_left_agrees = np.sum(after_left) / after_left.shape[0] > per
    after_right = right_twin_ds[b:b + offset] < right_other_ds[b:b + offset]
    after_right_agrees = np.sum(after_left) / after_right.shape[0] > per and after_left_agrees

    return before_right_agrees and after_right_agrees


def fix_switching_hands(subj1, subj2, subj1_first, subj2_first, dist_thr=0.08, ignore_ver_thr=0.03):
    global sess, path
    try:
        os.mkdir(r'%s\%s' % (path, dyad))
    except:
        pass

    # finding the time stamps where a switching is performed
    # a switching is a situation where d(other) > d(same) for more then a certain threshold time
    # where "other" and "same" corresponding to the left and right hands
    # NOTICE: the reference hand here is the right hand of subject 1

    # cast panda's DataFrame to numpy arrays of coordinates - (N, 2) shape
    subj1_right, subj1_left, subj2_right, subj2_left = cast_df_to_numpy_coor(subj1, subj2)
    subj_dict = {1: {'left': subj1_left, 'right': subj1_right},
                 2: {'left': subj2_left, 'right': subj2_right}}
    N = subj1_right.shape[0]

    # Algorithm for finding points:
    #   initial S_1, S_2 = [], []
    #   Define self-distances [self] & other-distances [other] (for both subjects)
    #   for i in subjects:
    #       find intersection of self with x=TH
    #       insure that self[0] > TH, and than: couple consecutive intersections points (if odd - last with last sample)
    #       for each a,b in couples:
    #           do the follows IFF |a[x] - b[x]| > some threshold (avoid vertical movements spots)
    #           check if subjects agrees on hands in a AND in b. in not:
    #               for k in subjects:
    #                   try to find c - a switching point c in k_data[a,b]
    #                   if found:
    #                       add c to S_i and BREAK
    #               if no such c was found:
    #                   force c: compare minimal self-distance points between s1 and s2, and add the minimal to
    #                            the proper group S_i
    #

    # Algorithm for fixing points:
    # for i in subjects:
    #   sort S_i
    #   couple consecutive points in S_i
    #   for s,e in couples:
    #       switch hands in i_data[s,e]

    ############################################## Implementation #############################################

    # initial S_1, S_2 = [], []
    S1, S2 = [], []

    # Define self-distances [self] & other-distances [other] (for both subjects)
    # There are 3 kind of distances:
    # self_ds = distance between two hands of the subject
    # <hand>_twin_ds = distance between <hand> and the twin hand (if <hand> is right, then the twin is left)
    # <hand>_other_ds = distance between <hand> and the not-twin hand (if <hand> is right, then the not-twin is right)
    # All-in-all, there are 6 different distances vectors

    dist_dict = define_distances(subj1_right, subj1_left, subj2_right, subj2_left, subj1_first, subj2_first)
    # for i in subjects
    for i in range(1, 3):
        distances = dist_dict[i]
        self_ds = distances["self_ds"]
        right_twin_ds = distances["right_twin_ds"]
        right_other_ds = distances["right_other_ds"]
        left_twin_ds = distances["left_twin_ds"]
        left_other_ds = distances["left_other_ds"]
        first_sample = distances["both_hands_first_sample"]
        subj_left, subj_right = subj_dict[i]["left"], subj_dict[i]["right"]

        # find intersection of self with x=TH
        TH = np.ones(shape=self_ds.shape) * dist_thr
        hands_close_points = intersection_points(self_ds, TH)[1:-1]  # first and last are dump

        # insure that self[0] > TH
        assert self_ds[first_sample] > dist_thr

        # couple consecutive intersections points (if odd - last with last sample)
        if hands_close_points.shape[0] % 2 != 0:
            hands_close_points = np.hstack([hands_close_points, N - 1])

        # for each a,b in couples:
        # do the follows IFF |a[x] - b[x]| > some threshold (avoid vertical movements spots)
        for j in range(hands_close_points.shape[0] // 2):
            a, b = hands_close_points[2 * j], hands_close_points[(2 * j) + 1]
            if (abs(subj_left[a][0] - subj_right[a][0]) < ignore_ver_thr and
                abs(subj_left[b][0] - subj_right[b][0]) < ignore_ver_thr):
                continue

            # check if subjects agrees on hands in a AND in b
            subjects_agree = check_if_subjects_agree(dist_dict, a, b)
            if not subjects_agree:
                for k in range(1, 3):
                    left, right = subj_dict[k]["left"], subj_dict[k]["right"]
                    c = find_switching_point(left[a:b], right[a:b])
                    if c:
                        S1.append(c+a) if k == 1 else S2.append(c+a)
                        break
                    if not c and k == 2:
                        S1.append("forced c") if a % 2 == 0 else S2.append("forced c")
                        # TODO: force c: compare minimal self-distance points between s1 and s2, and
                        # add the minimal to the proper group S_i

        for xc in S1:
            plt.axvline(x=xc, color='blue', linestyle='--', linewidth=0.5)
        for xc in S2:
            plt.axvline(x=xc, color='red', linestyle=':', linewidth=0.5)
        plt.show()

    # Algorithm ofr fixing points:
    # for i in subjects:
    #   sort S_i
    #   couple consecutive points in S_i
    #   for s,e in couples:
    #       switch hands in i_data[s,e]

    # *********************************************************************************************

    #
    # if with_hist:
    #     colors = ['orange', 'red', 'green', 'blue', 'black', 'black']
    #     plot_histograms([ref_left_with_other, ref_right_with_other, ref_left_with_same, ref_right_with_same],
    #                     titles=['ref_right_with_other', 'ref_left_with_other', 'ref_right_with_same', 'ref_left_with_same'],
    #                     colors=colors[:5], path=path)
    #
    # ref_same_intersection_ref_other = intersection_points(ref_right_with_same, ref_right_with_other)
    #
    # fig = plt.figure()
    # # switching_points = []
    # # for i in range(0, len(ref_same_intersection_ref_other) - 1, 2):
    # #     p1, p2 = ref_same_intersection_ref_other[i], ref_same_intersection_ref_other[i+1]
    # #     interval_other, interval_same = ref_left_with_other[p1:p2], ref_left_with_same[p1:p2]
    # #     if np.sum(np.less(interval_other, interval_same)) >= threshold * interval_other.shape[0]:
    # #         switching_points.append(p1)
    # # plt.scatter(switching_points, [0.5 for i in range(len(switching_points))])
    #
    # # for xc in ref_same_intersection_ref_other:
    # #     plt.axvline(x=xc, color='k', linestyle='--', linewidth=0.3)
    #
    # plt.plot(ref_right_with_same, c='blue', alpha=0.7, label="Right with Same")
    # plt.plot(ref_right_with_other, c='red', alpha=0.4, label="Right with Other")
    # plt.plot(ref_left_with_same, c='green', alpha=0.7, label="Left with Same")
    # plt.plot(ref_left_with_other, c='orange', alpha=0.4, label="Left with Other")
    # plt.plot(ref_right_with_left, c='black', alpha=0.7, label="Right and Left")
    # plt.legend()
    # fig.set_size_inches(18, 10)
    #
    # plt.show()
    # # plt.savefig(r'%s\%s\d%s_%d_distances' % (path, dyad, dyad, sess))
    # sess += 1


def force_finding_point(start, end, subj_data_dict):
    left, right = subj_data_dict["left"], subj_data_dict["right"]
    c = np.argmin(np.linalg.norm(left[start:end] - right[start:end], axis=1))
    ds = np.inf
    if c:
        ds = np.linalg.norm(left[c + start] - right[c + start])
        return c + start, ds
    if not c:
        return -1, ds


def _recursive_helper(subj_i, start, end, subj_data, dist_dict, dist_thr, window, stop_thr=0.2):
    disagreements, lengths = [], []

    if end - start < stop_thr:
        return force_finding_point(start, end, subj_data)

    self_ds = dist_dict[subj_i]["self_ds"][start:end]

    # find intersection of self with x=TH
    TH = np.ones(shape=self_ds.shape) * dist_thr
    hands_close_points = intersection_points(self_ds, TH) + start

    # couple consecutive intersections points (if odd - last with last sample)
    if hands_close_points.shape[0] % 2 != 0:
        hands_close_points = np.hstack([hands_close_points, end - start - 1])

    for j in range(hands_close_points.shape[0] // 2):
        a, b = hands_close_points[2 * j], hands_close_points[(2 * j) + 1]
        subjects_agree = check_if_subjects_agree(dist_dict, a, b, window=window)
        if not subjects_agree:
            disagreements.append((a, b))
            lengths.append(b - a)

    if len(hands_close_points) == 0 or len(disagreements) == 0:
        return force_finding_point(start, end, subj_data)

    a, b = disagreements[np.argsort(lengths)[-1]]   # take the longest range
    return _recursive_helper(subj_i, a, b, subj_data, dist_dict, 0.75*dist_thr, 0.75*window, stop_thr)


def find_max_variance(p_list, i_list, subj_dict, win=13):
    # calculate the variance of the position relatively to the area they cover
    # choose the index that implies the maximal ratio Var / Area
    vars, offset = [], int(win // 2)
    for p, i in zip(p_list, i_list):
        left, right = subj_dict[i]['left'], subj_dict[i]['right']
        left = left[int(p-offset):int(p+offset)]
        right = right[int(p-offset):int(p+offset)]
        var_left = np.var(left)
        var_right = np.var(right)
        area = (np.max(left[:,1]) - np.min(left[:,1])) * (np.max(left[:,0]) - np.min(left[:,0]))
        vars.append((var_left + var_right) / (2 * area))
    return np.argmax(vars)


def gather_suspects_points(P1, P2, a, b):
    P1_indices = np.where((P1 >= a) & (P1 <= b))[0]
    from_P1 = P1[P1_indices] if len(P1_indices) > 0 else []
    P2_indices = np.where((P2 >= a) & (P2 <= b))[0]
    from_P2 = P2[P2_indices] if len(P2_indices) > 0 else []
    suspects = np.r_[from_P1, from_P2]
    origins = np.array([1 for _ in from_P1] + [2 for _ in from_P2])
    return suspects, origins


def fix_switching_hands_recursion_plus(subj1, subj2, subj1_first, subj2_first, dist_thr=0.08, win=1., stop_thr=0.1):
    global sess, path
    try:
        os.mkdir(r'%s\%s' % (path, dyad))
    except:
        pass

    # Algorithm for finding points:
    #   initial S_1, S_2 = [], []
    #   for i in subjects
    #       define P_i = find_switching_point(subj_i_left, subj_i_right)
    #
    #   Define self-distances [self] & other-distances [other] (for both subjects)
    #   find intersection of self with x=TH
    #   insure that self[0] > TH, and than: couple consecutive intersections points (if odd - last with last sample)
    #
    #   for each a,b in couples:
    #       if NOT agree on hands around a & b:
    #           define suspects = points from P_1, P_2 that are in [a,b]
    #           define origins = [origin of s for all s in suspects]
    #           if suspects:
    #               add suspects[i] where i = argMax(Variance around s in suspects) to S_[origins[i]]
    #           else:
    #           define l, ds, orig = None, np.inf, 0
    #           for i in subjects:
    #               l_hat, ds_hat = _helper(a, b, i, data, distances, 0.5*dist_thr, 0.5*win, stop_thr)
    #               if ds_hat <= ds:
    #                   l, ds, orig = l_hat, ds_hat, i
    #           assert orig != 0
    #           add l to suspects, i to origins
    #
    # Helper Recursive Definition: (a, b, i, data_dict, dist_dict, dist_th, window, stop_thr)
    #       define disagreements, lengths = [], []
    #       if b-a < stop_thr:
    #           return add_switching_point_to_list(a, b, i, force=True)
    #
    #       find intersection of self with x=dist_th
    #       for each a,b in couples:
    #           if NOT agree on hands in a,b for window:
    #               add (a,b) to disagreements
    #               add |a-b| to lengths
    #       define a,b = disagreements[argmax(lengths)]:
    #           return _helper(i, a, b, subj_i, distances, 0.5*dist_thr, 0.5*win, stop_thr)
    #
    # Algorithm for fixing points:
    # for i in subjects:
    #   sort S_i
    #   couple consecutive points in S_i
    #   for s,e in couples:
    #       switch hands in i_data[s,e]
    #
    #
    ############################################## Implementation #############################################
    #
    # finding the time stamps where a switching is performed
    # a switching is a situation where d(other) > d(same) for more then a certain threshold time
    # where "other" and "same" corresponding to the left and right hands
    # NOTICE: the reference hand here is the right hand of subject 1

    # cast panda's DataFrame to numpy arrays of coordinates - (N, 2) shape
    subj1_right, subj1_left, subj2_right, subj2_left = cast_df_to_numpy_coor(subj1, subj2)
    subj_dict = {1: {'left': subj1_left, 'right': subj1_right},
                 2: {'left': subj2_left, 'right': subj2_right}}
    N = subj1_right.shape[0]

    stop_thr = target_srate * stop_thr      # convert stop threshold from seconds to samples

    # initial S_1, S_2 = [], []
    S1, S2 = [], []

    # for i in subjects
    #   define P_i = find_switching_point(subj_i_left, subj_i_right)
    P1, P2 = find_switching_point(subj1_left, subj1_right), find_switching_point(subj2_left, subj2_right)

    # Define self-distances [self] & other-distances [other] (for both subjects)
    # There are 3 kind of distances:
    # self_ds = distance between two hands of the subject
    # <hand>_twin_ds = distance between <hand> and the twin hand (if <hand> is right, then the twin is left)
    # <hand>_other_ds = distance between <hand> and the not-twin hand (if <hand> is right, then the not-twin is right)
    # All-in-all, there are 6 different distances vectors

    dist_dict = define_distances(subj1_right, subj1_left, subj2_right, subj2_left, subj1_first, subj2_first)
    self_ds = dist_dict[1]["self_ds"]
    first_sample = dist_dict[1]["both_hands_first_sample"]

    # find intersection of self with x=TH
    TH = np.ones(shape=self_ds.shape) * dist_thr
    hands_close_points = intersection_points(self_ds, TH)[1:-1]  # first and last are dump

    # insure that self[0] > TH
    assert self_ds[first_sample] > dist_thr

    # couple consecutive intersections points (if odd - last with last sample)
    if hands_close_points.shape[0] % 2 != 0:
        hands_close_points = np.hstack([hands_close_points, N - 1])

    disagreements = []

    # for each a,b in couples:
    # do the follows IFF |a[x] - b[x]| > some threshold (avoid vertical movements spots)
    for j in range(hands_close_points.shape[0] // 2):
        a, b = hands_close_points[2 * j], hands_close_points[(2 * j) + 1]

        # check if subjects agrees on hands in a AND in b
        subjects_agree = check_if_subjects_agree(dist_dict, a, b)
        if not subjects_agree:
            disagreements.append((a, b))
            # define suspects = points from P_1, P_2 that are in [a,b]
            # define origins = [origin of s for all s in suspects]
            suspects, origins = gather_suspects_points(np.array(P1), np.array(P2), a, b)

            if len(suspects) > 0:
                i = find_max_variance(suspects, origins, subj_dict)
                # add suspects[i] where i = argMax(Variance around s in suspects) to S_[origins[i]]
                S1.append(suspects[i]) if origins[i] == 1 else S2.append(suspects[i])

            else:
                # define l, ds, orig = None, np.inf, 0
                # for i in subjects:
                # l_hat, ds_hat = _helper(a, b, i, data, distances, 0.5*dist_thr, 0.5*win, stop_thr)
                l, ds, orig = None, np.inf, 0
                for i in range(1, 3):
                    l_hat, ds_hat = _recursive_helper(i, a, b, subj_dict[i], dist_dict,
                                                      dist_thr=0.75*dist_thr, window=0.75*win, stop_thr=stop_thr)
                    if ds_hat <= ds:
                        l, ds, orig = l_hat, ds_hat, i

                assert orig != 0
                S1.append(l) if orig == 1 else S2.append(l)

    print(disagreements)
    print(S1)
    print(S2)
    for xc in S1:
        plt.axvline(x=xc, color='blue', linestyle='--', linewidth=0.5)
    for xc in S2:
        plt.axvline(x=xc, color='red', linestyle=':', linewidth=0.5)
    plt.show()

    # Algorithm ofr fixing points:
    # for i in subjects:
    #   sort S_i
    #   couple consecutive points in S_i
    #   for s,e in couples:
    #       switch hands in i_data[s,e]


def fix_switching_hands_recursively(subj1, subj2, subj1_first, subj2_first, dist_thr=0.08, win=1., stop_thr=0.1):
    # Algorithm for finding points:
    #   initial S_1, S_2 = [], []
    #   Define self-distances [self] & other-distances [other] (for both subjects)
    #   find intersection of self with x=TH
    #   insure that self[0] > TH, and than: couple consecutive intersections points (if odd - last with last sample)
    #   for each a,b in couples:
    #       check if subjects agrees on hands in a AND in b for window=win. in not:
    #           for i in subjects:
    #               call _helper(Si, a, b, i, data, distances, 0.5*dist_thr, 0.5*win, stop_thr)
    #
    #
    # Helper Recursive Definition: (S, a, b, i, data_dict, dist_dict, dist_th, window, stop_thr)
    #       define disagreements, lengths = [], []
    #       to_force = b-a < stop_thr
    #       success = add_switching_point_to_list(S, a, b, i, force=to_force) -> trying to find a switch point
    #       if success:
    #           return
    #
    #       find intersection of self with x=dist_th
    #       for each a,b in couples:
    #           if NOT agree on hands in a,b for window:
    #               add (a,b) to disagreements
    #               add |a-b| to lengths
    #       define a,b = disagreements[argmax(lengths)]:
    #           _helper(S_i, i, a, b, subj_i, distances, 0.5*dist_thr, 0.5*win, stop_thr)
    #
    # Algorithm for fixing points:
    # for i in subjects:
    #   sort S_i
    #   couple consecutive points in S_i
    #   for s,e in couples:
    #       switch hands in i_data[s,e]
    #
    ############################################## Implementation #############################################
    #
    # finding the time stamps where a switching is performed
    # a switching is a situation where d(other) > d(same) for more then a certain threshold time
    # where "other" and "same" corresponding to the left and right hands
    # NOTICE: the reference hand here is the right hand of subject 1

    # cast panda's DataFrame to numpy arrays of coordinates - (N, 2) shape
    subj1_right, subj1_left, subj2_right, subj2_left = cast_df_to_numpy_coor(subj1, subj2)
    subj_dict = {1: {'left': subj1_left, 'right': subj1_right},
                 2: {'left': subj2_left, 'right': subj2_right}}
    N = subj1_right.shape[0]

    p = find_switching_point(subj2_left, subj2_right)

    stop_thr = target_srate * stop_thr      # convert stop threshold from seconds to samples

    # initial S_1, S_2 = [], []
    S1, S2 = [], []

    # Define self-distances [self] & other-distances [other] (for both subjects)
    # There are 3 kind of distances:
    # self_ds = distance between two hands of the subject
    # <hand>_twin_ds = distance between <hand> and the twin hand (if <hand> is right, then the twin is left)
    # <hand>_other_ds = distance between <hand> and the not-twin hand (if <hand> is right, then the not-twin is right)
    # All-in-all, there are 6 different distances vectors

    dist_dict = define_distances(subj1_right, subj1_left, subj2_right, subj2_left, subj1_first, subj2_first)
    self_ds = dist_dict[1]["self_ds"]
    first_sample = dist_dict[1]["both_hands_first_sample"]

    # find intersection of self with x=TH
    TH = np.ones(shape=self_ds.shape) * dist_thr
    hands_close_points = intersection_points(self_ds, TH)[1:-1]  # first and last are dump

    # insure that self[0] > TH
    assert self_ds[first_sample] > dist_thr

    # couple consecutive intersections points (if odd - last with last sample)
    if hands_close_points.shape[0] % 2 != 0:
        hands_close_points = np.hstack([hands_close_points, N - 1])

    # for each a,b in couples:
    # do the follows IFF |a[x] - b[x]| > some threshold (avoid vertical movements spots)
    for j in range(hands_close_points.shape[0] // 2):
        a, b = hands_close_points[2 * j], hands_close_points[(2 * j) + 1]

        # check if subjects agrees on hands in a AND in b
        subjects_agree = check_if_subjects_agree(dist_dict, a, b)
        if not subjects_agree:
            print("disagree on", a, b)
            for i, S in zip([1, 2], [S1, S2]):
                _recursive_helper(S, i, a, b, subj_dict[i], dist_dict,
                                  dist_thr=0.75*dist_thr, window=0.75*win, stop_thr=stop_thr)

    S1 = np.array(S1)
    S2 = np.array(S2)

    print(S1)
    print(S2)

    # preserve only the points that are most certainly a switch point, from each [a,b] range
    S1_mask = np.argwhere(S1[:, 1] <= S2[:, 1]).flatten()
    S2_mask = np.argwhere(S2[:, 1] < S1[:, 1]).flatten()
    S1 = S1[S1[:, 1] <= S2[:, 1]]
    S2 = S2[S2[:, 1] < S1[:, 1]]

    for xc in S1:
        plt.axvline(x=xc, color='blue', linestyle='--', linewidth=0.5)
    for xc in S2:
        plt.axvline(x=xc, color='red', linestyle=':', linewidth=0.5)
    plt.show()

def find_who_switched(df):
    # figure out who was accidentally switched
    pass


def repair_data(df):
    # repair the data of the accidentally switched subject, so the "friend" hand
    # will still be in the friend channel
    pass

def attach_p1_to_p_hat(p1, p2, p1_hat, p2_hat):
    # return the couple of p1 (1 for p1_hat or 2 for p2_hat)
    ds1 = np.linalg.norm(p1 - p1_hat)
    ds2 = np.linalg.norm(p1 - p2_hat)
    ds3 = np.linalg.norm(p2 - p1_hat)
    ds4 = np.linalg.norm(p2 - p2_hat)
    dist = np.argmin([ds1, ds2, ds3, ds4])
    if dist in [0, 3]:
        return 1
    return 2

def soft_smooth_session(data):

    # TODO: ATM is good for places where NO COPY IS DONE.
    #       Needs: check if s-t>eps. if no -> Don't change!
    #       eps = 2? 5? 50? should be investigated manually
    #       Thought: maybe compare more than 1 last samples (t-1) and take the argMin(avg of distances)
    #
    # TODO: Implement quality metric for this purpose.
    #       Suggestion: How much the right/left are actually on the right/left sides of the grid
    #
    # TODO: Implement Hard-Smooth and test with the metric

    N = data.shape[0]
    data_hat = numpy.ones(shape=data.shape) * -1

    # find first time stamp where both hands on the screen for at least 1 second
    condition = lambda arr: np.all(arr > 0, axis=1)
    first_sample = find_first_sequence_indices(np.c_[data[:, 0], data[:, 3]], seq=target_srate, cond=condition)
    if first_sample is None:
        # in this case, this data is not useful - remain it like it is
        return data

    # copy everything to this point as is
    data_hat[:first_sample] = data[:first_sample]

    t = first_sample + 1
    while t < N:
        p1, p2 = data[t, 0:2], data[t, 3:5]

        if np.equal(p1, p2).all():
            # if equal - find s first sample (s > t) where points are differ and copy in between
            s = t + 1
            while s < N:
                p1, p2 = data[s, 0:2], data[s, 3:5]
                if not np.equal(p1, p2).all():
                    break
                s += 1
            data_hat[t:s, :] = data[t:s, :]
            if s == N: s -= 1
            t = s

        # copy the current sample (t) to data_hat according to the closet samples from data_hat[t-1]
        p1_hat, p2_hat = data_hat[t - 1, 0:2], data_hat[t - 1, 3:5]
        p1_couple = attach_p1_to_p_hat(p1, p2, p1_hat, p2_hat)
        if p1_couple == 1:
            data_hat[t, 0:3], data_hat[t, 3:] = data[t, 0:3], data[t, 3:]
        else:
            data_hat[t, 0:3], data_hat[t, 3:] = data[t, 3:], data[t, 0:3]

        t += 1

    return data_hat

def soft_smooth(data, ts, markers):
    # this should prevent hands switches in micro scales, and to be done BEFORE the down-sampling process.
    # it does not guarantee that subjects will mirror each other - for that
    # purpose we nees to Hard Smooth the down-sampled data
    # hence, this function operate individually on each subject's data

    markers_ts = np.array(markers["time_stamps"])
    markers_idx = np.searchsorted(ts, markers_ts)
    for i in range(0, len(markers_idx), 2):
        start, end = markers_idx[i], markers_idx[i + 1]
        data[start:end] = soft_smooth_session(data[start:end])
    return data


def agreements_metric(subj1, subj2, subj1_first, subj2_first, th_list):
    # TODO: implement metric as follow:
    #       for every t different thresholds in th_list:
    #           find samples where self_distance < t
    #           for every s in samples:
    #               check percentages of agreements and keep it as p_t
    #       plot p_t as a function of p. The optimal graph is a constant line on 100%.
    #                                    A normal behaviour would be monotonically decreasing

    # cast panda's DataFrame to numpy arrays of coordinates - (N, 2) shape
    subj1_right, subj1_left, subj2_right, subj2_left = cast_df_to_numpy_coor(subj1, subj2)
    N = subj1_right.shape[0]

    dist_dict = define_distances(subj1_right, subj1_left, subj2_right, subj2_left, subj1_first, subj2_first)
    subj1_self_ds, subj2_self_ds = dist_dict[1]["self_ds"], dist_dict[2]["self_ds"]
    first_sample = max(dist_dict[1]["both_hands_first_sample"], dist_dict[2]["both_hands_first_sample"])

    percentages = []

    for t in th_list:
        # find intersection of self with x=TH
        TH = np.ones(shape=subj1_self_ds.shape) * t
        hands_close_points = intersection_points(subj1_self_ds, TH)[1:-1]  # first and last are dump

        # insure that self[0] > TH
        assert subj1_self_ds[first_sample] > t
        assert subj2_self_ds[first_sample] > t

        # couple consecutive intersections points (if odd - last with last sample)
        if hands_close_points.shape[0] % 2 != 0:
            hands_close_points = np.hstack([hands_close_points, N - 1])

        disagreements = []
        # for each a,b in couples:
        # do the follows IFF |a[x] - b[x]| > some threshold (avoid vertical movements spots)
        for j in range(hands_close_points.shape[0] // 2):
            a, b = hands_close_points[2 * j], hands_close_points[(2 * j) + 1]
            # check if subjects agrees on hands in a AND in b
            subjects_agree = check_if_subjects_agree(dist_dict, a, b)
            if not subjects_agree:
                disagreements.append((a, b))

        percentages.append(len(disagreements) / (hands_close_points.shape[0] // 2))

    return percentages

def get_df(path, smooth, from_excel=False, analyze=False):
    from Dyad import Dyad
    if from_excel:
        path += '\\'
        if smooth:
            for f in os.listdir(path):
                if f.endswith("_smooth.xlsx"):
                    path += f
                    break

        else:
            for f in os.listdir(path):
                if f.endswith(".xlsx")and not f.endswith("_smooth.xlsx"):
                    path += f
                    break

    dyad_df = Dyad(path, smooth, from_excel=from_excel, analyze=analyze)
    return dyad_df


if __name__ == "__main__":

    th_list = (0.25, 0.1, 0.08, 0.05, 0.03)
    for dyad in ['030']:
        print("reading ", dyad, " df")
        sess = 2
        for smooth in [True, False]:
            df = get_df(SINGLE_DYADIC_DIR % dyad, smooth, from_excel=True, analyze=False)

            for session in df.sessions.items():
                print("start session ", session[0])
                subj1, subj2 = session[1][df.subject1_num].data, session[1][df.subject2_num].data

                # Distinguish between hands and RENAME the columns accordingly
                # return the first points where both hands are on the screen
                subj1_first, subj2_first = distinguish_left_and_right(subj1, subj2)

                # TODO: handling null points

                # First post-process: Fix switching hands cases
                loss = agreements_metric(subj1, subj2, subj1_first, subj2_first, th_list)

                plt.plot(th_list, loss)
                plt.show()




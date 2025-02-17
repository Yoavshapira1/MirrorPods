import numpy as np

min_score = 0       # no synchronization
max_score = 100     # full synchronization

# currently supported synchronization measures:
# distance

# TODO: experiment this values in lab, and also N (below)
# parameters for normalization of the measures distribution
# (which is mostly exponential but needed to be determined manually, buy plotting the histogram and
# calculate the distribution parameters.
# NOTE - lambda of an exponential dist is estimated by 1 / mean of the distribution)
normalization_parameters = {
    "distance": {"exp_lambda": 1., "max_val": np.sqrt(2)},
    "velocity": {"exp_lambda": 5.35, "max_val": 3}
}

# velocity measure helpers, since velocity is calculated between two points
prev_pos_data1 = [[-1.0, -1.0], [-1.0, -1.0]]
prev_pos_data2 = [[-1.0, -1.0], [-1.0, -1.0]]
N = 50  # how much to smooth velocity traces
prev_N_velocity_values = np.ones((N, 2)) * max_score    # initialize to full sync, which means no movement


def noramlize_values(values, method):
    # excepted input: nd.array 2 values, represents the differences between the measures (where 0 = perfect sync)
    # return: 2 values represents the synchrony of each pair of hands (where 0 = no sync, 100 = perfect sync)

    params = normalization_parameters[method]
    max_val, exp_lambda = params["max_val"], params["exp_lambda"]

    # normalize it to [0,1]
    norm_dist = values / max_val

    # transform to uniform distribution, suppose the data is distributed exponentially
    data_uniform = 1 - np.exp(-exp_lambda * norm_dist)

    # scale to [0, 100] where 0 (0 distance) mapped to 100 (full sync)
    rescaled = max_score - (data_uniform * max_score)

    return rescaled


def sync_measures(pos_data_1, pos_data_2, dt=0.001, method="distance"):
    """
    pos_data1 is a list of 2 positional data (for 2 hand): [[XL, YL], [XR, YR]]
    pos_data2 is the same shape
    """
    global prev_pos_data1, prev_pos_data2, prev_N_velocity_values, N

    if method == "distance":
        # calculate the distances, inter subjects
        dist = np.linalg.norm(np.array(pos_data_2) - np.array(pos_data_1), axis=1)
        sync = noramlize_values(dist, method)

    if method == "velocity":
        # calculate the velocity - distance by the delta in time
        vel1 = np.linalg.norm(np.array(pos_data_1) - np.array(prev_pos_data1), axis=1) / dt
        vel2 = np.linalg.norm(np.array(pos_data_2) - np.array(prev_pos_data2), axis=1) / dt

        # calculate the velocities differences and normalize it
        diff = np.abs(vel1 - vel2)
        temp_sync = noramlize_values(diff, method)

        # smooth the values, since velocity is very sensitive to trajectory changes
        prev_N_velocity_values = np.r_[prev_N_velocity_values, temp_sync[None,:]][1:]
        sync = np.average(prev_N_velocity_values, axis=0)

    prev_pos_data1 = pos_data_1
    prev_pos_data2 = pos_data_2
    return sync
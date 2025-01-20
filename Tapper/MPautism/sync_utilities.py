import numpy as np

min_score = 0       # no synchronization
max_score = 100     # full synchronization

# currently supported synchronization measures:
# distance

# PARAMETERS
# distance
dist_lambda_param = 1.      # parameter for the exponential distribution of the data
dist_max_val = np.sqrt(2)   # maximal value possible


def sync_measures(data1, data2, method):

    if method == "distance":
        # calculate the distance
        dist = np.linalg.norm(np.array(data2) - np.array(data1), axis=1)
        # normalize it to [0,1]
        norm_dist = dist / dist_max_val
        # transform to uniform distribution, suppose the data is distributed exponentially
        data_uniform = 1 - np.exp(-dist_lambda_param * norm_dist)
        # scale to [0, 100] where 0 (0 distance) mapped to 100 (full sync)
        rescaled = 100 - (data_uniform * 100)

        return rescaled
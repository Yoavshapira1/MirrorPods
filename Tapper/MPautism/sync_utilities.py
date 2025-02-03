import numpy as np

min_score = 0       # no synchronization
max_score = 100     # full synchronization

# currently supported synchronization measures:
# distance

# parameters for normalization of the measures distribution, need to be determined manually
normalization_parameters = {
    "distance": {"exp_lambda": 1., "max_val": np.sqrt(2)},
    "velocity": {"exp_lambda": 1., "max_val": 0.15}
}


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

def sync_measures(data1, data2, method):

    if method == "distance":
        # calculate the distances (inter subjects)
        dist = np.linalg.norm(np.array(data2) - np.array(data1), axis=1)
        return noramlize_values(dist, method)

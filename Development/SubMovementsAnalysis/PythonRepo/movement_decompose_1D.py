import os
import re
import numpy as np
import matplotlib.pyplot as plt
import torch
from scipy.signal import filtfilt, butter
from scipy.optimize import minimize

def load_data(dir_name, len=1.):
    """
    Loads data from CSV files in the specified directory.

    Parameters:
        dir_name (str): Directory path containing the CSV files.
                        In each file expect:
                            Cols 0 & 1 to be X-Y position
                            Col 3 to be pen-pressure (only colecting data when it is >0)
                            Col 4 to be time
    Returns:
        position_filtered (list): List of position data arrays after filtering.
        velocity (list): List of velocity data arrays.
        time (list): List of time data arrays.

    Raises:
        ValueError: If the directory does not contain any CSV files.

    """

    # Get a list of files in the directory
    files = os.listdir(dir_name)
    # Filter only the CSV files
    csv_files = [f for f in files if f.endswith('.csv')]
    # Raise an error if no CSV files are found
    if not csv_files:
        raise ValueError('Must specify a directory to load the csv files from')
    # Extract block and trial information from file names
    trials = []
    file_names = []
    for file_name in csv_files:
        file_names.append(file_name)
        match = re.search(r'tb_trial(\d*).csv', file_name) #checking for correct file name
        if match:
            trial = int(match.group(1))
            trials.append(trial)

    # We have lists of blocks and trials and looks for max to see how much blocks and trials we have in this folder
    max_trial = max(trials)
    position_filtered = []
    velocity = []
    time = []

    # Process data for each block and trial
    for trial in range(1, max_trial + 1):
        trial_index = [i for i, _trial in enumerate(trials) if _trial == trial]
        if not trial_index:
            continue

        data = np.loadtxt(os.path.join(dir_name, csv_files[trial_index[0]]), delimiter=',')
        pressure = data[:, 3]
        position = data[pressure > 0, :2] / 1000
        _time = data[pressure > 0, 4] / 1000  # seconds
        _time = _time - _time[0]
        dt = np.median(np.diff(_time))
        b, a = butter(2, 5 / ((1 / dt) / 2))
        _position_filtered = filtfilt(b, a, position, axis=0)
        _velocity = np.vstack([[0, 0], np.diff(_position_filtered, axis=0) / dt])

        # find the first minimum velocity point
        start = np.argwhere(_velocity[1:-1,0] * _velocity[2:,0] < 0).flatten()[0] + 2
        start = 500
        _time = _time[start:]
        _position_filtered = _position_filtered[start:]
        _velocity = _velocity[start:]

        #organizing the data in correct variables for future functions
        N = int(_time.shape[0] * len)
        time.append(_time[:N])
        position_filtered.append(_position_filtered[:N,0].reshape(N, 1))
        velocity.append(_velocity[:N,0].reshape(N, 1))

    return position_filtered, velocity, time

def plot_position(position, time):

    num_positions = len(position)
    cols = int(np.ceil(np.sqrt(num_positions)))
    rows = int(np.ceil(num_positions / cols))
    #create demo figure with num subplots correlated with num of trials in data
    _ , axs = plt.subplots(rows, cols)
    #inserting each trial to a subplot
    for k in range(num_positions):
        if isinstance(axs, np.ndarray):
            ax = axs[k // cols, k % cols]

        ax.plot(time[k], position[k])
    plt.suptitle("Position \ Time")
    plt.show()

def plot_velocity(velocity, time, plot_type=1):

    num_velocity = len(velocity)
    cols = int(np.ceil(np.sqrt(num_velocity)))
    rows = int(np.ceil(num_velocity / cols))
    #create demo figure with num subplots correlated with num of trials in data

    _ , axs = plt.subplots(rows, cols)
    #inserting each trial to a subplot
    for k in range(num_velocity):
        if isinstance(axs, np.ndarray):
            ax = axs[k // cols, k % cols]

        ax.plot(time[k], velocity[k])
    plt.suptitle("x Velocity / Time")
    plt.show()

def decompose_1D(time: np.ndarray, vel: np.ndarray, maximal_n_submovements: int = 4,
                 rng = (-5., 5.), iter=20):
    """
    decompose_2D - decompose one dimensional movement into submovements using the velocity profiles

    best_error, final_parms, best_velocity = decompose(time,vel,numsubmovements,xrng,yrng)

    vel should be a 1 x N matrix, with the velocity

    t should be a 1 x N matrix with the corresponding time (in seconds)

    n_sub_movement is the number of submovements to look for, if it is
    empty or not specified, the function will try 1 to 4 submovements

    x_rng is the valid range for the amplitude of x values (default = (-5 5))

    y_rng is the valid range for the amplitude of y values (default = (0.1 5))

    min(t0) = 0.167 * submovement number


    best_error the best (lowest) value of the error function

    best_parameters contains the function parameters corresponding to the best values
    [start_t, movment_duration, displace_x, displace_y].
    If there are multiple submovements, each submovement is in different row.

    best_velocity is the velocity profile coresponding to the best values (UNIMPLANTED!!!)

    Jason Friedman, 2021
    www.curiousjason.com
    """
    # Input validation
    if time.ndim > 1:
        raise ValueError('time must be a 1D')

    if vel.shape[1] != 1:
        raise ValueError('vel must be an N*1 ndarray')

    if vel.shape[0] != time.size:
        raise ValueError('vel must match time')

    lower_bounds = np.array([0,                     0.167    , rng[0]])
    upper_bounds = np.array([max(time[-1]-0.167,0.1), 1.     , rng[1]])
    #submovment:             start,                duration  , pos

    if np.any(lower_bounds > upper_bounds):
        raise ValueError('Lower bounds exceed upper bound - infeasible')

    # initiate matrices for parameters and bounds for each submovment
    parm_per_sub = 3 # hard coded - can be change if different methods are used

    # define time delta as the median of the time deltas
    dt = np.median(np.diff(time))

    # will track all errors to find the best with the least amount of submovements
    best_err, best_param = np.inf, None

    # try optimazation <iter> times
    for _ in range(iter):
        for n_sub in range(1, maximal_n_submovements + 1):

            # initializes containers for submovements parameters
            init_parm = np.empty(shape=(n_sub, parm_per_sub), dtype=float)  # submovement parameters
            all_lower_bounds = np.empty(shape=(n_sub, parm_per_sub), dtype=float)  # lower bound for each parameter
            all_upper_bounds = np.empty(shape=(n_sub, parm_per_sub), dtype=float)  # upper bound for each parameter

            # randomly initial parameters for each submovement
            for iSub in range(n_sub):
                init_parm[iSub,:] = lower_bounds + (upper_bounds - lower_bounds)*np.random.rand(1,parm_per_sub)
                all_upper_bounds[iSub,:] = upper_bounds.copy()
                all_lower_bounds[iSub,:] = lower_bounds.copy()
                all_lower_bounds[iSub,0] = (iSub) * 0.167

            # function to minimize
            def error_fun(parms):
                epsilon = _calculate_error_MJ1D(parms, time, vel, timedelta=dt)
                return epsilon

            # run the optimizer
            res = minimize(error_fun,
                           x0=init_parm.flatten(),
                           method='trust-constr',
                           bounds=tuple(zip(all_lower_bounds.flatten(),all_upper_bounds.flatten())),
                           options = {'maxiter':5000})

            err = error_fun(res.x)
            if err < best_err:
                best_param = res.x.reshape((n_sub, parm_per_sub))
                best_err = err

    return best_err, best_param

def _calculate_error_MJ1D(parameters: np.ndarray,time: np.ndarray,
                         vel: np.ndarray, timedelta: float = 0.005) -> float:
    """
    Calculates the error between predicted and actual trajectories in a
    1D space based on the given parameters.
    Parameters:
        parameters (array): List of parameters for each submovement. Each submovement requires 3 parameters: T0, D, Dx
        time (array): Array of time values.
        vel (array): Array of velocity values.
        timedelta (float, optional): Time interval between consecutive points. Default is 0.005.

    Returns:
        epsilon (float): Error between predicted and actual trajectories.
    """

    # Calculate the number of submovements
    n_sub_movement = int(len(parameters)/3)
    # Find the last time point in the trajectory
    last_time = 0

    for i in range(n_sub_movement):
        start_t = parameters[i*3-3]
        movment_dur= parameters[i*3-2]
        last_time = max([last_time, start_t+movment_dur])

    # Adjust the last time point to align with the given time interval
    last_time = (last_time*(1/timedelta))/(1/timedelta)
    # If the last time is greater than the last time point in the given time array,
    # extend the time, velocity, and tangential velocity arrays with zeros

    if last_time > time[-1]:
        new_time = np.arange(time[-1], last_time + timedelta, timedelta)
        time = np.concatenate((time[:-1], new_time))
        vel = np.concatenate((vel, np.zeros((len(time) - len(vel), vel.shape[1]))))

    # Initialize arrays for predicted trajectories
    trajectory = vel[:,0]
    predicted = np.zeros([n_sub_movement, len(time)])

    # Jacobian & Hessian initialization

    # Jx = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])
    # Jy = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])
    # J = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])

    # Hx = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])
    # Hy = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])
    # H = np.zeros([n_sub_movement,4*n_sub_movement, len(time)])

    # Calculate predicted trajectories for each submovement

    for i in range(n_sub_movement):
        start_t     = parameters[i*3-3]
        movment_dur = parameters[i*3-2]
        displacement  = parameters[i*3-1]

        this_rgn = np.where((time > start_t) & (time < start_t+movment_dur))[0]

        predicted[i,this_rgn] = _minimum_jerk_velocity_1D(start_t, movment_dur, displacement, time[this_rgn])


    # Calculate the sum of predicted trajectories and actual trajectories squared
    sum_predicted = np.sum(predicted,0)
    abs_sum_predicted = np.sum(np.abs(predicted), 0)

    # Calculate the error between predicted and actual trajectories
    epsilon = np.sum((sum_predicted - trajectory)**2 + (abs_sum_predicted - np.abs(trajectory))**2)
    # epsilon = np.sum(((sum_predicted - trajectory) ** 2) + np.abs(predicted))
    # epsilon = np.sum(((sum_predicted - trajectory) ** 2))

    return epsilon

def _minimum_jerk_velocity_1D(start_t: float, movment_dur: float,
                              displacement: float, t: np.ndarray):
    """
    minimumJerkVelocity21D - evaluate a minimum jerk velocity curve displacement for 1-dimension

    see Flash and Hogan (1985) for details on the minimum jerk equation

        start_t = movement start time (scalar)
        movment_dur  = movement duration (scalar)
        displacement   = displacement resulting from the movement (x) (scalar)

    The function is evaluated at times t (vector)
    """

    # normalise time to t0 and movement duration, take only the time of the movement
    normlized_time = (t - start_t)/movment_dur
    logical_movement = (normlized_time >= 0) & (normlized_time <= 1)

    # normalise displacement to movment duration
    norm_disp_x = displacement / movment_dur

    x_vel = np.zeros(t.shape)

    # calculate velocities
    def min_jerk_1d_fun(base_val):
        # the polynomial function from Flash and Hogan (1985)
        return base_val * (-60*normlized_time[logical_movement]**3 + 30*normlized_time[logical_movement]**4 + 30*normlized_time[logical_movement]**2)

    x_vel[logical_movement] = min_jerk_1d_fun(norm_disp_x)

    return x_vel

def plot_submovements_1D(parameters, t: np.ndarray = None, axs= None, fig=None, show=False):
    """
    plot_submovements_1D - plot 1D submovements after decomposition

    The parameters should in sets of 3 for each submovement:
    [start_t, movment_duration, displacement]


    plot_type:
    time vs submovement velocity + sum velocity (default)
    """
    if parameters.size%3 != 0:
        raise ValueError('The parameters vector must have a length that is a multiple of 3')

    # parse inputs
    numsubmovements = parameters.shape[0] # each submovment is in a different row
    start_t      = parameters[:, 0]
    movment_dur  = parameters[:, 1]
    displacement   = parameters[:, 2]

    # make sure parameters are ordered by movment start time
    order = np.argsort(start_t)
    start_t      = start_t[order]
    movment_dur  = movment_dur[order]
    displacement   = displacement[order]

    # if no time was given, plot from start of first movement to end of last movment
    if t is None:
        movement_end = start_t + movment_dur # end time of each movement
        t = np.linspace(min(start_t),max(movement_end),num=100)

    # init velocities
    vel = np.zeros((numsubmovements,t.size))

    # using minimum jerk, find velocities curve for each submovment
    for isub in range(numsubmovements):
        vel[isub,:] = _minimum_jerk_velocity_1D(start_t[isub],movment_dur[isub], displacement [isub],t)

    # get total velocity expected from submovments
    sum_vx = np.sum(vel, axis=0)

    # create the figure
    if axs is None:
        fig, axs = plt.subplots(1, 1)
    vx_lines = axs.plot(t,vel.transpose(), 'purple', linewidth='0.7',   label=r'$V_{x}$')
    vx_sum_line = axs.plot(t,sum_vx        , 'b--', label=r'$Sum V_{x}$')
    axs.legend(handles=[vx_lines[0], vx_sum_line[0]])
    axs.set_xlabel('Time')
    axs.set_ylabel('Velocity')
    axs.set_title('{} submovements'.format(numsubmovements))

    # return axe & figure for later plotting
    return axs, fig, [vx_lines, vx_sum_line]
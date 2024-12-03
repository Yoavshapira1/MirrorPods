import os
import time

import torch

import movement_decompose_1D as md1
import movement_decompose_2d as md2
import numpy as np
from matplotlib import pyplot as plt

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

def count_zero_crossing(time, accelration, acc_zero_cross, start=800, end=800):
    count = 0
    time_plot = time[start + 1:-end]
    acc_plot = accelration[start:-end]
    plt.plot(time_plot, acc_plot)
    for xc in acc_zero_cross[:-1]:
        if xc - start - 1 > 0 and len(time_plot) + end - xc > 0:
            count += 1
    return count

def approximate_parkinson_results():
    subjects, mean = [], []
    root = r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\JasonFriedmanRepo\matlab\submovements-master\data\PakinsonDeaseaseMP'
    for dir in os.listdir(root):
        try:
            dir_path = r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\JasonFriedmanRepo\matlab\submovements-master\data\PakinsonDeaseaseMP\{}\MirrorGame'.format(dir)
            position_filtered, velocity, time = md1.load_data(dir_path, len=1.)
            accelration = [v.flatten()[1:] / t[1:] for(v, t) in zip(velocity, time)]
            acc_zero_cross = [intersection_points(acc, np.zeros(shape=acc.shape)) for acc in accelration]
            acc_zero_counters = [count_zero_crossing(t, acc, zero_cross) for (t, acc, zero_cross) in zip (time, accelration, acc_zero_cross)]
            mean.append(np.median(acc_zero_counters))
            subjects.append("{}".format(dir))
        except:
            pass

    sort = np.argsort(mean)
    for (s, m) in zip(np.array(subjects)[sort], np.array(mean)[sort]):
        print("Subject {} mean: {}".format(s, m))

def run_1D():
    d1_path = r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\JasonFriedmanRepo\matlab\submovements-master\data\PakinsonDeaseaseMP\1\MirrorGame'
    d2_path = r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\JasonFriedmanRepo\matlab\submovements-master\data\subject08day1post'
    position_filtered, velocity, time = md1.load_data(d1_path, len=0.05)

    # torch_dataset = torch.load(r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\NN\Dataset\vel.pt').detach().numpy()
    # torch_dataset = torch_dataset[:,:,None]
    # ts = np.linspace(0, 4, 400)
    # j = 4
    # idx = np.random.choice(np.arange(torch_dataset.shape[0]), size=(j**2,))
    # fig, axs = plt.subplots(j, j)
    # for i in range(j**2):
    #     ax = axs[i//j][i%j]
    #     vel = torch_dataset[idx[i]]
    #
    #     start = time.time()
    #     best_error, final_parms = md1.decompose_1D(time=ts, vel=vel, rng=(-2,2), maximal_n_submovements=7)
    #     end = time.time()
    #
    #     _, _, lines = md1.plot_submovements_1D(final_parms, ts, axs=ax, fig=fig, show=False)
    #     real_line = ax.plot(ts, vel, 'black', linestyle=':', linewidth='1.2', label=r'real')
    #     ax.legend(handles=[l[0] for l in lines] + [real_line[0]])
    #     ax.set_yticks([])
    #     ax.set_xticks([])
    #     ax.set_xlabel('')
    #     ax.set_ylabel('')
    #     ax.set_title('Calc. time: %.2f sec.'%(end - start))
    # plt.show()
    # exit()

    # md1.plot_position(position_filtered, time)
    # md1.plot_velocity(velocity, time)

    mov_ind = 4
    maximal_n_submovement = 6  # how many submovments to check (maximal value)
    rng = (-20, 20)  # minimal & maximal values of x

    N = int(time[mov_ind].shape[0] * 1.)
    position_filtered_x = position_filtered[mov_ind][:N, 0].reshape(N, 1)
    velocity_x = velocity[mov_ind][:N, 0].reshape(N, 1)

    # decompose the movement. Note that we use the velocity, not the position
    best_error, final_parms = md1.decompose_1D(time=time[mov_ind], vel=velocity_x,
                                               rng=rng, maximal_n_submovements=maximal_n_submovement,
                                               iter=20)

    print(mov_ind)
    print(best_error)  # print the error of the found movement
    print(final_parms)  # print the parameters of the submovement.

    axs, fig, lines = md1.plot_submovements_1D(final_parms, time[mov_ind])
    real_line = axs.plot(time[mov_ind], velocity_x, 'black', linestyle=':', linewidth='1.2', label=r'real')
    axs.legend(handles=[l[0] for l in lines] + [real_line[0]])
    plt.show()


def run_2D():
    dir_path = r'C:\Users\Dell\PycharmProjects\AyeletLab\Development\SubMovementsAnalysis\JasonFriedmanRepo\matlab\submovements-master\data\subject08day1pre'
    position_filtered, velocity, time = md2.load_data(dir_path, trim=1.)

    # md2.plot_position(position_filtered, time)
    # md2.plot_velocity(velocity, time)

    n_submovements = 6  # how many submovments
    idx = [i for i in range(1)]  # movements to decompose, by ind

    for mov_ind in idx:
        # decompose the movement. Note that we use the velocity, not the position
        best_error, final_parms = md2.decompose_2D(time=time[mov_ind], vel=velocity[mov_ind],
                                                   x_rng=(-20, 20), y_rng=(-10,10), maximal_n_submovements=n_submovements)

        print(best_error)  # print the error of the found movement
        print(final_parms)  # print the parameters of the submovement.

        axs, fig, lines = md2.plot_submovements_2D(final_parms, time[mov_ind])
        real_y = axs.plot(time[mov_ind], velocity[mov_ind][:,1], 'black', linestyle=':', linewidth='1.2', label=r'real y')
        real_x = axs.plot(time[mov_ind], velocity[mov_ind][:,0], 'green', linestyle=':', linewidth='1.2', label=r'real x')
        axs.legend(handles=[line[0] for line in lines] + [real_y[0], real_x[0]])
        plt.savefig('example.png')

if __name__ == "__main__":
    run_1D()


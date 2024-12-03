# Import required code for visualizing example models
import pandas as pd
from fooof import FOOOF
from matplotlib import pyplot as plt
# from Development.Velocity_Analyzer import get_all_subject_from_dir
from Development.util import smooth_vector
# from Development.Subject import Subject
from Development.util import *


def plot_fooof(vec, sample_rate):
    powers_raw, freqs_raw = plt.psd(vec, 512, sample_rate)
    fm = FOOOF(min_peak_height=0.05, verbose=False)
    fm.fit(freqs_raw, powers_raw)
    freq_sorted = freqs_raw[np.argsort(powers_raw[1:] - fm.power_spectrum)]
    print(freq_sorted)
    fm.plot(plot_peaks='shade', peak_kwargs={'color': 'green'})
    plt.show()
    plt.plot(freqs_raw[1:], powers_raw[1:] - fm.power_spectrum)
    plt.show()

def fit_fooof(subj, sess, csd=False):
    session = subj.sessions[sess]
    velocity_vec_filtered, velocity_vec_raw, sample_rate = session.vel_filtered, session.vel, session.sample_rate
    x, y, sample_rate = session.npdata[:, 0], session.npdata[:, 1], session.sample_rate
    x_filtered, _ = smooth_vector(x, filter_size_freq=FILTER_SIZE_FREQ, sample_rate=sample_rate)
    y_filtered, _ = smooth_vector(y, filter_size_freq=FILTER_SIZE_FREQ, sample_rate=sample_rate)

    fig, axs = plt.subplots(2, 2)
    fig.suptitle('FOOOF method on %s of subject: %s, Session: %s %s' % ((("CSD" if csd else "PSD")),
                                    subj.name, session.session, session.screen_type), fontsize=16)

    if not csd:
        axs[0][0].set_title("Raw velocity PSD")
        powers_raw, freqs_raw = axs[0][0].psd(velocity_vec_raw, 512, sample_rate)

        axs[0][1].set_title("Filtered velocity PSD")
        powers_filtered, freqs_filtered = axs[0][1].psd(velocity_vec_filtered, 512, sample_rate)
        axs[0][1].plot([], [], ' ', label="filter %s, on freq: %d Hz" % (FILTER_MODE, session.filter_freq))
        axs[0][1].legend()

        axs[1][0].set_title("Fitted raw PSD")

    else:
        axs[0][0].set_title("Raw positional CSD")
        powers_raw, freqs_raw = axs[0][0].csd(x, y, 512, sample_rate)

        axs[0][1].set_title("Filtered positional CSD")
        powers_filtered, freqs_filtered = axs[0][1].csd(x_filtered, y_filtered, 512, sample_rate)
        axs[0][1].plot([], [], ' ', label="filter %s, on freq: %d Hz" % (FILTER_MODE, session.filter_freq))
        axs[0][1].legend()

        powers_raw = np.absolute(powers_raw)
        powers_filtered = np.absolute(powers_filtered)

    axs[1][0].set_title("Fitted raw %s" % ("CSD" if csd else "PSD"))
    fm = FOOOF(min_peak_height=0.05, verbose=False)
    fm.fit(freqs_raw, powers_raw)
    fm.plot(plot_peaks='shade', peak_kwargs={'color': 'green'}, ax=axs[1][0])

    axs[1][1].set_title("Fitted filtered %s" % ("CSD" if csd else "PSD"))
    fm = FOOOF(min_peak_height=0.05, verbose=False)
    fm.fit(freqs_filtered, powers_filtered)
    fm.plot(plot_peaks='shade', peak_kwargs={'color': 'green'}, ax=axs[1][1])

    axs[0][0].set_xlabel("")
    axs[0][1].set_xlabel("")
    axs[0][1].set_ylabel("")
    axs[1][1].set_ylabel("")

def plot_raw_and_filtered_psd(subj, sess):
    session = subj.sessions[sess]
    velocity_vec_filtered, velocity_vec_raw, sample_rate = session.vel_filtered, session.vel, session.sample_rate

    fig, axs = plt.subplots(2, 2)
    fig.suptitle('Lowpass and 0.1Hz cut, on subject: %s, Session: %s %s' % (subj.name, session.session, session.screen_type),
                 fontsize=16)

    axs[0][0].set_title(r'Raw velocity vector (PSD = |FFT|^2)')
    powers_raw, freqs_raw = axs[0][0].psd(velocity_vec_raw, 512, sample_rate)

    axs[0][1].set_title("Filtered velocity vector (PSD = |FFT|^2)")
    powers_filtered, freqs_filtered = axs[0][1].psd(velocity_vec_filtered, 512, sample_rate)
    idx = np.argsort(powers_filtered)
    axs[0][1].plot([], [], ' ', label="filter freq: %d Hz" % session.filter_freq)
    axs[0][1].legend()

    axs[1][0].set_title("Raw signal")
    axs[1][0].plot(velocity_vec_raw)
    axs[1][0].set_yticks([])

    axs[1][1].set_title("Filtered signal")
    axs[1][1].plot(velocity_vec_filtered)
    axs[1][1].set_yticks([])

    plt.close(fig)
    return freqs_filtered[idx]

def csd_vs_psd(subj, sess):
    session = subj.sessions[sess]
    velocity_vec_raw, sample_rate = session.vel, session.sample_rate
    x, y, sample_rate = session.npdata[:,0], session.npdata[:,1], session.sample_rate

    velocity_vec_filtered, filter_size = smooth_vector(velocity_vec_raw, filter_size_freq=FILTER_SIZE_FREQ, sample_rate=sample_rate)
    x_filtered, _ = smooth_vector(x, filter_size_freq=FILTER_SIZE_FREQ, sample_rate=sample_rate)
    y_filtered, _ = smooth_vector(y, filter_size_freq=FILTER_SIZE_FREQ, sample_rate=sample_rate)

    fig, axs = plt.subplots(2, 2)
    fig.suptitle("Velocity's PSD vs. Position's CSD: %s, Session: %s %s" % (subj.name, session.session, session.screen_type),
                 fontsize=16)

    axs[0][0].set_title(r"Raw velocity's PSD")
    axs[0][0].psd(velocity_vec_raw, 512, sample_rate)
    axs[0][0].set_xlabel("")

    axs[0][1].set_title("Filtered velocity's PSD")
    axs[0][1].psd(velocity_vec_filtered, 512, sample_rate)
    axs[0][1].set_xlabel("")
    axs[0][1].set_ylabel("")

    axs[1][0].set_title(r"Raw position's CSD")
    axs[1][0].csd(x, y, 512, sample_rate)

    axs[1][1].set_title("Filtered position's CSD")
    axs[1][1].csd(x_filtered, y_filtered, 512, sample_rate)
    axs[1][1].set_ylabel("")

# def scatter_mean_and_var_of_frequencies():
#     h = np.array([3, 4, 7, 8, 10, 11, 12, 14, 16, 17, 18, 19]) - 2
#     main_dist = { motion_small: {'s' : '.'},
#                   motion_big: {'s' : '^'},
#                   circles_small: {'s' : '1'},
#                   circles_big: {'s' : 'x'} }
#
#     subjects = get_all_subject_from_dir(r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data_backup_28.8')
#
#     for session in main_dist.keys():
#         main_dist[session]['mean'] = []
#         main_dist[session]['var'] = []
#         for i, s in enumerate(subjects):
#             if i in h:
#                 significants_freq_circles = plot_raw_and_filtered_psd(s, sess=session)[:3]
#                 main_dist[session]['mean'].append(np.mean(significants_freq_circles))
#                 main_dist[session]['var'].append(np.var(significants_freq_circles))
#     plt.title("Mean & variance of most 10 significant freq. across all subjects (color) and sessions (shapes)")
#     plt.xlabel("Mean freq.")
#     plt.ylabel("Var of freq.")
#
#     colors = ["#641E16", "#512E5F", "#154360", "#0E6251", "#7D6608", "#6E2C00",
#               "#C0392B", "#9B59B6", "#5499C7", "#212F3C", "#F4D03F", "#B2BABB"]
#     for i in range(len(colors)):
#         plt.plot([], [], c=colors[i], label="Subject s%d" % i)
#     for session in main_dist.keys():
#         x = main_dist[session]['mean']
#         y = main_dist[session]['var']
#         plt.scatter(x, y, color=colors, marker=main_dist[session]['s'], s=64)
#         plt.plot([], [], c="black", linestyle='None', marker=main_dist[session]['s'], label="session %s" % session)
#         plt.legend()


def scipy_fft(signal, sr):
    import scipy.signal

    (f, S) = scipy.signal.periodogram(signal, sr, scaling='density')
    plt.semilogy(f, S)
    plt.ylim([1e-7, 1e2])
    plt.xlim([0, 100])
    plt.xlabel('frequency [Hz]')
    plt.ylabel('PSD [V**2/Hz]')
    plt.show()

def scipy_welch(signal, sr):
    import scipy.signal
    (f, S) = scipy.signal.welch(signal, sr, nperseg=1024)

    plt.semilogy(f, S)
    plt.xlim([0, 100])
    plt.xlabel('frequency [Hz]')
    plt.ylabel('PSD [V**2/Hz]')
    plt.show()

if __name__ == "__main__":

    # subj = Subject(r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data\Zytronic_big_motion_0')
    # significants_freq_circles = plot_raw_and_filtered_psd(subj, sess=circles_big)[:10]
    # subj = Subject(r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data_backup_28.8\s10_no_0')
    # significants_freq_motion = plot_raw_and_filtered_psd(subj, sess=motion_big)[:10]
    # print("significants_freq_circles: mean, var")
    # print(np.mean(significants_freq_circles), np.var(significants_freq_circles))
    # print("significants_freq_motion: mean, var")
    # print(np.mean(significants_freq_motion), np.var(significants_freq_motion))
    # print("significants_freq_circles first 10:")
    # print(significants_freq_circles)
    # print("significants_freq_motion first 10:")
    # print(significants_freq_motion)

    # fit_fooof(subj, motion_big, True)
    # scatter_mean_and_var_of_frequencies()
    # csd_vs_psd(subj, circles_big)
    df = pd.read_excel(r"C:\Users\yoavsha\Desktop\LSL\Development\Circles_Eights_Lines\Eights_Yoav_1.xlsx")
    vel, ts = df['vel'][:-2], df['TS'].to_numpy()[:-2]
    vel, _ = smooth_vector(vel, filter_size_freq=30, sample_rate=125)

    # scipy_fft(vel, 125)
    # scipy_welch(vel, 125)

    plot_fooof(vel, 125)

    # ts = ts - ts[0]
    # plt.plot(ts, vel)
    # plt.show()



from os import *
from Development.util import *
from Development.Subject import Subject
from Development.Dyad import Dyad

INPUT_LOOP = False
ESCAPE = -1

def save_data_frames(data_dir, target_dir=""):
    # Save DataFrames for all subject in 'base_dir'.
    #
    # How to use the DataFrame:
    # Open the '<subject>_DF.csv' file as a DataFrame called df.
    #
    # Get a specific session by access the attributes: df[<SESSION>]. Possible values for '<SESSION>' are:
    #       'Motion small', 'Motion big', 'Circles small', 'Circles big', 'Tapper small', 'Tapper big'.
    #
    # Get a specific data info by access the specific attribute by  df[<SESSION>][<ATTR>].

    #                           -------- T A P P I N G --------------
    #
    # if the SESSION if either 'Tapper small' or 'Tapper big', possible values for '<ATTR>' are:
    #       data             : <pd.DataFrame>; columns corresponding to CSV_COLS_PER_TASK(session)
    #                                          * This data is pre-processed! *
    #       n_samples        : <String>; integer of number of samples in the data
    #       name             : <String>; name of the subject
    #       number           : <String>; integer of number of subject
    #       trial            : <String>; integer of number of the trial
    #       time_length      : <String>; integer of total time the trial took, in sec.
    #       time_perspective : <String>; integer of time the subject thought that passed, in sec.
    #       IPI                 : Time intervals between every 2 from the 'h' peaks
    #       IPI_time_stamps     : Time stamps of the ITI signals (defined as Avg. of start & end)
    #       IPI_mean            : mean of the ITI values
    #       IPI_sd              : standard deviation of the ITI values
    #       IPI_cv              : coefficient of variance of the ITI values
    #       outliers_ratio_per_tolerance    : A list of {SD tolerance : percentage of outliers}. (0.5 < tol < 4)

    #                           -------- C I R C L E S --------------
    #
    # if the SESSION if either 'Circles small' or 'Circles big', possible values for '<ATTR>' are:
    #       data             : <pd.DataFrame>; columns corresponding to CSV_COLS_PER_TASK(session)
    #                                          * This data is pre-processed! *
    #       n_samples        : <String>; integer of number of samples in the data
    #       name             : <String>; name of the subject
    #       number           : <String>; integer of number of subject
    #       trial            : <String>; integer of number of the trial
    #       time_length      : <String>; integer of total time the trial took, in sec.
    #       time_perspective : <String>; integer of time the subject thought that passed, in sec.
    #       npdata              : The positional data
    #       vel                 : The velocity vector
    #       vel_filtered        : The smoothed velocity vector
    #       vel_filtered_size   : The size of Gaussian Filter used to smoothen the velocity vector
    #       peaks               : Position of the P local minima
    #       peaks_time_stamps   : Time Stamps of the P local minima
    #       high_peaks          : Indices (relative to data['vel']) of local minima
    #       not_high_peaks      : Indices (relative to data['vel']) of local minima
    #       IPI                 : Time intervals between every 2 from the 'h' peaks
    #       IPI_time_stamps     : Time stamps of the ITI signals (defined as Avg. of start & end)
    #       IPI_mean            : mean of the ITI values
    #       IPI_sd              : standard deviation of the ITI values
    #       IPI_cv              : coefficient of variance of the ITI values
    #       IPI_outliers_ratio_per_tolerance    : A list of {SD tolerance : percentage of outliers}. (0.5 < tol < 4)
    #       ISI                 : Time intervals between every 2 from the 'h' peaks
    #       ISI_time_stamps     : Time stamps of the ITI signals (defined as Avg. of start & end)
    #       ISI_mean            : mean of the ITI values
    #       ISI_sd              : standard deviation of the ITI values
    #       ISI_cv              : coefficient of variance of the ITI values
    #       ISI_outliers_ratio_per_tolerance    : A list of {SD tolerance : percentage of outliers}. (0.5 < tol < 4)

    #                           -------- M O T I O N --------------
    #
    # if the SESSION if either 'Motion small' or 'Motion big', possible values for '<ATTR>' are:
    #       data             : <pd.DataFrame>; columns corresponding to CSV_COLS_PER_TASK(session)
    #                                          * This data is pre-processed! *
    #       n_samples        : <String>; integer of number of samples in the data
    #       name             : <String>; name of the subject
    #       number           : <String>; integer of number of subject
    #       trial            : <String>; integer of number of the trial
    #       time_length      : <String>; integer of total time the trial took, in sec.
    #       time_perspective : <String>; integer of time the subject thought that passed, in sec.
    #       npdata              : The positional data
    #       vel                 : The velocity vector
    #       vel_filtered        : The smoothed velocity vector
    #       vel_filtered_size   : The size of Gaussian Filter used to smoothen the velocity vector
    #       peaks               : Position of the P local minima
    #       peaks_time_stamps   : Time Stamps of the P local minima
    #       high_peaks          : Indices (relative to data['vel']) of local minima
    #       not_high_peaks      : Indices (relative to data['vel']) of local minima
    #       ISI                 : Time intervals between every 2 from the 'h' peaks
    #       ISI_time_stamps     : Time stamps of the ITI signals (defined as Avg. of start & end)
    #       ISI_mean            : mean of the ITI values
    #       ISI_sd              : standard deviation of the ITI values
    #       ISI_cv              : coefficient of variance of the ITI values
    #       ISI_outliers_ratio_per_tolerance    : A list of {SD tolerance : percentage of outliers}. (0.5 < tol < 4)

    for subject in get_all_subject_from_dir(data_dir):
        subject.save_df(target_dir)

def get_all_subject_from_dir(data_dir):
    s = []
    for file in listdir(data_dir):
        d = path.join(data_dir, file)
        if path.isdir(d) and file[0] in ['s', 'S']:
            s.append(Subject(d))
    return s

def get_dir_loop(goal):
    add = input("Enter the FULL path of the desired folder")
    while True:
        if goal == SAVE_DATA_FRAMES:
            if path.isdir(add):
                break
            else:
                print("Invalid path. Try again and include '\\Data' in the path.")

        if goal == PLOT_SUBJECT:
            if path.isdir(add) and add.split("\\")[-1][0] == "s":
                break
            else:
                print("Invalid path. It should be something like:\n'C:\\...\\Data\\s00_aa_00")

        add = input("Enter the FULL path of the desired folder")

    return add

def plot_subject():
    dir = get_dir_loop(PLOT_SUBJECT)
    plt_list = []
    lst = ["%d : %s" % (i[0], i[1]) for i in enumerate(suffix.keys())]
    inp = input("Enter session number to plot, as follows:\n" + '\n'.join(
        lst) + "\nYou can enter several plots, or none if you wish to plot all sessions.\nTo finish, enter '-1'")
    while inp != '-1':
        plt_list.append(list(suffix.keys())[int(inp)])
        inp = input("Enter another session number.\nTo finish, enter '-1'")

    Subject(dir).plot(plt_list)

def input_loop():
    while True:
        choose = input("If you want to create Data Frames for all subjects, press %s. \n"
                       "If you want to plot a specific subject, press %s. \n" % (SAVE_DATA_FRAMES, PLOT_SUBJECT))

        if choose == SAVE_DATA_FRAMES:
            data_dir = get_dir_loop(SAVE_DATA_FRAMES)
            target_dir = input("To collect all DataFrames under the same folder, enter folder name.\n"
                               "Press 'Enter' to save individuals DataFrame in their origin folder.")
            save_data_frames(data_dir=data_dir, target_dir=target_dir)

        elif choose == PLOT_SUBJECT:
            plot_subject()

        print("----------------------------------")
        print("----------- D O N E --------------")
        print("----------------------------------")
        print("\n\n\n")

def analyze_and_save_subject(path):
    s = Subject(path)
    s.save()

def analyze_and_save_dyad(path):
    d = Dyad(path)
    d.save()


if __name__ == "__main__":
    if INPUT_LOOP:
        input_loop()

    else:
        # analyze_and_save_dyad(r"C:\Users\yoavsha\Desktop\LSL\Tapper\Data\d\d004")

        # subjects = get_all_subject_from_dir(data_dir=r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data_backup_28.8')
        # print(subjects[2])
        # exit()
        # sessions = subjects[2].__dict__['sessions']
        # for k in sessions:
        #     print(k)
        # save_data_frames(data_dir=r'R:\Experiments\resoFreq_vis_BEH\Glass_Tapper\Data', target_dir='alldf')
        s = Subject(r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data\s\s012_es_d006')
        s.plot([motion_small])
        # subjects = get_all_subject_from_dir(r'C:\Users\yoavsha\Desktop\LSL\Tapper\Data_backup_28.8')




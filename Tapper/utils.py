import os
import socket
from os import environ
environ['SDL_VIDEODRIVER'] = 'windows'
from kivy.config import Config
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()

# Turn this on if you are currently operating on a single computer
CLIENT_DEV_MODE = False
# Turn this on if you are currently without a touch pad, and want enable mouse touches
MOUSE_DEV_MODE = False
# Full window switch
FULL_SCREEN_MODE = True
# If False, save to current directory
SAVE_TO_DATA_AYELET = False
# When True, this computer acts like a client
OPPOS_SERVER_CLIENT = False

LSL_TCP_PORT = "22345"
ALMOTUNUI_HOSTNAME = "ALMOTUNUI"
DISPLAY3_HOSTNAME = "Display3"
if CLIENT_DEV_MODE:
    ALMOTUNUI_HOSTNAME = socket.gethostname()
    DISPLAY3_HOSTNAME = socket.gethostname()
ALMOTUNUI_IP = "132.64.189.43"
DISPLAY3_IP = "132.64.189.124"
# ------------------------------------------- Socket utilities --------------------------------------------------------
# TCP details
TCP_SERVER_HOST = ALMOTUNUI_IP
TCP_CLIENT_HOST = "0.0.0.0"
DEV_MODE_HOST = 'localhost'
TCP_PORT = 8888

# Messages pass throughout TCP
RESET = 1
SEND_MSG = 2
EXIT_APP = 0

# UDP details
UDP_HOST = "127.0.0.1"
UDP_SERVER_PORT = 2222
UDP_CLIENT_PORT = 2223

# ------------------------------------------- Basic Parameters --------------------------------------------------------
# Determines how many different touch detections can be realized by the MaxPatches machine as different channels
HANDS_ALLOWED = 2
# Zytronic reso: 130Hz - 144Hz/
# target_srate MUST be an integer divisor of LSL_SRATE
target_srate = 125
TIME_SERIES_DT = 1 / target_srate
LSL_SRATE = 500

# ------------------------------------------- Data Files formats ------------------------------------------------------
# ROOT to save files
ROOT = os.path.join(os.path.expanduser("~"), "Desktop")
if SAVE_TO_DATA_AYELET:
    ROOT = r"R:\Experiments\resoFreq_vis_BEH\MP_mot_BEH"

# directories
MAIN_DATA_DIR = ROOT + r"\Data"
ALL_DYADIC_DIR = MAIN_DATA_DIR + r"\d"
ALL_SUBJECTS_DIR = MAIN_DATA_DIR + r"\s"
# single dyadic session directory. example: Data\d_From_Display3\d001
SINGLE_DYADIC_DIR = ALL_DYADIC_DIR + r"\d%s"
# solo subject directory. example:  Data\s\s020_aa_d001
SINGLE_SUBJECT_DIR = ALL_SUBJECTS_DIR + r"\s%s_%s_d%s"
# dyadic files names. example: Data\d_From_Display3\d001\d001_s020_aa_L_s021_bb_F
DYADIC_FILE = "d%s_s%s_%s_s%s_%s"


if OPPOS_SERVER_CLIENT:
    TCP_SERVER_HOST = DISPLAY3_IP

# ------------------------------------------- Channels Constants -----------------------------------------------------
Y_AXIS_RATIO = 9/16

# ------------------------------------------- Context details ---------------------------------------------------------
# States names
subject1_register_state = 1
subject1_tasks_state = 2
subject2_register_state = 3
subject2_tasks_state = 4
dyadic_subject1_leader_state = 5
dyadic_subject2_leader_state = 6
dyadic_no_leader_state = 7
dyadic_random_state1 = 8
dyadic_random_state2 = 9
dyadic_random_state3 = 10
subject1_second_measurments = 11
subject2_second_measurments = 12
exit_state = 13

MARKERS_OUTLET_NAME = "Markers"
SCREEN_1_NAME = "Screen1"
SCREEN_2_NAME = "Screen2"
LSL_OUTLETS_NAMES = [MARKERS_OUTLET_NAME, SCREEN_1_NAME, SCREEN_2_NAME]

# Screen names
MENU = "Menu"
REGISTER = "Register"
TASK = "Task"
ENTER_NAME = "Name"
EXIT = "Exit"
CLIENT = "Client"

# Tasks names
TAPPING = "Tapper"
FREE_MOTION = "Motion"
CIRCLES = "Circles"
DYADIC_FL = "Dyadic_FL"
DYADIC_LF = "Dyadic_LF"
DYADIC = "Dyadic"

# Default timers
DEFAULT_TIMERS = {TAPPING: "60",
                  CIRCLES: "60",
                  FREE_MOTION: "180",
                  DYADIC_FL: "180",
                  DYADIC_LF: "180",
                  DYADIC: "180"}

# options for LSL markers
markers_dict = {dyadic_subject1_leader_state: {"START": "1L,2F >", "STOP": "< 1L,2F"},
                dyadic_subject2_leader_state: {"START": "1F,2L >", "STOP": "< 1F,2L"},
                dyadic_no_leader_state: {"START": "1L,2L >", "STOP": "< 1L,2L"}}
STASH_MARKER = "SESSION STOPPED"

# DataFramescolumns
subject = 'subject'
time_stamp = "TS"
ch_x = "ch%d_x"
ch_y = "ch%d_y"
right_x = "right_x"
left_x = "left_x"
right_y = "right_y"
left_y = "left_y"
tap_ID = "tap%d_ID"
vel = 'vel'
filtered_vel = 'filtered'

def generate_head_columns():
    col = []
    for ch in range(HANDS_ALLOWED):
        col.append(ch_x % (ch + 1))
        col.append(ch_y % (ch + 1))
        col.append(tap_ID % (ch + 1))
    return col + [time_stamp]

# Excel headlines per task
EXCEL_COLS_PER_TASK = {
    TAPPING: [subject, tap_ID % 1, time_stamp],
    FREE_MOTION: [subject] + generate_head_columns(),
    CIRCLES: [subject] + generate_head_columns(),
    DYADIC: [subject+'1'] + generate_head_columns() + [subject+'2'] + generate_head_columns()
}

TAPPER_inst = "In the next session you will need to tap the screen in a constant frequency, as much as you can. " \
              "\nTap on the screen to start the session."

FREE_MOTION_inst = "In the next session you will need to move freely on the screen." \
                   "\nTap on the screen to start the session."

CIRCLES_inst = "In the next session you will need to draw circles. " \
               "\nTap on the screen to start the session."

DYADIC_LF_inst = "Dyadic session #1: Subject1 is leader, and subject2 is follower. " \
                 "\nTap on the screen to start the session."

DYADIC_FL_inst = "Dyadic session #2: Subject1 is follower, and subject2 is leader. " \
                 "\nTap on the screen to start the session."

MENU_single_task_instruction = "For [b][i]{}[/i][/b] task: press {}\n"
MENU_instruction = "To cancel a session, press 'delete'\n\n\n" \
                   "To move on in the experiment: press '0'\n\n\n\n\n" \
                   "For exit anytime, press 'Escape'"

EXIT_instruction = "Experiment ended! " \
                   "\nPress ESCAPE to exit the program."

DYADIC_INST_DICTIONARY = {dyadic_subject1_leader_state: {ALMOTUNUI_HOSTNAME: "Leader", DISPLAY3_HOSTNAME: "Follower"},
                          dyadic_subject2_leader_state: {ALMOTUNUI_HOSTNAME: "Follower", DISPLAY3_HOSTNAME: "Leader"},
                          dyadic_no_leader_state: {ALMOTUNUI_HOSTNAME: "Joint Improvisation", DISPLAY3_HOSTNAME: "Joint Improvisation"}}
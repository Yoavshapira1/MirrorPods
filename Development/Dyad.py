import os.path
from abc import abstractmethod
import pandas as pd
import scipy.stats
from Development.util import EXCEL_COLS_PER_TASK as head_lines
from Development.util import *
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from scipy import signal
from os import path, mkdir
from shutil import rmtree
from Subject import DyadicMotion
from xdfFilesUtilities import load_xdf_as_data_frame
from QualityPlot import *


class Dyad:
    """
    by default, "path" should be a path to the dyad directory
    NOTICE: if either "from_xdf" or "from_excel" is True, then "path" MUST be a proper file path and not directory
    """
    def __init__(self, path, smooth=False, from_xdf=False, from_excel=False, analyze=True):
        self.path, self.from_xdf, self.from_excel = path, from_xdf, from_excel
        self.check_inputs()

        self.file, self.dyad_num, self.subject1_num, self.subject1_name,\
                                            self.subject2_num, self.subject2_name = self.parse_names(smooth)
        self.screen1_data, self.screen1_ts, self.screen2_data, self.screen2_ts, markers = self.load_data_frame()
        self.markers_labels, markers_ts = np.array(markers["time_series"]), np.array(markers["time_stamps"])
        self.markers_labels = self.markers_labels.reshape(markers_ts.shape)
        self.markers_idx = np.searchsorted(self.screen1_ts, markers_ts)
        self.sessions = self.build_sessions(analyze)

    def check_inputs(self):
        if self.from_excel and self.from_xdf:
            raise ValueError("Dyad must either be from_xdf, or from_excel, or None, but NOT BOTH")

        if self.from_xdf and os.path.isdir(self.path):
            raise ValueError("Path given to Dyad object is not a xdf file, but given from_xdf=True")

        if self.from_excel and os.path.isdir(self.path):
            raise ValueError("Path given to Dyad object is not an excel file, but given from_excel=True")

    def load_data_frame(self):
        if self.from_xdf:
            return load_xdf_as_data_frame(self.file)

        elif self.from_excel:
            return realize_pandas_df(pd.read_excel(self.file))

        else:
            return load_xdf_as_data_frame(self.file)

    def parse_names(self, smooth):
        if self.from_xdf:
            # mean a path to .xdf file has given
            file = self.path
            suff = '.xdf'

        elif self.from_excel:
            # mean a path to .xlsx file has given
            file = self.path
            if smooth:
                suff = '_smooth.xlsx'
            else:
                suff = '.xlsx'

        else:
            file = self.path + '\\'
            for f in os.listdir(self.path):
                if f.endswith('.xdf'):
                    file += f
                    suff = '.xdf'
                    break


        arr = file.split('\\')[-1].replace(suff, "").split('_')
        dyad_num, subject1_num, subject1_name, subject2_num, subject2_name = arr
        dyad_num = dyad_num.replace('d', '')
        subject1_num = subject1_num.replace('s', '')
        subject2_num = subject2_num.replace('s', '')
        return file, dyad_num, subject1_num, subject1_name, subject2_num, subject2_name

    def build_sessions(self, analyze):
        sessions = {}

        # Collect and separate the 6 sessions
        cur = None
        for count, (idx, marker) in enumerate(zip(self.markers_idx, self.markers_labels)):
            if count % 2 == 0:
                cur = int((count / 2) + 1)
                sessions[cur] = {'session': marker if self.from_excel else marker[:-2], 'start': idx}
            else:
                if marker == STASH_MARKER:
                    del (sessions[cur])
                else:
                    sessions[cur]['stop'] = idx

        # Build the DataFrame for each subject
        subject_1_df = pd.DataFrame(self.screen1_data, columns=generate_head_columns()[:-1])
        subject_1_df[time_stamp] = self.screen1_ts
        subject_2_df = pd.DataFrame(self.screen2_data, columns=generate_head_columns()[:-1])
        subject_2_df[time_stamp] = self.screen2_ts
        for count, session in sessions.items():
            start, stop = session['start'], session['stop']
            type_num = 1 if count <= 3 else 2
            session[self.subject1_num] = DyadicMotion(subject=self.subject1_num, session_number=type_num,
                                                 session=session['session'],
                                                 sample_rate=target_srate, data_frame=subject_1_df[start:stop])
            session[self.subject2_num] = DyadicMotion(subject=self.subject2_num, session_number=type_num,
                                                 session=session['session'],
                                                 sample_rate=target_srate, data_frame=subject_2_df[start:stop])
            if analyze:
                session[self.subject2_num].analyze()
                session[self.subject1_num].analyze()
        return sessions

    def save(self):
        df = pd.DataFrame()
        for count, session in self.sessions.items():
            sess1, sess2 = session[self.subject1_num], session[self.subject2_num]
            s_type, s_type_num, size = sess1.session, sess1.session_number, len(sess1.vel)
            common_session_df = pd.DataFrame({type_col: [s_type] * size,
                                              type_num_col: [s_type_num] * size,
                                              order_col: [count] * size})

            sub1, sub2 = sess1.subject, sess2.subject
            subj1_session_df = pd.DataFrame({subject: [sub1] * size,
                                             vel + '1': sess1.vel,
                                             filtered_vel + '1': sess1.vel_filtered,
                                             tap_ID % 1: sess1.data[tap_ID % 1][:-1],
                                             vel + '2': sess1.vel2,
                                             filtered_vel + '2': sess1.vel_filtered2,
                                             tap_ID % 2: sess1.data[tap_ID % 2][:-1]
                                             })

            subj2_session_df = pd.DataFrame({subject: [sub2] * size,
                                             vel + '1': sess2.vel,
                                             filtered_vel + '1': sess2.vel_filtered,
                                             tap_ID % 1: sess2.data[tap_ID % 1][:-1],
                                             vel + '2': sess2.vel2,
                                             filtered_vel + '2': sess2.vel_filtered2,
                                             tap_ID % 2: sess2.data[tap_ID % 2][:-1]
                                             })

            session_df = pd.concat([common_session_df, subj1_session_df, subj2_session_df], axis=1)
            df = pd.concat([df, session_df])
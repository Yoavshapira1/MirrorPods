from os import mkdir, listdir, rmdir
from shutil import rmtree
from kivy.uix.label import Label
from kivy.uix.popup import Popup
from numpy import random
from Tapper.App_Utilities.utils import DEFAULT_TIMERS, TAPPING, FREE_MOTION, CIRCLES, DYADIC_FL, DYADIC_LF, DYADIC, \
    dyadic_subject1_leader_state, dyadic_subject2_leader_state, dyadic_no_leader_state, subject1_register_state, \
    dyadic_random_state1, dyadic_random_state2, dyadic_random_state3, DYADIC_FILE, SINGLE_DYADIC_DIR, \
    subject1_tasks_state, subject1_second_measurments, subject2_register_state, subject2_tasks_state, \
    subject2_second_measurments, SINGLE_SUBJECT_DIR, MENU, REGISTER, EXIT


class Context:
    def __init__(self, connection, dyad_number=1, lsl_rsc_conn=None):
        self.connection = connection
        self.lsl_rsc_conn = lsl_rsc_conn
        self.lsl_recroding_is_active, self.has_dyadic_session = False, False
        self.dyad_number = self.get_dyadic_num_as_string(dyad_number)
        self.sm, self.subject1_name, self.subject2_name, self.subject1_number, self.subject2_number,\
            self.subject1_dir, self.subject2_dir, self.dyadic_dir =\
            None, None, None, None, None, None, None, None
        self.tasks = []
        self.TAPPER_timers = DEFAULT_TIMERS[TAPPING]
        self.FREE_MOTION_timers = DEFAULT_TIMERS[FREE_MOTION]
        self.CIRCLES_timers = DEFAULT_TIMERS[CIRCLES]
        self.DYADIC_FL_timers = DEFAULT_TIMERS[DYADIC_FL]
        self.DYADIC_LF_timers = DEFAULT_TIMERS[DYADIC_LF]
        self.DYADIC_timers = DEFAULT_TIMERS[DYADIC]
        self.dyadic_rnd_pool = [dyadic_subject1_leader_state, dyadic_subject2_leader_state, dyadic_no_leader_state]
        random.shuffle(self.dyadic_rnd_pool)
        self.state = subject1_register_state

    def get_tasks(self):
        return self.tasks

    def get_connection(self):
        return self.connection

    def get_screen_manager(self):
        return self.sm

    def get_state(self):
        if self.state == dyadic_random_state1:
            return self.dyadic_rnd_pool[0]
        if self.state == dyadic_random_state2:
            return self.dyadic_rnd_pool[1]
        if self.state == dyadic_random_state3:
            return self.dyadic_rnd_pool[2]
        return self.state

    def start_lsl_recording(self):
        session = DYADIC_FILE % (self.dyad_number, self.subject1_number, self.subject1_name,
                                      self.subject2_number, self.subject2_name)
        n_dir = SINGLE_DYADIC_DIR % self.dyad_number

        n_of_files = ""
        n = 1
        try:
            mkdir(n_dir)
        except:
            for f in listdir(n_dir):
                if f.endswith(".xdf"):
                    n += 1
        if n > 1:
            n_of_files = "_%d" % n

        file_name_template = "{template:%s.xdf}"
        command = "filename {root:%s\} %s {session:%s}\n" % (n_dir, file_name_template, session + n_of_files)
        self.lsl_rsc_conn.sendall(b"update\n")
        self.lsl_rsc_conn.recv(1024)
        self.lsl_rsc_conn.sendall(command.encode())
        self.lsl_rsc_conn.recv(1024)
        self.lsl_rsc_conn.sendall(b"start\n")
        self.lsl_rsc_conn.recv(1024)
        self.lsl_recroding_is_active = True

    def stop_lsl_recording(self):
        if self.lsl_recroding_is_active:
            self.lsl_rsc_conn.sendall(b"stop\n")
            self.lsl_rsc_conn.recv(1024)
        self.lsl_recroding_is_active = False

    def get_subject_number(self, i=None):
        if i == 1 or self.state in [subject1_register_state, subject1_tasks_state, subject1_second_measurments]:
            return self.subject1_number
        elif i == 2 or self.state in [subject2_register_state, subject2_tasks_state, subject2_second_measurments]:
            return self.subject2_number
        else:
            return "n/a"

    def get_subject_name(self, i=None):
        if i == 1 or self.state in [subject1_register_state, subject1_tasks_state, subject1_second_measurments]:
            return self.subject1_name
        elif i == 2 or self.state in [subject2_register_state, subject2_tasks_state, subject2_second_measurments]:
            return self.subject2_name
        else:
            return "n/a"

    def get_cur_dir(self):
        if self.state in [subject1_register_state, subject1_tasks_state, subject1_second_measurments]:
            return self.subject1_dir

        elif self.state in [subject2_register_state, subject2_tasks_state, subject2_second_measurments]:
            return self.subject2_dir

        else:
            return self.dyadic_dir

    def get_timer(self, session):
        if session == TAPPING:
            return self.TAPPER_timers
        elif session == FREE_MOTION:
            return self.FREE_MOTION_timers
        elif session == CIRCLES:
            return self.CIRCLES_timers
        elif session == DYADIC_LF:
            return self.DYADIC_LF_timers
        elif session == DYADIC_FL:
            return self.DYADIC_FL_timers
        elif session == DYADIC:
            return self.DYADIC_timers

    def add_task(self, task):
        if task == DYADIC:
            self.tasks.append(DYADIC_LF)
            self.tasks.append(DYADIC_FL)
        self.tasks.append(task)

    def set_screen_manager(self, sm):
        self.sm = sm

    def set_timer(self, new_value, task=None):
        if task == TAPPING:
            self.TAPPER_timers = new_value
        elif task == FREE_MOTION:
            self.FREE_MOTION_timers = new_value
        elif task == CIRCLES:
            self.CIRCLES_timers = new_value
        elif task == DYADIC_LF:
            self.DYADIC_LF_timers = new_value
        elif task == DYADIC_FL:
            self.DYADIC_FL_timers = new_value
        elif task == DYADIC:
            self.DYADIC_timers = new_value

    def set_subject_name(self, name):
        if self.state == subject1_register_state:
            self.subject1_name = name

        elif self.state == subject2_register_state:
            self.subject2_name = name

    def set_subject_number(self, number):
        if self.state == subject1_register_state:
            self.subject1_number = number

        elif self.state == subject2_register_state:
            self.subject2_number = number

    def create_dir(self):
        if self.state == subject1_register_state:
            self.subject1_dir = SINGLE_SUBJECT_DIR % (self.subject1_number, self.subject1_name, self.dyad_number)
            mkdir(self.subject1_dir)

        elif self.state == subject2_register_state:
            self.subject2_dir = SINGLE_SUBJECT_DIR % (self.subject2_number, self.subject2_name, self.dyad_number)
            mkdir(self.subject2_dir)

        if self.subject1_dir is not None and self.subject2_dir is not None and self.dyad_number is not None:
            self.dyadic_dir = SINGLE_DYADIC_DIR % self.dyad_number
            mkdir(self.dyadic_dir)

    def remove_empty_dirs(self):
        if not listdir(self.subject1_dir):
            rmdir(self.subject1_dir)

        if not listdir(self.subject2_dir):
            rmdir(self.subject2_dir)

        if self.dyadic_dir is not None:
            if not listdir(self.dyadic_dir):
                rmdir(self.dyadic_dir)
            else:
                if not self.has_dyadic_session:
                    rmtree(self.dyadic_dir)

    def prev_state(self):
        self.state -= 1

    def second_individual_popup(self, subj):
        popup = Popup(title="Attention", content=Label(text="Now record the second individual measurements"
                                                            "for the %s subject.\n"
                                                            "Press anywhere on the screen to close this." % subj),
                      size_hint=(0.7, 0.25))
        popup.open()

    def next_state(self):
        if self.state in [subject1_register_state, subject2_register_state]:
            self.reset_tasks_counters()
            self.sm.current = MENU

        elif self.state == subject1_tasks_state:
            self.sm.current = REGISTER

        elif self.state == subject2_tasks_state:
            if DYADIC not in self.tasks:
                self.sm.current = EXIT
            else:
                self.sm.current = DYADIC

        elif self.state == dyadic_subject1_leader_state:
            self.has_dyadic_session = True

        elif self.state == dyadic_random_state3:
            self.second_individual_popup("first")
            self.reset_tasks_counters(2)
            self.sm.current = MENU

        elif self.state == subject1_second_measurments:
            self.second_individual_popup("second")
            self.reset_tasks_counters(2)
            self.sm.current = MENU

        elif self.state == subject2_second_measurments:
            self.sm.current = EXIT

        self.state += 1
        return self.state

    def skip_to_state(self, state):
        self.state = state
        if state >= dyadic_subject1_leader_state:
            self.has_dyadic_session = True
            self.sm.current = DYADIC

    def get_dyadic_num_as_string(self, n):
        if n is None:
            return None
        return ("00%d" % n)[-3:]

    def reset_tasks_counters(self, value=0):
        self.sm.get_screen(TAPPING).reset_counter(value)
        self.sm.get_screen(FREE_MOTION).reset_counter(value)
        self.sm.get_screen(CIRCLES).reset_counter(value)

    def __str__(self):
        return ("State: %d\n"
                "subject1: %s\n"
                "subject2: %s\n"
                "cur_dir: %s\n"
                "timers: %s\n%s\n%s\n%s\n%s\n" % (self.state, self.subject1_name, self.subject2_name, self.get_cur_dir(),
                                                  self.TAPPER_timers, self.FREE_MOTION_timers, self.DYADIC_FL_timers,
                                                  self.DYADIC_LF_timers, self.DYADIC_timers))
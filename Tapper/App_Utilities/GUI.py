from Tapper.App_Utilities.utils import *
from re import compile, sub
from kivy.uix.label import Label
from kivy.uix.popup import Popup
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.uix.spinner import Spinner
from kivy.uix.boxlayout import BoxLayout
import os


class EnterText(BoxLayout):
    """
    A box layout for changing one of the experiment's parameters, such as timers for tasks or subjects name
    As a default, this object is used for the timers change options, and the 'change_value' method attempt
    to change the timer of the specific task.
    However, another object may inherit this object and override 'change_value', such as EnterName
    :param sm: A <code>Screen Manager</code> should be the one from the 'Context' object
    :param size_hint_y: <code>Float</code> Relative size on y axis
    :param do_msg: <code>String</code> Tells the user what this box does
    :param err_msg: <code>String</code> raise the user a typo error
    :param regex: <code>String</code> regex represents the acceptable input
    :param old_value: <code>String</code> either a name of a task or None, in case of changing a directory name
    """

    def __init__(self, sm, do_msg, err_msg, regex, context, old_value=None, **kwargs):
        super().__init__(**kwargs)
        self.screen_manager = sm
        self.orientation = 'horizontal'
        self.msg = do_msg
        self.err_msg = err_msg
        self.re = compile(regex)
        self.context = context
        self.old_value = old_value

        self.txt = TextInput(hint_text=self.msg, size_hint=(.8, 1.), multiline=False)
        self.add_widget(self.txt)

        self.btn = Button(text='Enter', on_press=self.change_value, size_hint=(.2, 1.))
        self.add_widget(self.btn)

    def change_value(self, instance):
        if not self.re.match(self.txt.text):
            popup = Popup(title="Error", content=Label(text=self.err_msg),
                          size_hint=(0.35, 0.25))
            popup.open()
        else:
            self.context.set_timer(task=self.old_value, new_value=self.txt.text)


class EnterName(EnterText):
    """
    An instance of 'EnterText' object, with a proper regex and strings for the specific task
    of changing the subject's name.
    :param context: <code>Context</code> object with the context of this experiment
    """

    name_err_msg = "Invalid name!\nName should be in the format:\nsXXX_xx\nwhere XXX is the number of the subject" \
                   "\nand xx is the initials of subject's name"
    name_do_msg = "enter a name"
    name_regex = "s\d{3}_\w{2}"

    def __init__(self, context, **kwargs):
        self.context = context
        super().__init__(do_msg=self.name_do_msg, err_msg=self.name_err_msg,
                         context=context, regex=self.name_regex, **kwargs)

    def change_value(self, instance):
        # name of subject should be in a specific format
        if not self.re.match(self.txt.text):
            popup = Popup(title="Error", content=Label(text=self.err_msg),
                          size_hint=(0.35, 0.25))
            popup.open()
            return

        number, name = self.txt.text.split("_")
        # if this number of subject already exists
        for d in os.listdir(ALL_SUBJECTS_DIR):
            if d.startswith(number):
                popup = Popup(title="Error", content=Label(text="This subject's number already exists."),
                              size_hint=(0.35, 0.25))
                popup.open()
                return

        # on success
        else:
            self.context.set_subject_number(number[1:])
            self.context.set_subject_name(name)
            self.context.create_dir()
            self.context.next_state()


class EnterInteger(EnterText):
    """
    An instance of 'EnterText' object, with a proper regex and strings for the specific task
    of changing a task's timer.
    :param task: <code>String</code> the name of the task
    :param context: <code>Context</code> object with the context of this experiment
    """

    reg = "^[1-9]\d*$"
    err = 'Value must be a positive integer'
    do = "Enter a timer for the %s mission interval.\nDefault is %s"

    def __init__(self, task, context, **kwargs):
        super().__init__(do_msg=self.do % (task, context.get_timer(task)),
                         err_msg=self.err, regex=self.reg, context=context, old_value=task, **kwargs)


class SkipTo(BoxLayout):
    """
    A pop-up message suggest to skip to a specific stage in the experiment.
    """
    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.orientation = 'vertical'
        self.spacing = 20
        self.padding = 20
        self.answers = ["Don't Skip", 'Subject2 Registration', 'Dyadic 1 (LF)', 'Dyadic 2 (FL)', 'Dyadic 3 (LL)',
                        'Dyadic 4 (random)', 'Dyadic 5 (random)', 'Dyadic 6 (random)']
        self.states = [subject1_register_state, subject2_register_state, dyadic_subject1_leader_state,
                       dyadic_subject2_leader_state, dyadic_no_leader_state, dyadic_random_state1,
                       dyadic_random_state2, dyadic_random_state3]
        self.dict = dict(zip(self.answers, self.states))

        # Initialize the ans variable
        self.state_to_start = self.dict[self.answers[0]]

        self.popup_skip_or_not(self)

    def popup_skip_or_not(self, instance):
        # Create the popup
        self.skip_or_not_popup = Popup(title='Skip or not?', size_hint=(0.8, 0.6))

        # Create the content for the popup
        content = BoxLayout(orientation='vertical', spacing=10, padding=10)
        self.content_dropdown = Spinner(text=self.answers[0], values=self.answers, size_hint=(1, 0.05), background_color=[1, 1, 1, 1], color=[0, 0, 0, 1])
        content_button_start = Button(text='Start', size_hint=(1, 0.2), font_size=36)
        content_button_start.bind(on_release=self.start)
        content.add_widget(self.content_dropdown)
        content.add_widget(content_button_start)

        # Add the content to the popup
        self.skip_or_not_popup.content = content

        # Open the popup
        self.skip_or_not_popup.open()

    def enter_dyad_number(self, title="Enter Dyad Number"):
        self.dyad_number_popup = Popup(title='Dyad Number?', size_hint=(0.8, 0.25))

        content = BoxLayout(orientation='horizontal', spacing=10, padding=10)
        self.txt = TextInput(hint_text=title, size_hint=(.8, 1.), font_size=28, multiline=False)
        content.add_widget(self.txt)

        btn = Button(text='Enter', on_press=self.skip, size_hint=(.2, 1.))
        content.add_widget(btn)

        self.dyad_number_popup.content = content
        self.dyad_number_popup.open()

    def start(self, instance):
        self.state_to_start = self.dict[self.content_dropdown.text]
        if self.state_to_start > 1:
            self.enter_dyad_number()
        self.skip_or_not_popup.dismiss()

    def skip(self, instance):
        dyad = self.txt.text
        self.dyad_number_popup.dismiss()

        # return values of "find_information_about_the_state":
        # if desired state is subject 2 registration -> [sub1_num, sub1_name, dyad_as_string]
        # else:
        #      return either None or tuple (path, info)
        #      info: either [[num, name],[num, name]] or None
        find_information = self.find_information_about_the_state(dyad)

        if self.state_to_start == subject2_register_state:
            # fill context information with subject1 info and skip to subject2 registration
            self.context.subject1_name, self.context.subject1_number, self.context.dyad_number = find_information
            self.context.skip_to_state(self.state_to_start)
            self.clear_widgets()
            return

        # In case wrong dyad was entered
        if find_information is None:
            self.enter_dyad_number(title="Wrong dyad number, try again")

        # dyad is found
        else:
            dyad_dir_path, session_info = find_information
            if not session_info:
                dyad, s1_num, s1_name, s2_num, s2_name = self.extract_session_info(dyad_dir_path)
            else:
                s1_num, s1_name = session_info[0]
                s2_num, s2_name = session_info[1]
                dyad = ("00%s" % dyad)[-3:]

            # fill context information and skip to desired session
            self.context.subject1_name, self.context.subject2_name, self.context.subject1_number,\
                self.context.subject2_number, self.context.dyad_number = s1_name, s2_name, s1_num, s2_num, dyad
            self.context.skip_to_state(self.state_to_start)
            self.clear_widgets()

    def find_information_about_the_state(self, dyad):
        if self.state_to_start == subject2_register_state:
            # find the dyad number, and subject 1 information
            for f in os.listdir(ALL_SUBJECTS_DIR):
                if f.endswith(dyad):
                    subject_number, subject_name = f.split("_")[-3:-1]
                    dyad_as_string = ("00%d" % int(dyad))[-3:]
                    return subject_number, subject_name, dyad_as_string

        # search for the dyad directory
        for f in os.listdir(ALL_DYADIC_DIR):
            if os.path.isdir(ALL_DYADIC_DIR + r"\%s" % f):
                if int(sub('\D', '', f)) == int(dyad):
                    return ALL_DYADIC_DIR + r"\%s" % f, None

        # reaching here => there is no dyad directory. however, the solos may exist, if yes - create directory
        subjects = []
        for f in os.listdir(ALL_SUBJECTS_DIR):
            if f.endswith(dyad):
                subject_number, subject_name = f.split("_")[-3:-1]
                subjects.append([subject_number[1:], subject_name])

                # if both subjects exist, so create a dyad directory
                if len(subjects) == 2:
                    dyad_as_string = ("00%d" % int(dyad))[-3:]
                    dir_path = SINGLE_DYADIC_DIR % dyad_as_string
                    os.mkdir(dir_path)
                    return dir_path, subjects

        return None

    def extract_session_info(self, dyad_dir_path):
        for f in os.listdir(dyad_dir_path):
            if f.endswith(".xdf"):
                dyad, s1_num, s1_name, s2_num, s2_name = f[:-4].split("_")
                s1_num, s2_num, dyad = s1_num[1:], s2_num[1:], dyad[1:]
                return dyad, s1_num, s1_name, s2_num, s2_name
        return None

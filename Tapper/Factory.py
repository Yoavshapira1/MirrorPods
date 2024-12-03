from kivy.uix.floatlayout import FloatLayout
from pylsl import local_clock, StreamInfo, StreamOutlet

from GUI import *
from SoloTasks import *
from kivy.uix.screenmanager import Screen
from kivy.core.window import Window
from kivy.uix.gridlayout import GridLayout

from Tapper.LslOutlet import LSLOutlet
from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetDyadic import MirrorPodsWidgetDyadic
from kivy.app import App


class MenuScreen(Screen):
    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.instructions = MENU_instruction
        self._helper = ""
        for c, task in enumerate(self.context.get_tasks(), start=1):
            if task in [TAPPING, FREE_MOTION, CIRCLES]:
                self._helper += MENU_single_task_instruction.format(task, c)
        self.add_widget(Label(text=self._helper + self.instructions, font_size=26, markup=True))

    def on_enter(self):
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self._on_keyboard_down)

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self._on_keyboard_down)

    def _on_keyboard_down(self, keyboard, keycode, text, modifiers):
        input = keycode[1]
        for c, task in enumerate(self.context.get_tasks(), start=1):
            if input == ("%d" % c) and task in [TAPPING, FREE_MOTION, CIRCLES]:
                self._keyboard_closed()
                self.context.get_screen_manager().current = task
                return

        if input == '0':
            self._keyboard_closed()
            if self.context.next_state() == subject2_second_measurments:
                self.on_enter()


class ExitScreen(Screen):
    instructions = EXIT_instruction

    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context

    def on_enter(self):
        welcome = Button(text=self.instructions, font_size=24, background_color=[0, 0, 0, 0])
        self.add_widget(welcome)


class RegisterScreen(Screen):
    """Register a subject in the experiment
        :param context: Context object, contains the screen manager object of the App
    """

    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.sm = context.get_screen_manager()

    def check_for_mouse_mode(self):
        if MOUSE_DEV_MODE:
            popup = Popup(title="Attention", content=Label(text="Attention! Mouse development mode is active.\n"
                                                                "If you wish to change it, do it in both machines"),
                          size_hint=(0.7, 0.25))
            popup.open()

    def on_enter(self):
        if self.context.get_state() == 1:
            self.check_for_mouse_mode()
            SkipTo(self.context)

        # Timers setting
        enter_timers_layout = GridLayout(rows=8, orientation='tb-lr')
        enter_timers_layout.add_widget(
            Label(text='Timers setting. Do not enter anything if you want the default values.'))
        for task_name in self.context.get_tasks():
            enter_timers_layout.add_widget(
                EnterInteger(sm=self.sm, task=task_name, context=self.context, size_hint=(.5, .5)))

        # Subject name setting
        enter_name_layout = GridLayout(rows=4, orientation='tb-lr')
        enter_timers_layout.add_widget(Label(text="Enter subject's name:", font_size='36sp'))
        enter_name_layout.add_widget(enter_timers_layout)
        enter_name_layout.add_widget(EnterName(sm=self.sm, context=self.context))

        # Build the setting Screen
        self.add_widget(enter_name_layout)


class SubjectTasksScreen(Screen):
    """
    A wrapper for the different kinds of tasks. (i.e. Tapper, FreeMotion).
    Making a new instance of one of those should use this wrapper.
        :param context:         Context object
        :param kind:            String object holds the name of the task (Tapper, Free Motion, etc.)
        :param event:           Kivy.Clock.ClockEvent object, the event of ending the session
        :param task:            Task object, an instance of the task itself
    """
    instructions = {TAPPING: TAPPER_inst, FREE_MOTION: FREE_MOTION_inst, CIRCLES: CIRCLES_inst}

    def __init__(self, context, name, **kwargs):
        super().__init__(name=name, **kwargs)
        self.context = context
        self.kind = name
        self.event = None
        self.task = self.build_task()

    def build_task(self):
        """create the specific task instance for this screen"""
        if self.kind == TAPPING:
            return TappingTask(context=self.context)

        elif self.kind == FREE_MOTION:
            return FreeMotionTask(context=self.context)

        elif self.kind == CIRCLES:
            return CirclesMotionTask(context=self.context)

    def reset_counter(self, value=0):
        """this called immediately after a new subject is registered"""
        self.task.counter = value

    def on_enter(self):
        """mark this session as started, listen to 'delete' key, and show instructions"""
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self._on_keyboard_down)
        welcome = Button(text=self.instructions[self.kind], on_touch_down=self.program)
        self.add_widget(welcome)

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self._on_keyboard_down)

    def _on_keyboard_down(self, keyboard, keycode, text, modifiers):
        if keycode[1] == 'delete':
            self._keyboard_closed()
            self._stash()

    def _stash(self):
        """stash this session in case user pressed 'delete'"""
        if self.task.active:
            self.task.stash()
        self.clear_widgets()
        if self.event is not None:
            ClockEvent.cancel(self.event)
        self.context.get_screen_manager().current = MENU

    def program(self, *largs):
        """ run the current program """
        self.clear_widgets()
        self.add_widget(self.task)
        self.task.start()
        self.event = Clock.schedule_once(self.end, int(self.context.get_timer(self.kind)))

    def end(self, *largs):
        self.task.stop(time=self.context.get_timer(self.kind))
        self.clear_widgets()
        self.context.get_screen_manager().current = MENU


class DyadicServerScreen(Screen):
    instructions = DYADIC_INST_DICTIONARY
    markers = markers_dict

    def __init__(self, context, n_channels=HANDS_ALLOWED, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.conn = self.context.get_connection()
        self.event = None
        self.active = False
        info = StreamInfo(MARKERS_OUTLET_NAME, 'Markers', 1, 0, 'string', MARKERS_OUTLET_NAME)
        self.lsl_markers_outlet = StreamOutlet(info)
        self.mp_widg = MirrorPodsWidgetDyadic(n_channels=n_channels)

    def send_to_LSL(self, dt):
        elapsed_time = local_clock() - self.lsl_outlet.start_time
        required_samples = int(self.lsl_outlet.srate * elapsed_time) - self.lsl_outlet.sent_samples
        for sample_ix in range(required_samples):
            mysample = self.mp_widg.get_data()
            self.lsl_outlet.outlet.push_sample(mysample)
        self.lsl_outlet.sent_samples += required_samples

    def on_enter(self):
        """mark this session as started, listen to 'delete' key, and show instructions"""
        self.lsl_outlet = LSLOutlet()
        self.lsl_event = Clock.schedule_interval(self.send_to_LSL, 1 / LSL_SRATE)
        self.timers = {}
        self.timers[dyadic_subject1_leader_state] = self.context.get_timer(DYADIC_LF)
        self.timers[dyadic_subject2_leader_state] = self.context.get_timer(DYADIC_FL)
        self.timers[dyadic_no_leader_state] = self.context.get_timer(DYADIC)
        self.add_widget(self.mp_widg)
        self.context.start_lsl_recording()
        self.before_session()

    def _listen_to_0_key_closed(self):
        self._keyboard.unbind(on_key_down=self._listen_to_0_key)

    def _listen_to_0_key(self, keyboard, keycode, text, modifiers):
        if keycode[1] == '0':
            self.start_session()

    def _listen_to_delete_key_closed(self):
        self._keyboard.unbind(on_key_down=self._listen_to_delete_key)

    def _listen_to_delete_key(self, keyboard, keycode, text, modifiers):
        if keycode[1] == 'delete':
            self._stash()

    def _stash(self):
        """stash this session in case user pressed 'delete'"""
        self.active = False
        self.mp_widg.deactivate()
        self.lsl_markers_outlet.push_sample([STASH_MARKER])
        self._listen_to_delete_key_closed()
        if self.event:
            ClockEvent.cancel(self.event)
        self.before_session()

    def show_text(self):
        self.text_layout = FloatLayout()
        inst = self.instructions[self.context.get_state()][socket.gethostname()]
        button = Button(text=inst, font_size=120, background_color=[0, 0, 0, 0])
        label = Label(text="Press 0 to start the session", font_size=24, pos_hint={"center_x": 0.5, "center_y": 0.1})
        self.text_layout.add_widget(button)
        self.text_layout.add_widget(label)
        self.add_widget(self.text_layout)

    def reset_tasks(self):
        self.mp_widg.reset()
        self.conn.sendall(bytes([RESET, self.context.get_state()]))

    def before_session(self):
        self.reset_tasks()
        self._keyboard = Window.request_keyboard(self._listen_to_0_key_closed, self)
        self._keyboard.bind(on_key_down=self._listen_to_0_key)
        self.show_text()

    def start_session(self):
        self._listen_to_0_key_closed()
        self._keyboard = Window.request_keyboard(self._listen_to_delete_key_closed, self)
        self._keyboard.bind(on_key_down=self._listen_to_delete_key)
        self.lsl_markers_outlet.push_sample([self.markers[self.context.get_state()]["START"]])
        self.active = True
        self.mp_widg.activate()
        self.conn.sendall(bytes([SEND_MSG, 0]))
        self.remove_widget(self.text_layout)
        self.event = Clock.schedule_once(self.end_session, int(self.timers[self.context.get_state()]))

    def end_session(self, dt):
        self.active = False
        self.mp_widg.deactivate()
        self.lsl_markers_outlet.push_sample([self.markers[self.context.get_state()]["STOP"]])
        self._listen_to_delete_key_closed()
        if self.context.next_state() == subject1_second_measurments:
            return Clock.schedule_once(self.exit, 1)
        self.before_session()

    def exit(self, dt):
        self.clear_widgets()
        self.context.stop_lsl_recording()


class ClientScreen(Screen):
    """
    A blank screen for the Client
    Infinitely loops on MotionTask with TcpBroadcaster
    """
    instructions = DYADIC_INST_DICTIONARY

    def __init__(self, context, n_channels=HANDS_ALLOWED, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.conn = context.get_connection()
        self.mp_widg = MirrorPodsWidgetDyadic(n_channels=n_channels)
        self.add_widget(self.mp_widg)
        self.lsl_outlet = LSLOutlet()
        self.lsl_event = Clock.schedule_interval(self.send_to_LSL, 1 / LSL_SRATE)
        self.event = Clock.schedule_interval(self.listen_to_server, TIME_SERIES_DT)

    def send_to_LSL(self, dt):
        elapsed_time = local_clock() - self.lsl_outlet.start_time
        required_samples = int(self.lsl_outlet.srate * elapsed_time) - self.lsl_outlet.sent_samples
        for sample_ix in range(required_samples):
            mysample = self.mp_widg.get_data()
            self.lsl_outlet.outlet.push_sample(mysample)
        self.lsl_outlet.sent_samples += required_samples

    def follow_msg(self, msg):
        sign, state = msg
        if sign == RESET:
            self.mp_widg.reset()
            inst = self.instructions[int(state)][socket.gethostname()]
            self.button = Button(text=inst, font_size=120, background_color=[0, 0, 0, 0])
            self.add_widget(self.button)

        elif sign == SEND_MSG:
            self.remove_widget(self.button)

        elif sign == EXIT_APP:
            App.get_running_app().stop()

    def listen_to_server(self, dt):
        try:
            msg = self.conn.recv(2)
            self.follow_msg(list(msg))
        except socket.timeout:
            pass

class SingletonMeta(type):
    """helper class to define the Factory object as a singleton"""
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]


class Factory(metaclass=SingletonMeta):
    def __init__(self, context):
        self.context = context
        self.sm = self.context.get_screen_manager()

    def build_screen(self, screen_name):
        if screen_name == REGISTER:
            self.sm.add_widget(RegisterScreen(self.context, name=screen_name))

        elif screen_name == MENU:
            self.sm.add_widget(MenuScreen(context=self.context, name=screen_name))

        elif screen_name == EXIT:
            self.sm.add_widget(ExitScreen(context=self.context, name=screen_name))

        elif screen_name == CLIENT:
            self.sm.add_widget(ClientScreen(context=self.context, name=screen_name))

        elif screen_name == DYADIC:
            self.context.add_task(screen_name)
            self.sm.add_widget(DyadicServerScreen(context=self.context, name=screen_name))

        else:
            self.context.add_task(screen_name)
            self.sm.add_widget(SubjectTasksScreen(context=self.context, name=screen_name))
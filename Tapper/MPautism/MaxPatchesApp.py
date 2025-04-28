import pickle
import socket
import time
import ctypes
from pythonosc.udp_client import SimpleUDPClient
from Tapper.App_Utilities.BroadCasters import MaxMspBroadcaster
from Tapper.MPautism.ChooseProtocolWidget import ProtocolWidget, ChoosePatchWidget
from Tapper.App_Utilities.utils import MAIN_CPU, SECONDARY_CPU, MAIN_CPU_IP, SECONDARY_CPU_IP
from Tapper.Mirror_Pods_Widgets.SoundsPods import SoundsPods
from Tapper.MPautism.ChooseProtocolWidget import patches
from Tapper.MPautism.sync_utilities import sync_measures
from udp_utilitites import *
from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.core.window import Window
from os import environ
environ['SDL_VIDEODRIVER'] = 'windows'
TITLE = 'KivyOnTop'
from kivy.clock import Clock
from kivy.config import Config
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()

FULL_WINDOW = False
TIME_SERIES_DT = 0.001   # sampling rate
MODE = "wm_touch"        # change between "wm_touch" and "mouse"
# how synchronization is measured, options are:
# distance, velocity, acceleration
SYNC_MEASURE = "distance"
# sync measures messages rate, in ratio to normal positional message. performs time smooth to the sync signal
sync_msg_ratio = 10 if SYNC_MEASURE == "velocity" else 1


# UDP info for main computer
host = "127.0.0.1"
main_patch_client = SimpleUDPClient(host, main_patch_port)               # tell Max what patch to open
on_off_client = SimpleUDPClient(host, ON_OFF_port)                       # tell Max to shut down/turn on a patch
max_sync_measure_client = SimpleUDPClient(host, max_sync_measure_port)   # tell Max the synchronization value
udp_to_client = SimpleUDPClient(SECONDARY_CPU_IP, 8765)             # communicate with other cpu
# TODO: delete this line
udp_to_client = SimpleUDPClient(host, 8765)             # communicate with other cpu
sync_data_ip = MAIN_CPU_IP

# messages to MAX variables
subjName = "subjectName"   # for naming the file
OPEN = "OPEN"           # open a certain patch
COUNTER = "NUM"         # for naming the file
REC_ON = "RECON"       # indicate to record the session
REC_OFF = "RECOFF"     # indicate to not record the session
ON = "ON"               # sounds on
OFF = "OFF"             # sounds (and recordings if any) off
SYNC = "sync"
VIDEO = "video"

delay_to_start = 2   # let Max open the patch fully

# helper function to send UDP messages, given udp client and a message
def send_udp_message(udp_client, address, message):
    print(udp_client._address, udp_client._port, address, message)
    udp_client.send_message(address, message)


# Screens
class ChooseProtocolScreen(Screen):
    # this screen appears on the application is starts. this is a container for the ChoosingProtocolWidget
    # that asks the user for the desired protocol to run: load onr or create a new one

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.widget = ProtocolWidget()
        self.add_widget(self.widget)

class RegisterNamesScreen(Screen):
    # this screen appears after the user chose a protocol, and it container for the subject names registration

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        parent_layout = FloatLayout()
        self.layout = BoxLayout(orientation="vertical", size_hint=(None, None), size=(400, 200),
                                pos_hint={"center_x": 0.5, "center_y": 0.5},
                                padding=10, spacing=10)
        self.label = Label(text="Enter subject name:")
        self.text_input = TextInput(multiline=False, on_text_validate=self.submit_name)
        self.submit_button = Button(text="Submit")
        self.submit_button.bind(on_press=self.submit_name)
        self.layout.add_widget(self.label)
        self.layout.add_widget(self.text_input)
        self.layout.add_widget(self.submit_button)
        self.add_widget(self.layout)

    def submit_name(self, instance):
        name = self.text_input.text.strip()
        if name:
            app = App.get_running_app()
            app.names = name
            send_udp_message(main_patch_client, subjName, name)
            self.manager.current = "instruction"
        else:
            self.label.text = "Enter a name to proceed."

class InstructionScreen(Screen):
    # this screen appears before every task and it waits to the user to start the task

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.current_patch = None
        self.timer = None
        self.layout = None
        self.patch_info = None
        self.is_repeated = False
        self.is_recording = True

    def on_enter(self):

        # listen to keyboard; when "Enter" pressed - start the task
        Window.bind(on_key_down=self.on_key_down)  # Bind keyboard events

        app = App.get_running_app()

        # if the current block is a repeated block, it means that the last block is a spare one - pop it
        if not self.is_repeated:
            self.current_patch, self.timer = app.protocol_blocks.pop(0)
        app.current_patch = self.current_patch
        app.current_timer = int(self.timer)

        # Update count and show instructions
        self.patch_info = patches[self.current_patch]
        self.patch_info["count"] += 1

        self.layout = BoxLayout(orientation="vertical", padding=10, spacing=10)
        self.patch_label = Label(text=f"{self.patch_info['instructions']}", font_size=26)
        self.layout.add_widget(self.patch_label)
        self.layout.add_widget(Label(text="Press Enter to start", font_size=14))
        self.add_widget(self.layout)

    def on_key_down(self, instance, keycode, text, modifiers, *kargs):
        # listen to keyboard; when "Enter" pressed - start the task

        if keycode == 13:  # 13 is the "Enter" key
            self.handle_enter_press()

        if keycode == 8:  # 8 is the "Backspace" key
            end_screen = self.manager.get_screen("end")
            if not end_screen.is_demonstration:
                self.handle_backspace_press()

    def handle_enter_press(self):
        # when "Enter" is pressed

        app = App.get_running_app()

        # Transition to MyWidget screen
        self.manager.current = "sounds_widget"

        # send message to start the patch
        send_udp_message(main_patch_client, self.patch_info["name"], OPEN)
        time.sleep(delay_to_start)
        send_udp_message(on_off_client, self.patch_info["name"], f"{COUNTER} {self.patch_info['count']}")
        if self.is_recording:
            send_udp_message(on_off_client, self.patch_info["name"], REC_ON)
        else:
            send_udp_message(on_off_client, self.patch_info["name"], REC_OFF)
        send_udp_message(on_off_client, self.patch_info["name"], ON)
        send_udp_message(on_off_client, self.patch_info["name"], OFF)

    def handle_backspace_press(self):
        # when "Backspace" is pressed
        app = App.get_running_app()

        # Transition to end screen, where user able to start a random patch
        self.manager.current = "end"

    def on_leave(self, *args):
        # when finished, stop listening to keyboard and clear the screen (prevent the labels to show on next block)

        Window.unbind(on_key_down=self.on_key_down)
        self.clear_widgets()

class SoundsPodScreen(Screen):
    # this screen appears during the tasks, and it contains the SoundsWidget

    def __init__(self, mode=MODE, n_channels=2, positional=False, **kwargs):
        super().__init__(**kwargs)
        self.positional = positional
        self.mode = mode
        self.broadcaster = MaxMspBroadcaster(channels=n_channels, positional=self.positional, port=data_to_max_port_client_almotunui)
        self.mp_widg = SoundsPods(n_channels=n_channels, mode=self.mode)
        self.timer, self.sampling_event = None, None
        self.broadcasts_counter = 0

    def on_enter(self):
        # starts the sampling event and the timer

        # listen to keyboard; "Space" for finish and "Delete" for repeat the task
        Window.bind(on_key_down=self.on_key_down)

        # define the listener to data from other cpu
        self.main_cpu_listen_to_second()

        app = App.get_running_app()
        self.mp_widg.set_radius_size(patches[app.current_patch]["radius_size"])
        timer = app.current_timer

        # send radius size to secondary cpu
        send_udp_message(udp_to_client, "radius_size",  patches[app.current_patch]["radius_size"])

        # Schedule end of timer
        self.timer = Clock.schedule_once(self.timer_ends, timer + patches[app.current_patch]['time_to_beep'])

        # start sampling the touch events
        self.mp_widg.activate()
        self.add_widget(self.mp_widg)
        self.sampling_event = Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)

    def main_cpu_listen_to_second(self):
        try:
            # defining the udp port that listen to data from other computer
            self.sync_data_listen = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            self.sync_data_listen.bind((sync_data_ip, data_to_sync_port))
            self.sync_data_listen.settimeout(TIME_SERIES_DT)
        except:
            self.sync_data_listen = None

    def broadcast(self, dt):
        self.broadcasts_counter += 1

        # send the data from SoundsWidget to MAX
        if self.mp_widg.active:
            data = self.mp_widg.get_data()
            self.broadcaster.broadcast(data)

            # sync data
            if self.sync_data_listen:
                if self.broadcasts_counter % sync_msg_ratio == 0:
                    self.broadcasts_counter = 0
                    pos_data = self.mp_widg.get_data(positional=True)
                    pos_data_only = [pos_data[0:2], pos_data[3:5]]
                    try:
                        data, _ = self.sync_data_listen.recvfrom(1024)
                        pos_data_from_other = pickle.loads(data)
                        sync = sync_measures(pos_data_only, pos_data_from_other,
                                             dt=sync_msg_ratio*TIME_SERIES_DT, method=SYNC_MEASURE)
                        send_udp_message(max_sync_measure_client, SYNC, sync)
                    except socket.timeout:
                        pass


    def on_key_down(self, instance, keycode, text, modifiers, *kargs):
        # listen to keyboard; "Space" for finish and "Delete" for repeat the task

        if keycode == 32:  # 32 is the "Space" key
            self.handle_space_press()

        if keycode == 127:  # 127 is the "Delete" key
            # check if this session is demonstration, and disable this option if yes
            end_screen = self.manager.get_screen("end")
            if not end_screen.is_demonstration:
                self.handle_delete_press()

        if keycode == 118:
            send_udp_message(max_sync_measure_client, VIDEO, VIDEO)


    def handle_space_press(self):
        # when "Space" key is pressed: intentionally call the ending method sooner
        self.timer.cancel()
        self.timer_ends(0)

    def handle_delete_press(self):
        # when "Delete" key is pressed: cancel the task, send a special message to MAX and repeat
        self.timer.cancel()

        # send a message to stop recording on Max
        app = App.get_running_app()
        patch = app.current_patch
        send_udp_message(on_off_client, patch, "BAD")

        # stop sampling the touch events
        self.sampling_event.cancel()
        self.mp_widg.reset()

        # repeat this block
        self.repeat_block()

    def timer_ends(self, dt):
        # send a message to stop recording on Max
        app = App.get_running_app()
        patch = app.current_patch

        # send to UDP to stop patch
        send_udp_message(on_off_client, patch, OFF)

        # stop sampling the touch events
        self.sampling_event.cancel()
        self.mp_widg.reset()

        # move to next screen in the protocol
        self.next_screen()

    def next_screen(self):
        # called when a task is finished
        app = App.get_running_app()

        # Check if there are more blocks to run
        if app.protocol_blocks:
            inst_screen = self.manager.get_screen("instruction")
            inst_screen.is_repeated = False
            self.manager.current = "instruction"
        else:
            self.manager.current = "end"

    def repeat_block(self):
        inst_screen = self.manager.get_screen("instruction")
        inst_screen.is_repeated = True
        self.manager.current = "instruction"

    def on_leave(self, *args):
        Window.unbind(on_key_down=self.on_key_down)
        self.clear_widgets()

class EndScreen(Screen):
    # this screen appears when the protocol is ended (when App.protocol_blocks = [])

    # variables to tracks if user skipped to here and needs to go back to protocol flow
    patch_state, timer_state, protocol_blocks_state = None, None, []
    is_demonstration = False

    def on_enter(self):
        self.remember_current_state()   # save the state before this screen, in case user pressed "backspace"
        Window.bind(on_key_down=self.on_key_down)
        self.layout = BoxLayout(orientation="vertical", padding=10, spacing=10)
        self.label = Label(text=f"Experiment protocol is ended.\nYou can play another patch\n\nPress ESC to exit", font_size=30)
        self.layout.add_widget(self.label)
        self.layout.add_widget(ChoosePatchWidget())
        self.add_widget(self.layout)

    def remember_current_state(self):
        app = App.get_running_app()

        # if there are more blocks to run, then this screen is for demonstration
        if app.protocol_blocks:
            self.is_demonstration = True

            # save the state of the experiment before this screen entered
            self.patch_state, self.timer_state = app.current_patch, app.current_timer
            self.protocol_blocks_state = app.protocol_blocks
            app.protocol_blocks = []

            # in case this screen is for demonstration, make sure that demonstration will not be recorded
            inst_screen = self.manager.get_screen("instruction")
            inst_screen.is_recording = False

    def recover_state_before(self):
        app = App.get_running_app()

        # recover the experiment state before the demonstration
        app.current_patch, app.current_timer = self.patch_state, self.timer_state
        app.protocol_blocks = [(self.patch_state, self.timer_state)] + self.protocol_blocks_state
        self.patch_state, self.timer_state, self.protocol_blocks_state = None, None, []

        # make sure that sessions will be recorded
        inst_screen = self.manager.get_screen("instruction")
        inst_screen.is_recording = True

        # reset the demonstration flag
        self.is_demonstration = False

    def on_key_down(self, instance, keycode, text, modifiers, *kargs):
        if self.is_demonstration:
            if keycode == 8:  # 8 is the "Backspace" key
                self.handle_backspace_press()

    def handle_backspace_press(self):
        # when "Backspace" key is pressed:
        # if there are more blocks to run, then go back to protocol - otherwise do nothing
        self.recover_state_before()
        self.manager.current = "instruction"

    def on_leave(self, *args):
        Window.unbind(on_key_down=self.on_key_down)
        self.clear_widgets()

class MyApp(App):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.protocol_blocks = []       # container for the different blocks in the protocol (ordered!)
        self.names = ""                 # variable for the name of the subjects
        self.current_patch = None       # dynamic variable for the current block
        self.current_timer = None       # dynamic variable for the timer of the current block

    def on_start(self, *args):
        # create a full window for the app and bring it to front

        if FULL_WINDOW:
            Window.fullscreen = True
            Window.borderless = True
            Window.maximize()
            Window.exit_on_escape = True

            # prevent the windows from be minimized
            hwnd = Window.get_window_info().window
            ctypes.windll.user32.ShowWindow(hwnd, 9)  # Restore if minimized
            ctypes.windll.user32.SetForegroundWindow(hwnd)  # Bring to front

    def on_stop(self, *args):
        # when application stops, send "OFF" message to all patches

        for patch in patches:
            send_udp_message(on_off_client, patch, OFF)

    def build(self):
        # create the different abstract screens of the application

        self.sm = ScreenManager()
        self.sm.add_widget(ChooseProtocolScreen(name="choose_protocol"))
        self.sm.add_widget(RegisterNamesScreen(name="register_names"))
        self.sm.add_widget(InstructionScreen(name="instruction"))
        self.sm.add_widget(SoundsPodScreen(name="sounds_widget"))
        self.sm.add_widget(EndScreen(name="end"))
        return self.sm

if __name__ == "__main__":
    MyApp().run()

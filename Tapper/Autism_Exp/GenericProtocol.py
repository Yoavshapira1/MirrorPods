from Tapper.App_Utilities.BroadCasters import MaxMspBroadcaster
from Tapper.App_Utilities.ChooseProtocolWidget import ProtocolWidget
from Tapper.Mirror_Pods_Widgets.SoundsPods import SoundsPods
from Tapper.App_Utilities.ChooseProtocolWidget import patches
import socket
from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.core.window import Window
from os import environ
environ['SDL_VIDEODRIVER'] = 'windows'
from kivy.clock import Clock
from kivy.config import Config
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()

# Make sure to update possible patches in "ChooseProtocolWidget"

FULL_WINDOW = False
TIME_SERIES_DT = 0.001   # sampling sound rate
MODE = "wv_touch"        # change to "mouse" if want to debug


# UDP Helper Function
# 4 types of messages to the UDP ports:
# 1) 'FILENAME, ' - followed by the name of the file for the block
# 2) 'ON'
# 3) 'OFF'
# 4) 'BAD'

def send_udp_message(port, message):
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as udp_socket:
        udp_socket.sendto(message.encode(), ("127.0.0.1", port))

# Screens
class ChooseProtocolScreen(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.widget = ProtocolWidget()
        self.add_widget(self.widget)


class RegisterNamesScreen(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.layout = BoxLayout(orientation="vertical", padding=10, spacing=10)
        self.label = Label(text="Enter your name:")
        self.text_input = TextInput(multiline=False)
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
            self.manager.current = "instruction"
        else:
            self.label.text = "Please enter your name to proceed."

class InstructionScreen(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.current_patch = None
        self.timer = None
        self.layout = None
        self.patch_info = None

    def on_enter(self):
        Window.bind(on_key_down=self.on_key_down)  # Bind keyboard events

        app = App.get_running_app()
        self.current_patch, self.timer = app.protocol_blocks.pop(0)
        app.current_patch = self.current_patch
        app.current_timer = int(self.timer)

        # Update count and show instructions
        self.patch_info = patches[self.current_patch]
        self.patch_info["count"] += 1

        self.layout = BoxLayout(orientation="vertical", padding=10, spacing=10)
        self.label = Label(text=f"Instruction: {self.patch_info['instructions']}")
        self.layout.add_widget(self.label)
        self.add_widget(self.layout)

    def on_key_down(self, instance, keycode, text, modifiers, *kargs):
        if keycode == 13:  # 13 is the "Enter" key
            self.handle_enter_press()

    def handle_enter_press(self):
        app = App.get_running_app()

        # Send UDP messages
        udp_message = f"FILENAME, {app.names}_{self.patch_info['name']}_{self.patch_info['count']}"
        send_udp_message(self.patch_info["port"], udp_message)
        send_udp_message(self.patch_info["port"], "ON")

        # Transition to MyWidget screen
        self.manager.current = "sounds_widget"

    def on_leave(self, *args):
        Window.unbind(on_key_down=self.on_key_down)
        self.clear_widgets()

class SoundsPodScreen(Screen):
    def __init__(self, mode=MODE, n_channels=2, positional=False, **kwargs):
        super().__init__(**kwargs)
        self.positional = positional
        self.mode = mode
        self.broadcaster = MaxMspBroadcaster(channels=n_channels, positional=self.positional)
        self.mp_widg = SoundsPods(n_channels=n_channels, mode=self.mode)
        self.timer, self.sampling_event = None, None

    def on_enter(self):
        Window.bind(on_key_down=self.on_key_down)  # Bind keyboard events

        app = App.get_running_app()
        timer = app.current_timer

        # Schedule end of timer
        self.timer = Clock.schedule_once(self.timer_ends, timer)

        # start sampling the touch events
        self.mp_widg.activate()
        self.add_widget(self.mp_widg)
        self.sampling_event = Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)

    def broadcast(self, dt):
        if self.mp_widg.active:
            data = self.mp_widg.get_data()
            self.broadcaster.broadcast(data)

    def on_key_down(self, instance, keycode, text, modifiers, *kargs):
        if keycode == 32:  # 32 is the "Space" key
            self.handle_space_press()

        if keycode == 127:  # 127 is the "Delete" key
            self.handle_delete_press()

    def handle_space_press(self):
        self.timer.cancel()
        self.timer_ends(0)

    def handle_delete_press(self):
        self.timer.cancel()

        # send a message to stop recording on Max
        app = App.get_running_app()
        patch = app.current_patch
        send_udp_message(patches[patch]["port"], "BAD")

        # stop sampling the touch events
        self.sampling_event.cancel()
        self.mp_widg.reset()

        # move to next screen in the protocol
        self.next_screen()

    def timer_ends(self, dt):
        # send a message to stop recording on Max
        app = App.get_running_app()
        patch = app.current_patch
        send_udp_message(patches[patch]["port"], "OFF")

        # stop sampling the touch events
        self.sampling_event.cancel()
        self.mp_widg.reset()

        # move to next screen in the protocol
        self.next_screen()

    def next_screen(self):
        app = App.get_running_app()

        # Check if there are more blocks to run
        if app.protocol_blocks:
            self.manager.current = "instruction"
        else:
            self.manager.current = "end"

    def on_leave(self, *args):
        Window.unbind(on_key_down=self.on_key_down)
        self.clear_widgets()

class EndScreen(Screen):
    def on_enter(self):
        self.layout = BoxLayout(orientation="vertical", padding=10, spacing=10)
        self.label = Label(text=f"Experiment is ended. Press ESC to exit")
        self.layout.add_widget(self.label)
        self.add_widget(self.layout)

class MyApp(App):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.protocol_blocks = []
        self.names = ""
        self.current_patch = None
        self.current_timer = None

        if FULL_WINDOW:
            Window.fullscreen = True
            Window.borderless = True
            Window.maximize()
            Window.exit_on_escape = True

    def build(self):
        self.sm = ScreenManager()
        self.sm.add_widget(ChooseProtocolScreen(name="choose_protocol"))
        self.sm.add_widget(RegisterNamesScreen(name="register_names"))
        self.sm.add_widget(InstructionScreen(name="instruction"))
        self.sm.add_widget(SoundsPodScreen(name="sounds_widget"))
        self.sm.add_widget(EndScreen(name="end"))
        return self.sm

if __name__ == "__main__":
    MyApp().run()

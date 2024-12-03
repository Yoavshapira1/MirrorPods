import socket
import sys
from os import environ
environ['SDL_VIDEODRIVER'] = 'windows'
from kivy.app import App
from kivy.clock import Clock
from MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from BroadCasters import MaxMspBroadcaster
from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetDyadic import MirrorPodsWidgetDyadic as MP
from utils import DISPLAY3_IP, TIME_SERIES_DT, FULL_SCREEN_MODE
from kivy.config import Config
from struct import pack
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()

class Touch_Debugger(MpApp):
    """
    Class for debugging the MirrorPods object
    Perform animation by running "RealtimeAnimationClientApp" from Display-3
    Perform sounds debugging by running "TouchTest" Max patch, which makes different sound for each channel
    Making use of a TCP socket to the client, and also a UDP socket to MaxMSP
    """

    def __init__(self, mode="wm_touch", n_channels=2, print=True, **kwargs):
        super().__init__(**kwargs)
        self.mode = mode
        self.animation_sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        self.max_sock = MaxMspBroadcaster()
        self.mp_widg = MP(n_channels=n_channels, mode=self.mode)
        self.mp_widg.activate()
        self.print_data = print

    def broadcast(self, dt):
        raw_data = self.mp_widg.get_data(include_touch_id=True)
        animation_data = pack("!ffffffff", *raw_data)
        sounds_data = self.mp_widg.get_data(positional=False)
        self.animation_sock.sendto(animation_data, (DISPLAY3_IP, 2222))
        self.max_sock.broadcast(sounds_data)
        if self.print_data:
            print(raw_data)

    def stop(self):
        self.max_sock.destroy()

    def build(self):
        Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)
        return self.mp_widg


if __name__ == "__main__":
    mode = "wm_touch"
    if len(sys.argv) > 1:
        mode = sys.argv[1]

    # Run the app
    try:
        Touch_Debugger(mode=mode, full_window=FULL_SCREEN_MODE).run()
    finally:
        App.get_running_app().stop()
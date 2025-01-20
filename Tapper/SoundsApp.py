import pickle
import sys
from os import environ
from MPautism.udp_utilitites import *
from App_Utilities.utils import ALMOTUNUI_HOSTNAME, DISPLAY3_HOSTNAME, ALMOTUNUI_IP, DISPLAY3_IP
from pythonosc.udp_client import SimpleUDPClient
from Mirror_Pods_Widgets.SoundsPods import SoundsPods
environ['SDL_VIDEODRIVER'] = 'windows'
from kivy.clock import Clock
from MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from Tapper.App_Utilities.BroadCasters import MaxMspBroadcaster
from kivy.config import Config
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()
import socket

# check if the current machine is a client or the main cpu and define the socket appropriately
if socket.gethostname() == DISPLAY3_HOSTNAME:
    data_to_max_port = data_to_max_port_client_display3
    host = ALMOTUNUI_IP
else:
    data_to_max_port = data_to_max_port_client_almotunui
    host = "127.0.0.1"


# Full window switch
FULL_WINDOW = False
# Time-Scale of UDP messages
TIME_SERIES_DT = 0.001


class SoundsApp(MpApp):
    """
    The application for soundscapes
    Using a UDP broadcaster, to send the data to MaxMSP
    :param mode: Touch mode, by default mode="wm_touch". For debugging with the mouse, run with argument "mouse"
    :param n_channels: Amount of allowed hands, currently only 2 is supported.
    :param positional: False, this indicates the data is uses from the MirrorPodWidget
    """
    def __init__(self, mode="wm_touch", n_channels=2, positional=False, **kwargs):
        super().__init__(**kwargs)
        self.positional = positional
        self.mode = mode
        self.max_data_udp_client = MaxMspBroadcaster(channels=n_channels, positional=self.positional,
                                                     host=host, port=data_to_max_port)
        self.sync_data_udp_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.mp_widg = SoundsPods(n_channels=n_channels, mode=self.mode)
        self.mp_widg.reset()
        self.mp_widg.activate()

    def broadcast(self, dt):
        """
        Send the data through the broadcaster, which is a UDP socket to MaxMSP in this case
        """
        if self.mp_widg.active:
            non_pos_data = self.mp_widg.get_data()
            self.max_data_udp_client.broadcast(non_pos_data)

            pos_data = self.mp_widg.get_data(positional=True)
            pos_data_msg = [pos_data[0:2], pos_data[3:5]]
            message = pickle.dumps(pos_data_msg)
            self.sync_data_udp_client.sendto(message, (host, data_to_sync_port))

    def stop(self, *largs):
        """
        The stop method is automatically called when the app is about to exit
        This will destroy the broadcaster, and send a "silence data" to MaxMSP in order to stop the soundscapes
        """
        self.max_data_udp_client.destroy()

    def build(self):
        Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)
        return self.mp_widg


if __name__ == "__main__":
    mode = "wm_touch"
    if len(sys.argv) > 1:
        mode = sys.argv[1]

    # Run the app
    SoundsApp(mode="mouse", full_window=FULL_WINDOW).run()

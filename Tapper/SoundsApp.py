import pickle
import sys
from os import environ
from pythonosc.udp_client import SimpleUDPClient
from Tapper.MPautism.sync_utilities import sync_measures
from MPautism.udp_utilitites import *
from App_Utilities.GUI import PopupForSoundsApp
from App_Utilities.utils import MAIN_CPU, SECONDARY_CPU, MAIN_CPU_IP, SECONDARY_CPU_IP
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
if socket.gethostname() == SECONDARY_CPU:
    data_to_max_port = data_to_max_port_client_display3
    host = MAIN_CPU_IP
    sync_data_ip = SECONDARY_CPU_IP
else:
    data_to_max_port = data_to_max_port_client_almotunui
    sync_data_ip = MAIN_CPU_IP
    host = "127.0.0.1"


# Full window switch
FULL_WINDOW = True
# Time-Scale of UDP messages
TIME_SERIES_DT = 0.001

# for sending sync measure to max
max_sync_measure_client = SimpleUDPClient(host, max_sync_measure_port)
SYNC_MEASURE = 'distance'   # sync method, options: distance, velocity
# sync measures messages rate, in ratio to normal positional message. performs time smooth to the sync signal
sync_msg_ratio = 10 if SYNC_MEASURE == "velocity" else 1
SYNC = 'sync'               # initial in usp msg to Max



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
        self.n_channels = n_channels
        self.max_data_udp_client = MaxMspBroadcaster(channels=self.n_channels, positional=self.positional,
                                                     host=host, port=data_to_max_port)
        self.sync_data_udp_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.mp_widg = SoundsPods(n_channels=n_channels, mode=self.mode)
        self.mp_widg.reset()
        self.mp_widg.activate()
        self.main_computer = socket.gethostname() == MAIN_CPU
        if self.main_computer:
            self.define_listener_to_other_cpu()
            self.broadcasts_counter = 0

    def define_listener_to_other_cpu(self):
        # defining the udp port that listen to data from other computer
        self.sync_data_listen = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sync_data_listen.bind((sync_data_ip, data_to_sync_port))
        self.sync_data_listen.settimeout(TIME_SERIES_DT)

    def broadcast(self, dt):
        """
        Send the data through the broadcaster, which is a UDP socket to MaxMSP in this case
        """
        if self.mp_widg.active:
            non_pos_data = self.mp_widg.get_data()
            self.max_data_udp_client.broadcast(non_pos_data)

            # get data for sync measures if this ia main computer
            if self.main_computer:
                self.broadcasts_counter += 1
                if self.broadcasts_counter % sync_msg_ratio == 0:
                    self.broadcasts_counter = 0
                    pos_data = self.mp_widg.get_data(positional=True)
                    pos_data_only = [pos_data[0:2], pos_data[3:5]]
                    try:
                        data, _ = self.sync_data_listen.recvfrom(1024)
                        pos_data_from_other = pickle.loads(data)
                        sync = sync_measures(pos_data_only, pos_data_from_other,
                                             dt=sync_msg_ratio * TIME_SERIES_DT, method=SYNC_MEASURE)
                        max_sync_measure_client.send_message(SYNC, sync)
                    except socket.timeout:
                        pass

            # send data for sync measures if this is secondary computer
            else:
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
    SoundsApp(mode=mode, full_window=FULL_WINDOW).run()

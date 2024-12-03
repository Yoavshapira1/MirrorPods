import sys
from os import environ
from Mirror_Pods_Widgets.SoundsPods import SoundsPods
environ['SDL_VIDEODRIVER'] = 'windows'
from kivy.app import App
from kivy.clock import Clock
from MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from BroadCasters import MaxMspBroadcaster
from kivy.config import Config
Config.set('postproc', 'maxfps', '0')
Config.set('graphics', 'maxfps', '0')
Config.set('postproc', 'retain_time', '20')
Config.write()


# Full window switch
FULL_WINDOW = True
# Time-Scale of UDP messages
TIME_SERIES_DT = 0.001


class SoundsApp(MpApp):
    """
    The application for soundscapes
    Using a UDP broadcaster, to send the data to MaxMSP
    :param mode: Touch mode, by default mode="wm_touch". For debugging with the mouse, run with argument "mouse"
    :param n_channels: Amount of allowed hands, currently only 2 is supported.
    :param positional: False, this is indicates the data is uses from the MirrorPodWidget
    """
    def __init__(self, mode="wm_touch", n_channels=2, positional=False, **kwargs):
        super().__init__(**kwargs)
        self.positional = positional
        self.mode = mode
        self.broadcaster = MaxMspBroadcaster(channels=n_channels, positional=self.positional)
        self.mp_widg = SoundsPods(n_channels=n_channels, mode=self.mode)
        self.mp_widg.reset()
        self.mp_widg.activate()

    def broadcast(self, dt):
        """
        Send the data through the broadcaster, which is a UDP socket to MaxMSP in this case
        """
        if self.mp_widg.active:
            data = self.mp_widg.get_data()
            self.broadcaster.broadcast(data)

    def stop(self, *largs):
        """
        The stop method is automatically called when the app is about to exit
        This will destroy the broadcaster, and send a "silence data" to MaxMSP in order to stop the soundscapes
        """
        self.broadcaster.destroy()

    def build(self):
        Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)
        return self.mp_widg


if __name__ == "__main__":
    mode = "wm_touch"
    if len(sys.argv) > 1:
        mode = sys.argv[1]

    # Run the app
    SoundsApp(mode=mode, full_window=FULL_WINDOW).run()

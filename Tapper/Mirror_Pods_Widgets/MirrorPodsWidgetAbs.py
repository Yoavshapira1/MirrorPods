from kivy.uix.widget import Widget
from Tapper.App_Utilities.utils import MOUSE_DEV_MODE
from Tapper.App_Utilities.TouchChannel import TouchChannel

class MirrorPodsWidget(Widget):
    """
    Abstract class for the different widgets
    Currently, only 2-channels are allowed!
    :param n_channels:  Amount of channels. A Channel holds for a touch in the screen.
    :param mode:        Either "wm_touch" for regular run, or "mouse" for debugging with the mouse.
                        If None - the mode is set to "wm_touch"
    :param positional:  Boolean, specify if the widget is creating positional data (for experiment's data records)
                        of qualitative data (for SoundsApp)
    """

    def __init__(self, n_channels=2, mode=None, positional=True, **kwargs):
        super().__init__(**kwargs)
        if n_channels != 2:
            raise AttributeError("Currently, MirrorPodsWidget only support exactly 2 channels")
        self.active = False             # Specify if the widget is active at this moment, meanly is mounted on the screen.
        self.positional = positional
        self.touch_mode = mode
        if self.touch_mode is None:
            self.touch_mode = "mouse" if MOUSE_DEV_MODE else "wm_touch"
        self.touch_indexing = 0         # Counter of the different touch events occurred in the widget.
        self.channels = [TouchChannel() for ch in range(n_channels)]
        self.set_neighbors_channels()

    def set_neighbors_channels(self):
        """
        For the functionality of the widgets, each channel should be aware of it's closest channel.
        Since the only amount of channels allowed at the moment are 2, this method is very simple.
        In order to extend this, a scheduled method that calculates the closest channels in every moment
        is should be defined, and run continuously during the widget is active.
        *** In order to extend the functionality to more than 2 channels, you will need to costume an inherits
            MirrorPodsWidget and override this method! ***
        """
        self.channels[0].set_closest_channel(self.channels[1])
        self.channels[1].set_closest_channel(self.channels[0])

    def deactivate(self):
        """
        Deactivation of a widget should deactivate it's all subcomponents, i.e it's channels
        """
        self.active = False
        for ch in self.channels:
            ch.deactivate()

    def activate(self):
        """
        Activation of a widget, unlike deactivation, should not active it's channels - Since channel is to be active
        only when an active touch event is occurs.
        """
        self.active = True

    def reset(self):
        """
        Reset the widget. This is in use, for example, in the SoloTasks, where a task should be run several times.
        """
        self.deactivate()
        self.touch_indexing = 0

    def get_data(self, include_touch_index=True, include_touch_id=False, positional=None) -> list:
        """
        Collect the data from the channels, and return it as a list
        :param include_touch_index: If True, the information about the touch index is included
        :param include_touch_id:    If True, the information about the touch ID is included
        :param positional:          If True, the collected data is positional. This parameter allows non-positional
                                    widget to create positional data, and vice-versa.
        :return:                    The requested data as a list
        """
        data = []
        if positional is not None:
            if positional:
                for ch in self.channels:
                    data += ch.get_pos_as_list(include_touch_index, include_touch_id)
            else:
                for ch in self.channels:
                    data.append(["channel%d" % ch.get_channel_id(), ch.get_qualitative_data()])
        else:
            if self.positional:
                for ch in self.channels:
                    data += ch.get_pos_as_list(include_touch_index, include_touch_id)
            else:
                for ch in self.channels:
                    data.append(["channel%d" % ch.get_channel_id(), ch.get_qualitative_data()])

        return data
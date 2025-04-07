from Tapper.App_Utilities.TouchChannel import TouchChannel
from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetAbs import MirrorPodsWidget


class SoundsPods(MirrorPodsWidget):
    """
    Widget built for the SoundsApp application.It activates the 2 channels, with relatively wide groupy threshold,
    in order to create the functionality of "area" of touch, which is crucial for a natural-touch feeling
    when creating soundscapes.
    It also creates a "Waiting Channel" - a TouchChannel designated to capture a touch that currently active but
    no free channel to populate it. This functionality supports more natural-touch effect, and continuity.
    *** This is a very simple example for how an extension to more than 2 channels should be done.
        It's simple because it doesn't take any positional information about the 3rd channel in consideration,
        so the implementation is very simple, i.e. no distances calculation is made here ***
    """

    def __init__(self, n_channels, radius_size=0, **kwargs):
        self.radius_size = radius_size
        super().__init__(n_channels=n_channels, positional=False, **kwargs)

    def set_radius_size(self, size):
        self.radius_size = size

    def set_neighbors_channels(self):
        """
        Simply extends the functionality to 3 channels:
        1. Create a default (initialized) mapping of distances
        2. Override the "set_neighbors_channels" method and create distance calculation scheduled event
        In this case, the distances from the waiting_ch are irrelevant for the behavior of this widget, hence
        no such event is made
        """

        self.waiting_ch = TouchChannel()
        # default mapping
        self.channels[0].set_closest_channel(self.channels[1])
        self.channels[1].set_closest_channel(self.channels[0])
        self.waiting_ch.set_closest_channel(self.channels[1])   # just a random channel

    def on_touch_down(self, touch):
        # If not touch mode type, do nothing
        if touch.device == self.touch_mode:
            for ch in [*self.channels, self.waiting_ch]:
                # If there is no active touch - create one
                if not ch.is_active():
                    self.touch_indexing += 1
                    ch.activate(touch, self.touch_indexing)
                    return
                # If there is an active touch, and the current touch is very close to it - Add to group
                if ch.distance_from_pos(touch.spos) < self.radius_size:
                    ch.add_to_group(touch)
                    return

    def on_touch_move(self, touch):
        if touch.device == self.touch_mode:
            for ch in [*self.channels, self.waiting_ch]:
                if ch.get_main_touch() == touch:
                    ch.move()
                    return

    def on_touch_up(self, touch):
        if touch.device != self.touch_mode:
            return
        for ch in self.channels:
            # Case: The touch up refers to an active channel
            if touch == ch.get_main_touch():
                # Case: The channel have an active group => change the channel to one of the groupies
                if len(ch.get_group()) > 0:
                    new_touch = ch.get_group()[0]
                    ch.change_main_touch(new_touch)
                    ch.remove_from_group(new_touch)
                    break
                # Case: Waiting channel is active => Replace channels
                if self.waiting_ch.is_active():
                    self.touch_indexing += 1
                    ch.activate(self.waiting_ch.get_main_touch(), self.touch_indexing)
                    self.waiting_ch.deactivate()
                # else => deactivate
                else:
                    ch.deactivate()
                break
            # Case: the touch up related to one of the channel's groupies (in this case
            # the channels must be activated) => remove it from the group
            if touch in ch.get_group():
                ch.remove_from_group(touch)
                break
        if self.waiting_ch.get_main_touch() == touch:
            self.waiting_ch.deactivate()

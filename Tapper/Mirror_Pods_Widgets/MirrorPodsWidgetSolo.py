from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetAbs import MirrorPodsWidget
import numpy as np


class MirrorPodsWidgetSolo(MirrorPodsWidget):
    """
    Widget built for the solos tasks. It activates only 1 channel, and uses the channel's group in order to avoid
    noise in the empty, inactive channel.
    """

    # The group of a channels is necessary in this widget, since the solo tasks are require only 1 channel involve,
    # and hence there is an empty channel which is exposed to noise
    GROUPY_THRESHOLD = 0.1

    def __init__(self, **kwargs):
        super().__init__(positional=True, **kwargs)

    def on_touch_down(self, touch):
        # If not touch mode type, do nothing
        if touch.device != self.touch_mode:
            return
        for ch in self.channels:
            # If there is no active touch - create one
            if not ch.is_active():
                self.touch_indexing += 1
                ch.activate(touch, self.touch_indexing)
                return
            # If there is an active touch, and the current touch occurred very close to it - Add to groupies
            elif ch.distance_from_pos(touch.spos) < self.GROUPY_THRESHOLD:
                ch.add_to_group(touch)
                return

    def on_touch_move(self, touch):
        if touch.device != self.touch_mode:
            return
        # Case of very first touch, which is triggering the session
        if self.touch_indexing == 0:
            self.touch_indexing += 1
            self.channels[0].activate(touch, self.touch_indexing)

        else:
            for ch in self.channels:
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
                else:
                    ch.deactivate()
                return
            # Case: the touch up related to one of the channel's groupies (in this case
            # the channels must be activated) => remove it from the group
            if touch in ch.get_group():
                ch.remove_from_group(touch)
                return

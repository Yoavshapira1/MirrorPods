from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetAbs import MirrorPodsWidget


class MirrorPodsWidgetDyadic(MirrorPodsWidget):
    """
    Widget built for the dyadic task. It activates 2 channels, and follows the Decision Trees that appears
    in the package.
    """

    # This value is the threshold (T) that is mentioned in the Decision Tree of the Touch-Up event.
    IDENTIFY_RADIUS_ENTER = 0.035

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def on_touch_down(self, touch):
        """
        For simplicity, this widget ignores the event of creating a touch, and handles only the move and up events.
        """
        return

    def on_touch_move(self, touch):
        """
        To understand the flow, follow the decision tree located in the path:
        Tapper/Mirror_Pods_Widgets/DecisionTree-TouchMove.png
        """
        if touch.device != self.touch_mode:
            return

        if self.channels[0].get_main_touch_id() == touch.id:
            # Y
            return self.channels[0].move()

        if self.channels[1].get_main_touch_id() == touch.id:
            # N -> Y
            return self.channels[1].move()

        if self.channels[0].is_active():
            # N -> N -> Y
            if self.channels[1].is_active():
                # N -> N -> Y -> Y
                return
            else:
                # N -> N -> Y -> N
                self.touch_indexing += 1
                return self.channels[1].activate(touch, self.touch_indexing)

        # N -> N -> N
        if self.channels[1].is_active():
            # N -> N -> N -> Y
            self.touch_indexing += 1
            return self.channels[0].activate(touch, self.touch_indexing)

        # N -> N -> N -> N
        # channels2 was closer to this touch
        if self.channels[0].distance_from_pos([touch.sx, touch.sy]) > \
                self.channels[1].distance_from_pos([touch.sx, touch.sy]):
            self.touch_indexing += 1
            return self.channels[1].activate(touch, self.touch_indexing)

        # channels1 was closer to this touch
        self.touch_indexing += 1
        self.channels[0].activate(touch, self.touch_indexing)

    def on_touch_up(self, touch):
        """
         To understand the flow, follow the decision tree located in the path:
         Tapper/Mirror_Pods_Widgets/DecisionTree-TouchUp.png
         """
        if touch.device != self.touch_mode:
            return

        # distance between two channels
        ds = self.channels[0] - self.channels[1]

        if self.channels[0].get_main_touch_id() == touch.id:
            # Y
            if ds < self.IDENTIFY_RADIUS_ENTER:
                # Y -> Y
                return self.channels[0].set_copy()
            else:
                # Y -> N:
                return self.channels[0].deactivate()

        else:
            # N
            if self.channels[1].get_main_touch_id() == touch.id:
                # N -> Y
                if ds < self.IDENTIFY_RADIUS_ENTER:
                    # N -> Y -> Y
                    return self.channels[1].set_copy()
                else:
                    # N -> Y -> N
                    return self.channels[1].deactivate()
            else:
                # N -> N
                return
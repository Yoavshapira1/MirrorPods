from time import time
from kivy.clock import Clock
from Tapper.App_Utilities.utils import *
import numpy as np


#####################################################################################################
#####################################################################################################
###################################### Grid options #################################################

# The shape of the grid
GRID_dict = {
    "Circular": 1,
    "Rectangle": 2
}

# The origin of the grid
ORIGIN_dict = {
    "Bottom_left": [0.0, 0.0],
    "Center": [0.5, 0.5],
    "Center_bottom": [0.5, 0],
}

# The actual parameters fed into the machine
ORIGIN = "Bottom_left"
GRID = "Rectangle"

#################################### END Grid options ###############################################
#####################################################################################################
#####################################################################################################


class TouchChannel:
    """
    Class for the main object we deal with. In fact, this is a wrapper for the kivy's touch object, in order to get a
    sense of a human-hand touch and extract more parameters from the movement.
    As there might be many inputs, a TouchChannel considers only one input as the main touch.
    A channel starts as not-active. When a touch event occurs, the Widget that is responsible to handle the touch events
    connect it to the first available channel and then activate the channel.

    Attributes
    -------------------------------------------------
        channel_id <integer>: Unique value of this instance of TouchChannel.
        closest_channel <TouchChannel>: The closest TouchChannel instance, in Euclidian distance. Initialized to None,
                                        and it is the Widget responsibility to change it.
        active <Boolean>: If yes, then this touch is still actually moving on the screen.
        copy <Boolean>: If this True, then the TouchChannel identifies with closest_channel. In this case, all the
                        functions will return exactly what closest_channel's function would return.
                        Notice that copy=True => active=False, but not vice versa.
                        Initialized to False.
        main_touch <kivy's touch object>: Holds the touch object related to this TouchChannel.
        touch_indexing <Integer>: The id of this touch event, relatively to the Widget. It possible that 2 consecutive
                                  touch events populate this TouchChannel, will have non-consecutive touch_indexing - It
                                  means that there was another touch event in the Widget between the two.
                                  Initialized to 0.
        start_pos <tuple>: Coordinates of the start position of main_touch. Initialized to [-1., -1.].
        last_pos <tuple>: Coordinates of the touch that previously populated this TouchChannel. Initialized to
                          [-1., -1.], and to be updated in each deactivation.
        prev_pos_time <float64>: Time of the touch that previously populated this TouchChannel. Initialized to NOW, and
                                 to be updated in each deactivation.
    """
    max_area = 0.43
    min_area = 0.03
    sustain_dt = -10  # The higher this value, the faster Sustain reach to maximum
    CH_ID = 0         # Static value, counts the instances of TouchChannels

    def __init__(self):
        # identity attributes
        TouchChannel.CH_ID += 1
        self.origin = ORIGIN_dict[ORIGIN]
        self.grid = GRID_dict[GRID]
        self.origin_string = ORIGIN
        self.grid_string = GRID

        self.channel_id = TouchChannel.CH_ID
        self.closest_channel = None
        self.copy = False

        # data-generating related
        self.touch_time = 0
        self.touch_indexing = 0
        self.start_pos = [-1., -1.]
        self.last_pos = [-1., -1.]
        self.max_norm = np.linalg.norm(np.array([1, 1]) - self.origin)
        self.reduce_time_threshold = self.max_norm / 300  # ||pos - prev_pos|| > threshold => reduce time_touch
        self.mode = 0

        # initialize the values to zero
        self.main_touch = None
        self.prev_pos_time = time()
        self.velocity = 0.0
        self.active = False
        self.group = []

        # Change the touch_time & velocity attributes consistently
        update_sustain_event = Clock.schedule_interval(self.update_sustain, TIME_SERIES_DT)

    def activate(self, touch, touch_indexing):
        """
        Activate this TouchChannel. To be called from a MirrorPodsWidget instance.
        :param touch: kivy's touch object
        :param touch_indexing: Number-Ordered of this touch as it appears in the Widget created this TouchChannel
        :return: None
        """
        self.main_touch = touch
        self.copy = False
        self.active = True
        self.start_pos = [self.main_touch.osx, self.main_touch.osy]
        self.velocity = 0.0
        self.touch_time = 0.0
        self.touch_indexing = touch_indexing

    def deactivate(self):
        """
        Deactivate this TouchChannel. To be called from a MirrorPodsWidget instance.
        Before deactivating, it checks if it's closets neighbor is copy. If yes - cancel it,
        and only then deactivate this TouchChannel. Notice that this functionality holds only for existence of 2
        channels at most, and not more.
        :return: None
        """

        # It's important to cancel the copy channel before switch the active field to False
        #TODO: change this, closest channel always should not be None
        if self.closest_channel:
            if self.closest_channel.is_copy():
                self.closest_channel.cancel_copy()
        self.active = False
        self.set_last_pos()
        self.main_touch = None
        self.prev_pos_time = time()
        self.velocity = 0.0
        self.touch_time = 0
        self.group = []

    def set_last_pos(self):
        """
        Save the position of the last touch populated this TouchChannel.
        :return: None
        """
        if self.main_touch is not None:
            self.last_pos = [self.main_touch.sx, self.main_touch.sy]

    def set_copy(self):
        """
        Set copy to True. This method should only be called from a MirrorPodsWidget instance, and be carefully
        considered.
        :return: None
        """
        self.copy = True
        self.active = False
        self.set_last_pos()

    def is_copy(self):
        """
        :return: Boolean, whether this touchChannel is in copy mode
        """
        return self.copy

    def cancel_copy(self):
        """
        Set the copy mode to False
        :return: None
        """
        self.copy = False

    def update_sustain(self, dt):
        """
        Every period of dt (in sec.), update the touch_time &  velocity attributes
        :param dt: time in Seconds. crucial for the event to run
        :return: None
        """
        if self.active:
            self.touch_time += dt
            self.velocity = np.linalg.norm([self.main_touch.dsx, self.main_touch.dsy]) * 13

    def change_main_touch(self, touch):
        """
        Change the touch of this TouchChannel
        :param touch: new kivy's touch object
        :return: None
        """
        self.main_touch = touch

    def set_closest_channel(self, channel):
        """
        Set the closets channel. This method should only be called from a MirrorPodsWidget instance, at least one
        time when initialized.
        :param channel: The closest channel, in Euclidian distance.
        :return: None
        """
        self.closest_channel = channel

    def is_active(self):
        """
        :return: Boolean, whether this TouchChannel is currently active
        """
        return self.active

    def get_main_touch(self):
        """
        :return: kivy's touch object, the main touch of this TouchChannel
        """
        return self.main_touch

    def get_main_touch_id(self):
        """
        :return: the ID main touch of this TouchChannel if exists, otherwise -1.
        ID of a main touch is given by kivy framework.
        """
        if self.main_touch is not None:
            return self.main_touch.id
        else:
            return -1

    def get_channel_id(self):
        """
        :return: The unique ID of this TouchChannel instance
        """
        return self.channel_id

    def get_pos_as_list(self, include_touch_index=True, include_touch_id=False):
        """
        Collect the data from the channel.
        :param include_touch_index: If True, the attribute touch_index is included.
        :param include_touch_id:    If True, kivy's ID for the main touch is included.
        :return:                    The requested data as a list
        """
        if self.active:
            pos = self.get_positional_data()
        elif self.copy:
            pos = self.closest_channel.get_positional_data()
        else:
            pos = [-1., -1.]

        if include_touch_index:
            if self.active:
                pos += [self.touch_indexing]
            else:
                pos += [-1.]
        if include_touch_id:

            if self.active:
                pos += [self.get_main_touch_id()]
            else:
                pos += [-1.]

        return pos

    def __sub__(self, other):
        """
        Overloading the ' - ' operator to perform a distance calculation between two TouchChannels
        Note that the distance is calculated in related to the grid that in use, and this is why the
        "get_positional_data" is called rather than directly access the "main_touch"
        :param other: The other TouchChannel to calculate distance from
        :return: The distance between `this` and `other` if both active, else: np.inf
        """
        if self.active and other.is_active():
            left_p, right_p = self.get_positional_data(), other.get_positional_data()
            return np.linalg.norm([left_p[0] - right_p[0],
                                   left_p[1] - right_p[1]])
        return np.inf

    def distance_from_pos(self, pos : list):
        """
        Calculates the Euclidian distance of this TouchChannel from a given position.
        Note that the distance is calculated in related to the grid that in use, and this is why the
        "get_positional_data" is called rather than directly access the "main_touch"
        :param pos: tuple of the form `[x, y]` to calculate distance from
        :return: The distance between `this` and `other` if both active, else: np.inf
        """
        if self.active:
            left_p = self.get_positional_data()
            return np.linalg.norm([left_p[0] - pos[0],
                                   left_p[1] - pos[1]])
        return np.inf

    def get_last_pos(self):
        """
        :return: The position of the last touch populated this TouchChannel
        """
        return self.last_pos

    def get_start_time(self):
        """
        :return: Time that main_touch of this TouchChannel started. Wrapping kivy's method.
        """
        return self.main_touch.time_start

    def get_group(self):
        """
        :return: list of kivy's touch objects: The groupy of this TouchChannel
        """
        return self.group

    def remove_from_group(self, groupy):
        """
        Remove particular touch event from group
        :param groupy: the event to be removed
        :return: None
        """
        self.group.remove(groupy)

    def next_mode(self):
        """
        Increase mode by 1
        :return: None
        """
        self.mode += 1

    def prev_mode(self):
        """
        Decrease mode by 1, or set to 0 if mode==0
        :return: None
        """
        self.mode = max(self.mode - 2, 0)

    def move(self):
        """
        changes qualitative information about the TouchChannel that the movement affected.
        This is to be called EVERY TIME that a movement is detected.
        :return: None
        """

        # reduce the time touch value if position is changed a lot
        ds = np.linalg.norm([self.main_touch.dsx, self.main_touch.dsy])
        if ds > self.reduce_time_threshold:
            self.touch_time *= 0.1

    def add_to_group(self, touch):
        """
        Add a touch event to the group of this one
        :param touch: the touch event to be added
        :return: None
        """
        self.group.append(touch)

    def positional_circular_rep(self) -> list:
        """
        Generate the circular positional attributes
        :return: None
        """

        # 'raw' euclidean distance of the position from the origin
        dist = np.array([self.main_touch.sx, self.main_touch.sy]) - self.origin
        norm = np.linalg.norm(dist)

        # calculate normalized radius. Normalization done by stretching the maximum value to 1.
        radius = np.sqrt(norm / self.max_norm)

        # calculate the angle from the origin
        tan = 0 if dist[0] == 0 else np.abs(np.tanh(dist[1] / dist[0]))
        return [radius, tan]

    def get_positional_data(self):
        """
        Generate the positional attributes
        :return: None
        """
        if self.grid_string == "Circular":
            return self.positional_circular_rep()

        # else => Origin maybe not CENTER
        # If origin is center, the normalization is just *2 for both axis
        elif self.origin_string == "Center":
            return [2 * np.abs(self.main_touch.sx - self.origin[0]), 2 * np.abs(self.main_touch.sy - self.origin[1])]

        # If origin is X center, Y bottom, the normalization is *2 only for X axis
        elif self.origin_string == "Center_bottom":
            return [2 * np.abs(self.main_touch.sx - self.origin[0]), np.abs(self.main_touch.sy - self.origin[1])]

        # else => origin is default (bottom left), no normalization required
        else:
            return [self.main_touch.sx, self.main_touch.sy]

    def get_velocity(self):
        """
        :return: The current velocity of this TouchChannel
        """
        return self.velocity

    def get_touch_time(self):
        """
        Calculate the touch_time normalized to [0,1] according to a sigmoid function
        :return: Sigmoid(self.touch_time) with modifications
        """

        # in the very first moment, a sharp sigmoid - imitates first touch of a surface, where the pressure
        # is much higher due to the transition from static to kinetic
        if self.touch_time < 0.07:
            return 1 / (1 + np.exp((self.sustain_dt * self.touch_time) + 4))

        # after the very first moment, a long sigmoid
        return 1 / (1 + np.exp(-self.touch_time + 4))

    def get_area(self):
        """
        Calculate the density of the touch's group. The density defined as the MAXIMAL distance between
        the main touch and one of the groupies
        :return: max(0.0, min(dist, 1.0)), where dist is the maximal distance from main_touch to one of the groupies
        """
        if len(self.group) > 0:
            most_distant = 0
            for g in self.group:
                area = np.linalg.norm(np.array([self.main_touch.sx, self.main_touch.sy]) - g.spos)
                most_distant = max(area, most_distant)
            area = (most_distant - self.min_area) / (self.max_area - self.min_area)
            return max(0.0, min(area, 1.0))
        else:
            return 0.0

    def get_qualitative_data(self):
        """
        Generate the qualitative data, usually to be broadcast through UDP to MaxMSP.
        :return: list: [start_pos_x, start_pos_y, pos_x, pos_y, velocity, touch_time, mode, area]
        """
        if self.copy:
            return self.closest_channel.get_qualitative_data()

        if not self.active:
            return self.start_pos + [0.0] * 4 + [self.mode] + [0.0] + [self.touch_indexing]

        position = self.get_positional_data()
        velocity = [min(1.0, self.velocity)]
        touch_time = [self.get_touch_time()]
        mode = [self.mode]
        area = [self.get_area()]
        return self.start_pos + position + velocity + touch_time + mode + area + [self.touch_indexing]

    def __repr__(self):
        return "******* CHANNEL {} *******: general information: id: {}, copy: {}, group size: {}" \
               " positional data: {}. qualitiative data: <{}>.".format(
            self.channel_id, self.get_main_touch_id(), self.copy, len(self.get_group()), self.get_pos_as_list(), self.get_qualitative_data()
        )

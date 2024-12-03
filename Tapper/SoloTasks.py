from kivy.clock import Clock, ClockEvent
from time import time
from kivy.uix.widget import Widget
from BroadCasters import WriterBroadcastForSolo
from abc import abstractmethod
from utils import *
from Tapper.Mirror_Pods_Widgets.MirrorPodsWidgetSolo import MirrorPodsWidgetSolo as solo_widg


class Task(Widget):
    """An abstract object which represents a single task,
    i.e. TapperTask, MotionTask etc...
    :param context: Context object
    """

    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.mp_wid = solo_widg(n_channels=HANDS_ALLOWED)
        self.add_widget(self.mp_wid)
        self.context = context
        self.event = None
        self.active = False

    def start(self, file_name, counter):
        path = self.context.get_cur_dir() + "\\" + file_name + "_" + str(counter+1) + r".xlsx"
        self.broadcaster = WriterBroadcastForSolo(self.context, path, self.first_row)
        self.broadcaster.start()
        self.mp_wid.reset()
        self.counter += 1
        self.active = True
        self.mp_wid.activate()

    def stop(self, time="N/A"):
        if self.event:
            ClockEvent.cancel(self.event)
        self.broadcaster.write_suffix(time=time)
        self.broadcaster.destroy()
        self.active = False
        self.mp_wid.deactivate()

    def stash(self):
        if self.event:
            ClockEvent.cancel(self.event)
        self.counter -= 1
        self.broadcaster.stash()
        self.active = False
        self.mp_wid.deactivate()

    @abstractmethod
    def broadcast(self, *args):
        raise NotImplementedError("Must override Task.broadcast")

class TappingTask(Task):
    """Represents the Tapping task"""
    counter = 0
    file_name = TAPPING
    first_row = EXCEL_COLS_PER_TASK[TAPPING]

    def __init__(self, context, **kwargs):
        super().__init__(context, **kwargs)
        self.touch_mode = self.mp_wid.touch_mode
        self.remove_widget(self.mp_wid)

    def start(self, *kwargs):
        super().start(file_name=self.file_name, counter=self.counter)
        self.tapNum = 0
        self.start_t = time()

    def on_touch_down(self, touch):
        # If not touch mode type, do nothing
        if touch.device != self.touch_mode:
            return

        self.tapNum += 1
        if self.active:
            self.broadcast()

    def on_touch_move(self, touch):
        return

    def on_touch_up(self, touch):
        return

    def broadcast(self):
        self.broadcaster.broadcast([self.tapNum, time()])


class MotionTask(Task):
    def __init__(self, context, file_name, counter, first_row, **kwargs):
        super().__init__(context, **kwargs)
        self.file_name = file_name
        self.counter = counter
        self.first_row = first_row

    def start(self, *kwargs):
        super().start(file_name=self.file_name, counter=self.counter)
        self.event = Clock.schedule_interval(self.broadcast, TIME_SERIES_DT)

    def broadcast(self, *args):
        self.broadcaster.broadcast(self.mp_wid.get_data() + [time()])


class FreeMotionTask(MotionTask):
    counter = 0
    file_name = FREE_MOTION
    first_row = EXCEL_COLS_PER_TASK[FREE_MOTION]

    def __init__(self, **kwargs):
        super().__init__(file_name=self.file_name, counter=self.counter, first_row=self.first_row, **kwargs)
        self.dir = self.context.get_cur_dir()


class CirclesMotionTask(MotionTask):
    counter = 0
    file_name = CIRCLES
    first_row = EXCEL_COLS_PER_TASK[CIRCLES]

    def __init__(self, **kwargs):
        super().__init__(file_name=self.file_name, counter=self.counter, first_row=self.first_row, **kwargs)
        self.dir = self.context.get_cur_dir()


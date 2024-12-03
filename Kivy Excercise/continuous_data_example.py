import pandas as pd
from kivy.app import App
from kivy.uix.widget import Widget
from Tapper.MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from kivy.clock import Clock


class SimpleWidget(Widget):

    def __init__(self, df,  **kwargs):
        super().__init__(**kwargs)

        # the given dataFrame to save the data into
        self.df = df

        # the touch variable (in fact, a pointer to) to track the position
        self.touch = None

        # schedule the sampling to be at 100 Hz
        recording_event = Clock.schedule_interval(self.sample, 0.01)

    # don't remember 'dt' argument for scheduled operations!
    def sample(self, dt):

        # the sampling here creates an arbitrary data shape. possibly, another Widget would
        # contribute to the dataFrame also, so both widgets should know what is the data shape.
        # my recommendation, is passing the data shape to the Widget as an argument
        # to keep on consistency and prevent RunTimeErrors

        if self.touch:
            self.df.loc[len(self.df)] = [self.touch.spos[0], self.touch.spos[1], self.touch.uid]
        else:
            self.df.loc[len(self.df)] = [-1, -1, -1]

    # handling the event of detecting a touch movement
    def on_touch_move(self, touch):

        # assign the touch object to the pointer
        self.touch = touch

    # handling the event of detecting a touch disconnection
    def on_touch_up(self, touch):

        # a touch object doesn't disappear, so after disconnection the pointer still
        # will point a touch and no will be a None. so a manually assignment should be done
        self.touch = None


# You can change "App" to "MpApp" to use my implementation of abstract class
# that handle the window sizes
class SimpleApp(App):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        # initiate a dataframe (can be replaced with a file writer)
        self.df = pd.DataFrame(columns=["x_pos", "y_pos", "id"])

    # don't remember 'dt' argument for scheduled operations!
    def callback(self, dt):
        self.df.to_excel('myDataFrame.xlsx')
        App.get_running_app().stop()

    def build(self):

        # schedule the application closing
        close_app = Clock.schedule_once(self.callback, 5)

        # return the first (and only...) component of the application
        return SimpleWidget(self.df)


if __name__ == "__main__":
    SimpleApp().run()

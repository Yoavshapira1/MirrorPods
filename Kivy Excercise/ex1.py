# Please do not implement your exercises here, so other people can use it.
# Build your own Kivy environment as described on the main page, and implement it there.
#
#
############################################ EX1 #################################################
#
# Implement a simple application to play around with the touch event objects and the timers of Kivy.
#
# Stage 1:
# Implement an application that waits for a touch to appear, and when the touch has disconnected
# it prints the duration of the touch and exits, using "stop()" method ot the running app.
# Make sure that a mouse event doesn't do anything, but only touch events.
# If there is no touch appears for 10 seconds, the application exits and prints "Time's up".
# IMPORTANT: Before the application exits, make sure to cancel the timer event. Take a look on this API for how to do it:
# https://kivy.org/doc/stable/api-kivy.clock.html
#
# Stage 2:
# Modify the code so the app won't exit after a touch stops, but only prints the duration of the event.
# Now, everytime a touch occurs, the timer will be on hold.
# When the timer expires, print "Time's up" and exit the app.
# (i.e, if I touched for 2 seconds and then for another 5 seconds, the app will exit after 17 seconds in total)
#
# Stage 3:
# Modify the code, so for every touch event that occurs when there is already a touch that is being tracing - tha app
# prints the distance of the new touch from the first touch. Make sure you print the distance only ONCE for every event.
# Also make sure, that the touch that is being tracing has not changes to the new one.
#
#
# * The comments within the code are only related to stage 1 *
# This API will be useful: https://kivy.org/doc/stable/api-kivy.input.motionevent.html
#
#
# ! ! ! Good luck ! ! !


from kivy.app import App
from kivy.uix.widget import Widget
from kivy.core.window import Window
from kivy.clock import Clock


class Ex1Widget(Widget):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.touch_event = None      # tracing the touch event, if any

    def on_touch_down(self, touch):
        # here you save (or not) the touch event
        # note: the attribute touch.device is either "mouse" or "wm_touch"
        pass

    def on_touch_move(self, touch):
        # your code here
        pass

    def on_touch_up(self, touch):
        # your code here
        # use touch.id to make sure you deal with the right event

        app = App.get_running_app()  # get the current app


class Ex1App(App):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        # these lines create full-window application that stops when `escape` is pressed
        Window.fullscreen = True
        Window.borderless = True
        Window.maximize()
        Window.exit_on_escape = True

    def build(self):
        return Ex1Widget()


if __name__ == "__main__":
    # points to think: Who handles the timer? who handles the touch events?
    Ex1App().run()

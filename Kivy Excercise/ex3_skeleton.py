from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.uix.screenmanager import Screen, ScreenManager
import pandas as pd

class Block1Widget(Widget):
    # your implementation of block1 here

    def start(self):
        pass

    def stop(self):
        pass

class Block2Widget(Widget):
    # your implementation of block2 here
    pass


class BlockScreen(Screen):
    def __init__(self, widget, timer, text, sm, next_screen, **kw):
        super().__init__(**kw)
        pass

    def on_enter(self, *args):
        # First, implement with no instructions. Then, try to add them and fix the issues
        pass

    def on_leave(self, *args):
        pass

    def stop(self, dt):
        self.sm.current = self.next_screen


class Exit(Screen):
    pass


class MyApp(App):

    def on_stop(self):
        pass

    def build(self):
        # Define the blocks here, in the order you want them, and return the ScreenManager with the first Screen
        pass

if __name__ == "__main__":
    MyApp().run()
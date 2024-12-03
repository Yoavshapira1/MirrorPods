from kivy.app import App
from kivy.core.window import Window

class MirrorPodsAppAbs(App):
    """
    Abstract class for all the applications
    This app is not functional, and only instantiates necessary features, such the requested window
    for the application.
    More global features that are must, should be instantiated in the constructor of this class
    """
    def __init__(self, full_window=True, **kwargs):
        super().__init__(**kwargs)
        if full_window:
            Window.fullscreen = True
            Window.borderless = True
            Window.maximize()
            Window.exit_on_escape = True
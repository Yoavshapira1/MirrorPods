from os.path import isdir
from kivy.uix.screenmanager import ScreenManager
from Tapper.App_Utilities.Factory import *
from Tapper import MirrorPodsAppAbs as MpApp
from Tapper.App_Utilities.Context import Context


class SoloApp(MpApp):
    """
    A reduced version of the MyApp (implemented in Server.py), contains only the solo screens
    """
    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.context.set_screen_manager(ScreenManager())
        self.factory = Factory(self.context)

    def build(self):
        self.factory.build_screen(TAPPING)
        self.factory.build_screen(CIRCLES)
        self.factory.build_screen(FREE_MOTION)
        self.factory.build_screen(REGISTER)
        self.factory.build_screen(MENU)
        self.factory.build_screen(EXIT)
        self.context.get_screen_manager().current = REGISTER
        return self.context.get_screen_manager()

def create_directories():
    # Main directory
    if not isdir(MAIN_DATA_DIR):
        mkdir(MAIN_DATA_DIR)

    # all subjects directory
    if not isdir(ALL_SUBJECTS_DIR):
        mkdir(ALL_SUBJECTS_DIR)


if __name__ == "__main__":
    create_directories()
    context = Context(connection=None, dyad_number=None)

    try:
        SoloApp(context, full_window=FULL_SCREEN_MODE).run()
    finally:
        context.remove_empty_dirs()

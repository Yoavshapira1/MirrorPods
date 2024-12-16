from os import mkdir
from os.path import isdir
from kivy.uix.screenmanager import ScreenManager
from Tapper.App_Utilities.Factory import *
from MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from Tapper.App_Utilities.Context import Context


class FullExperimentServerApp(MpApp):
    """
    The main application runs the whole experiment.
    This app must run on the machine that runs the LslRecorder (Supposedly ALMOTUNUI).
    The application will start only when the LslRecroder & the Client app are ON.
    :param context: a Context object contains the information about the cuurent experiment
    """
    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.context.set_screen_manager(ScreenManager())        # manages the current screen of the app
        self.factory = Factory(self.context)                    # responsible on creating the different screens

    def connect_lsl(self):
        """
        Waiting for the LSLrecorder
        When a LSLrecorder instance is found (on TCP port `LSL_TCP_PORT`) - create a socket connection and return None
        """
        while True:
            try:
                lsl_rsc_conn = socket.create_connection(("localhost", LSL_TCP_PORT))
                self.context.lsl_rsc_conn = lsl_rsc_conn
                return
            except:
                print("Waiting for LSL Recorder . . .")

    def stop(self, *largs):
        """
        The stop method is automatically called when the app is about to exit
        This will stop the LSL recording properly
        Add here anything may be useful for the stopping atsge, such as: automatic post-process the data
        """
        self.context.stop_lsl_recording()
        self.context.get_connection().sendall(bytes([EXIT_APP, 0]))

    def build(self):
        self.connect_lsl()

        # manually change here to change the experiment flow. ATM, it contains all the possible screens
        self.factory.build_screen(TAPPING)
        self.factory.build_screen(CIRCLES)
        self.factory.build_screen(FREE_MOTION)
        self.factory.build_screen(DYADIC)
        self.factory.build_screen(REGISTER)
        self.factory.build_screen(MENU)
        self.factory.build_screen(EXIT)
        self.context.get_screen_manager().current = REGISTER
        return self.context.get_screen_manager()


def connect_to_client():
    """
    Waiting for the Client application
    Where the Client is found, create a TCP socket connection to client
    """
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = DEV_MODE_HOST if CLIENT_DEV_MODE else TCP_CLIENT_HOST
    server_address = (host, TCP_PORT)
    sock.bind(server_address)
    sock.listen(1)
    conn, client_address = sock.accept()
    return conn

def create_main_directories():
    """
    Making sure all the directories required for the application are exist
    """

    # Main directory
    if not isdir(MAIN_DATA_DIR):
        mkdir(MAIN_DATA_DIR)

    # all subjects directory
    if not isdir(ALL_SUBJECTS_DIR):
        mkdir(ALL_SUBJECTS_DIR)

    # all dyadics directory. Also count how many there are and pass to context
    if not isdir(ALL_DYADIC_DIR):
        mkdir(ALL_DYADIC_DIR)
    dirs = os.listdir(ALL_DYADIC_DIR)
    return len(dirs) + 1


if __name__ == "__main__":
    dyadic_number = create_main_directories()
    conn = connect_to_client()
    context = Context(dyad_number=dyadic_number, connection=conn)
    try:
        FullExperimentServerApp(context, full_window=FULL_SCREEN_MODE).run()
    finally:
        context.remove_empty_dirs()
        context.stop_lsl_recording()


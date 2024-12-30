from kivy.uix.screenmanager import ScreenManager
from Tapper.App_Utilities.Factory import Factory
from MirrorPodsAppAbs import MirrorPodsAppAbs as MpApp
from Tapper.App_Utilities.utils import FULL_SCREEN_MODE, CLIENT, CLIENT_DEV_MODE, DEV_MODE_HOST, TCP_SERVER_HOST, TCP_PORT
from Tapper.App_Utilities.Context import Context
import socket


class FullExperimentClientApp(MpApp):
    def __init__(self, context, **kwargs):
        super().__init__(**kwargs)
        self.context = context
        self.context.set_screen_manager(ScreenManager())
        self.factory = Factory(self.context)

    def build(self):
        self.factory.build_screen(CLIENT)
        return self.context.get_screen_manager()


def connect_to_server():
    while True:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            host = DEV_MODE_HOST if CLIENT_DEV_MODE else TCP_SERVER_HOST
            server_address = (host, TCP_PORT)
            sock.connect(server_address)
            sock.settimeout(0.001)
            return sock
        except:
            print("Waiting for server to connect . . .")


if __name__ == "__main__":
    server_conn = connect_to_server()
    context = Context(connection=server_conn)
    FullExperimentClientApp(context, full_window=FULL_SCREEN_MODE).run()

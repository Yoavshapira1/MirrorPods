from abc import abstractmethod
import pandas as pd
from pythonosc.udp_client import SimpleUDPClient


class Broadcaster:
    """
    An abstract class for all broadcasters objects.
    As default, a broadcaster object is set to a positional data broadcasting.
    NOTE that for LSL we use different object: the LslOutlet object
    All broadcasters have 4 main methods:
        start: This is need to initialize the necessary streams / outlets, (such as UDP socket, a Writer file,
               etc.) but not necessary do anything - in this case just 'pass'. The applications call this method
               when a screen or a task start.
        broadcast: Receive data as an argument, and broadcast this data
        stash: This should be implemented in every broadcaster object, due to the use of those objects in the
            applications, but not necessary do anything - in this case just call destroy(). The applications call
            this method when a task is being stashed ('delete' is pressed)
        destroy: Call this method when you finished using the broadcaster. This is need to close the streams / outlets.
    :param context: The Context object of the run
    :param positional: True if the broadcast should send positional data information (default), otherwise False

    """
    def __init__(self, context, positional=True):
        self.context = context
        self.positional = positional

    @abstractmethod
    def start(self):
        raise NotImplementedError("Must override Broadcaster.start")

    @abstractmethod
    def broadcast(self, data):
        raise NotImplementedError("Must override Broadcaster.broadcast")

    @abstractmethod
    def destroy(self):
        raise NotImplementedError("Must override Broadcaster.destroy")

    @abstractmethod
    def stash(self):
        raise NotImplementedError("Must override Broadcaster.stash")


class MaxMspBroadcaster(Broadcaster):
    """
    Broadcasts not-positional data to MaxMSP, using UDP socket
    :param host: Host of UDP socket, default is '127.0.0.1'
    :param port: Port of UDP socket, default is 2222
    :param channels: Number of channels, default is None stands for unknown amount of channels
    """

    def __init__(self, context=None, host='127.0.0.1', port=2222, channels=None, path=None, first_row=None, **kwargs):
        super().__init__(context)
        self.client = SimpleUDPClient(host, port)
        self.channels = channels

    def start(self):
        pass

    def broadcast(self, data):
        """
        Send the data to MaxMSP through UDP socket. MaxMSP is expecting to receive messages one by one, each message
        is in the exact format:
        /channels <x>, [v, v, v, v, v, v, v, v, v]
        where "/channels <x>" is a string and 'x' replaced by the number of channel,
        and each 'v' is a float
        :param data: Not-positional data, should be in the format:
        [[ch_1 values], [ch_2 values]]
        where "[ch_1 values]" contains exactly 9 float values.
        """
        if self.channels is None:
            self.channels = len(data)
            self.channel_len = len(data[0][1])
        for ch in range(self.channels):
            self.client.send_message('/channel%d' % (ch + 1), data[ch][1])

    def destroy(self):
        """
        Silent the sounds that MaxMSP creates, by sending negative values
        """
        for ch in range(self.channels):
            self.client.send_message('/channel%d' % (ch + 1), [-1.0] * 9)

    def stash(self):
        self.destroy()


class PrinterBroadcast(Broadcaster):
    """
    Broadcasts to the printer outlet
    """

    def start(self):
        print("Printing Broadcasting started")

    def broadcast(self, data):
        print(data)

    def destroy(self):
        print("Broadcasting finished")

    def stash(self):
        self.destroy()


class WriterBroadcastForSolo(Broadcaster):
    """
    Broadcasts a solo task to a file.
    The broadcast initializes a panda's DataFrame, and save it only when destroyed.
    :param path: The path of the file to broadcast the data to
    :param first_row: Columns names, as appear on the utilities file
    """

    def __init__(self, context, path, first_row):
        super().__init__(context=context)
        self.path = path
        self.first_row = first_row

    def start(self):
        """
        Initializes the DataFrame with the column names, and also extract the information about the
        current subject in the experiment.
        """
        self.df = pd.DataFrame(columns=self.first_row)
        self.subject = self.context.get_subject_number()

    def broadcast(self, data):
        """
        Add the data to the dataframe
        :param data: The data, exclude the subject's information
        """
        self.df.loc[len(self.df)] = [self.subject] + data

    def destroy(self):
        """
        Saves the dataframe as an Excel file
        """
        self.df.to_excel(self.path, index=False)

    def stash(self):
        """
        Resets the dataframe
        """
        self.df = pd.DataFrame(columns=self.first_row)

    def write_suffix(self, time):
        # add here any additional information to be added to the file, suc as time perspective
        pass

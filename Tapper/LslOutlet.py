from socket import gethostname
from pylsl import StreamInfo, StreamOutlet, local_clock
from Tapper.utils import ALMOTUNUI_HOSTNAME, SCREEN_1_NAME, SCREEN_2_NAME, LSL_SRATE, generate_head_columns, \
    HANDS_ALLOWED


class LSLOutlet:
    """
    Stream for continuous data to LSL recorder
    Automatically detect the machine it runs on - ALMOTUNUI or DISPLAY3
    The LSL continuous streams sample rate is determined in the utilities file, and
    chose to be 500 Hz as default. This data is to be down-sampled in the post process pipeline, to 125 Hz.
    """
    def __init__(self):
        if gethostname() == ALMOTUNUI_HOSTNAME:
            self.name = SCREEN_1_NAME
        else:
            self.name = SCREEN_2_NAME
        self.srate = LSL_SRATE
        self.type = 'Touch'
        _col = len(generate_head_columns()[:-1]) // HANDS_ALLOWED   # how many columns needed for channels?
        self.channels = _col * HANDS_ALLOWED
        info = StreamInfo(self.name, self.type, self.channels, self.srate, 'float32', self.name)
        self.outlet = StreamOutlet(info)
        self.start_time = local_clock()
        self.sent_samples = 0
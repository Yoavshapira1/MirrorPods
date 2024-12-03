"""Example program to demonstrate how to send a multi-channel time series to
LSL."""
import sys
import getopt
import time
from random import random as rand
import socket

import numpy as np
import pylsl.pylsl
from pylsl import StreamInfo, StreamOutlet, local_clock as lsl_clock

def start_rec(s):
    s.sendall(b"select all\n")
    s.sendall(
        b"filename {root:C:\Users\yoavsha\Desktop\LSL\Development\Data\s} {template:exp%n\\%p_block_%b.xdf} {run:2} {participant:P003} {task:MemoryGuided}\n")
    s.sendall(b"Start\n")
    time.sleep(1)

def main(argv):
    srate = 500
    name = 'BioSemi1'
    type = 'EEG'
    n_channels = 8
    
    # first create a new stream info (here we set the name to BioSemi,
    # the content-type to EEG, 8 channels, 100 Hz, and float-valued data) The
    # last value would be the serial number of the device or some other more or
    # less locally unique identifier for the stream as far as available (you
    # could also omit it but interrupted connections wouldn't auto-recover)
    info = StreamInfo(name, type, n_channels, srate, 'float32', 'myuid34234')

    # next make an outlet
    outlet = StreamOutlet(info)

    print("now sending data...")
    start_time = lsl_clock()
    sent_samples = 0

    while True:
        elapsed_time = lsl_clock() - start_time
        required_samples = int(srate * elapsed_time) - sent_samples
        for sample_ix in range(required_samples):
            # make a new random n_channels sample; this is converted into a
            # pylsl.vectorf (the data type that is expected by push_sample)
            mysample = [rand() for _ in range(n_channels)]
            # now send it
            outlet.push_sample(mysample)
        sent_samples += required_samples
        # now send it and wait for a bit before trying again.
        time.sleep(1 / srate)

if __name__ == '__main__':
    main(sys.argv[1:])

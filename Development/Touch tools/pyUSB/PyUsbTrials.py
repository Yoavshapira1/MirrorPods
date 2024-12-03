#!/usr/bin/python

# -------------------- OUR SCREENS INFORMATION --------------------------

# Old ones:
# {'Decimal VendorID': '1111', 'DecProductID:': '2071', 'Hexadecimal VendorID': '0x457', 'HexProductID:': '0x817'}

# Mini Touch
# {'Decimal VendorID': '3823', 'DecProductID:': '49154', 'Hexadecimal VendorID': '0xeef', 'HexProductID:': '0xc002'}

# Zytronic:
# {'Decimal VendorID': '5320', 'DecProductID:': '22', 'Hexadecimal VendorID': '0x14c8', 'HexProductID:': '0x16'}

# -------------------- END SCREENS INFORMATION --------------------------
import array
import sys

import numpy as np
import usb.core
import usb.util

# decimal vendor and product values
devices = usb.core.find(find_all=True)
devices_lst = []
for dev in devices:
    devices_lst.append(dev)
if len(devices_lst) == 0:
    raise ValueError("Devices  were not found. Make sure you write the IDs correctly and the devices are plugged in")
print(len(devices_lst))
dev = devices_lst[0]
# access the first configuration
cfg = dev[0]
# access the first interface
interface = cfg[(0,0)]
# access the first endpoint
endpoint = interface[0]
print(endpoint)
while True:
    try:
        data = dev.read(endpoint.bEndpointAddress, endpoint.wMaxPacketSize)
        print (data)
    except usb.core.USBError as e:
        data = None
        if e.args == ('Operation timed out',):
            continue

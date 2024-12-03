# Touch Tools
This folder contains information and tools for easier work with _libusb_ library.

## _libusb_:
This folder contains only 1 folder that important: _**examples/bin64**_. This is contains several executables that reveal information about the USB devices that are connected. Read the readme for further usage information.

## _pyUSb_: Here all the touch-experiments should be done. Below an explanations of the files inside:

### _**DiscoverUsbDevice.py**_:

Reveal the USB information on a target USB device. Follow the instructions in the code.

### _**PyHidTrials.py**_:

A python code file to experiment the HIDAPI library. So far no results.

### _**PyUsbTrials.py**_:

A python code file to experiment the pyUSB (and hence, _libusb_) library. In order to be able to handle a USB device with this library, you need to install the _libusb_ driver to this device, using the executable `Zagid-2.7.exe`. Follow the instructions bellow.

### _**UsbTreeView.exe**_:

Exuctable shows all information about all USB ports in the computer, Very much elaborated.

### _**zadig-2.7.exe**_:

This is a util executable to change a desired USB device's driver, to one of those _libusb_ can handle. How to use:
1. Run `DiscoverUsbDevice.py` on target device, and save it's `Hexadecimal VendorID` and `HexProductID` values. The values should be look like: `'Hexadecimal VendorID': '0xeef', 'HexProductID:': '0xc002'`
2. Run `zadig-2.7.exe` .
3. Choose `Options->List All Devices`
4. Now all connected USB devices are appeared in the scroll-list. Find your target device, and make sure that the values in _**"USB ID"**_ are the same as  `Hexadecimal VendorID` and `HexProductID`.
5. In the `Driver` line, toggle the right box to the value `WinUSB (v6.1.7600.16385)` and press 'Replace Driver'.
6. Press 'Yes' in the pop-up box.

From here and on, the target device will not be functional. In order to roll back its functionality, you need to install the native driver again. In order to do that:
1. Right click on the _windows_ menu.
2. Choose `Device Manager`.
3. Find your device. It probably will be appeared under the _**"Universal Serial USB"**_ tab. The device name should be the same name as appeared in the scroll-menu in `zadig-2.7.exe`.
4. Right Click on the device, and then `Update Driver`.
5. Choose `Browse My Computer For Drivers`.
6. Choose `Let Me Pick From A List`.
7. Choose the last one in the list and then `Next`.

The device should be functional again.
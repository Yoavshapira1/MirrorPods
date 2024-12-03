import time
import hid


# -------------------- OUR SCREENS INFORMATION --------------------------

# Old ones:
# {'Decimal VendorID': '1111', 'DecProductID:': '2071', 'Hexadecimal VendorID': '0x457', 'HexProductID:': '0x817'}

# Mini Touch
# {'Decimal VendorID': '3823', 'DecProductID:': '49154', 'Hexadecimal VendorID': '0xeef', 'HexProductID:': '0xc002'}

# Zytronic:
# {'Decimal VendorID': '5320', 'DecProductID:': '22', 'Hexadecimal VendorID': '0x14c8', 'HexProductID:': '0x16'}

# -------------------- END SCREENS INFORMATION --------------------------

# # PRINT ALL DEVICES
# for device_dict in hid.enumerate():
#     keys = list(device_dict.keys())
#     keys.sort()
#     for key in keys:
#         print("%s : %s" % (key, device_dict[key]))
#     print()
# exit()
try:
    print("Opening the device")

    h = hid.device()
    h.open(5320, 22)  # TREZOR VendorID/ProductID

    print("Manufacturer: %s" % h.get_manufacturer_string())
    print("Product: %s" % h.get_product_string())
    print("Serial No: %s" % h.get_serial_number_string())

    # enable non-blocking mode
    print(h.set_nonblocking(1))

    # write some data to the device
    # print("Write the data")
    # print(h.write([0, 63, 35, 35] + [0] * 61))

    # wait
    time.sleep(0.05)

    # read back the answer
    print("Read the data")
    while True:
        d = h.read(64)
        if d:
            print(d)
        else:
            break

    print("Closing the device")
    h.close()

except IOError as ex:
    print(ex)
    print("You probably don't have the hard-coded device.")
    print("Update the h.open() line in this script with the one")
    print("from the enumeration list output above and try again.")

print("Done")
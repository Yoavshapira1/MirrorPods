# This is implement the animation canvas for the RealtimeAnimationServerApp application
# This code should run on the other machine from the one that running RealtimeAnimationServerApp.py

import threading

def get_conn():
    import socket
    UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    UDPServerSocket.bind(('', 2345))
    return UDPServerSocket

def animation(conn):
    import struct
    import numpy as np
    import matplotlib.pyplot as plt
    import matplotlib.animation as animation

    buffer = []
    buffer_size = 100

    def receive_data():
        data_bytes, address = conn.recvfrom(32)
        return struct.unpack("!ffffffff", data_bytes)

    def animate(i, x, y, c, scat, ch1_text, ch2_text, ch1_text_values, ch2_text_values,
                ch1_disconnections_text, ch2_disconnections_text, ch1_dis_values, ch2_dis_values):
        while len(buffer) > 0:
            data = buffer.pop(0)

            # disconnection counter update
            if len(x) > 2:
                if data[0] == -1 and x[-2] != 2:
                    ch1_dis_values[0] += 1
                if data[4] == -1 and x[-1] != 2:
                    ch2_dis_values[0] += 1

            # channel 1
            x = np.append(x, 1-data[0])
            y = np.append(y, data[1])
            ch1_info = "ch1: %d, " % (data[2]) if data[0] > -1 else ""
            id1_info = "ID: %d" % (data[3]) if data[0] > -1 else ""
            ch1_text_values = np.append(ch1_text_values, ch1_info + id1_info)

            # channel 2
            x = np.append(x, 1-data[4])
            y = np.append(y, data[5])
            ch2_info = "ch2: %d, " % (data[6]) if data[4] > -1 else ""
            id2_info = "ID: %d" % (data[7]) if data[4] > -1 else ""
            ch2_text_values = np.append(ch2_text_values, ch2_info + id2_info)

            if len(c) == 0:
                c = [1, 2]

            scat.set_offsets(np.c_[x, y])
            scat.set_array(c)

            # generate text indicates channel and touch ID
            try:
                ch1_text.set_position((x[-2], y[-2] + 0.05))
            except TypeError as e:
                ch1_text.set_position((x[-2], y[-2]))
            finally:
                ch1_text.set_text(str(ch1_text_values[-1]))
                ch1_text.set_size(25)

            try:
                ch2_text.set_position((x[-1], y[-1] + 0.05))
            except TypeError as e:
                ch2_text.set_position((x[-1], y[-1]))
            finally:
                ch2_text.set_text(str(ch2_text_values[-1]))
                ch2_text.set_size(25)

            # generate disconnections counters
            ch1_disconnections_text.set_text("ch1 disconnections: %d" % ch1_dis_values[0])
            ch2_disconnections_text.set_text("ch2 disconnections: %d" % ch2_dis_values[0])


        return scat, ch1_text, ch2_text

    def receive_data_thread():
        while True:
            data = receive_data()
            buffer.append(data)
            if len(buffer) > buffer_size:
                buffer.pop(0)

    x, y, c, ch1_text_values, ch2_text_values, ch1_disconnections, ch2_disconnections = [], [], [], [], [], [0], [0]
    fig = plt.figure()
    ax = plt.axes()
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.set_xticks([])
    ax.set_yticks([])
    ch1_text = ax.text(0, 0, "", fontsize=8)
    ch2_text = ax.text(0, 0, "", fontsize=8)
    ch1_disconnect_text = ax.text(0, 0, '', fontsize=15, horizontalalignment='left')
    ch2_disconnect_text = ax.text(1, 0, '', fontsize=15, horizontalalignment='right')
    scat = ax.scatter(x, y, c=c, cmap="cool", s=100, alpha=0.5, edgecolor='black')

    receive_thread = threading.Thread(target=receive_data_thread)
    receive_thread.start()

    args = (x, y, c, scat, ch1_text, ch2_text, ch1_text_values, ch2_text_values,
            ch1_disconnect_text, ch2_disconnect_text, ch1_disconnections, ch2_disconnections)
    ani = animation.FuncAnimation(fig, animate, fargs=args, interval=1, blit=False)
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    conn = get_conn()
    animation(conn)


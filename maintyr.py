import serial # Get the data from Arduino
import matplotlib.dates as mdates # Format the time on x axis
import datetime # Get the time 
import matplotlib.pyplot as plt # Plot the graph
import matplotlib.animation as animation # Animate the graph
from matplotlib import style

style.use("fivethirtyeight") # Style of the graph might change it later

# Defining some starting varibales
fig = plt.figure()
fig.canvas.set_window_title('Arduino')
fig.suptitle('bold figure suptitle', fontsize=14, fontweight='bold')
ax1 = fig.add_subplot(1,1,1)
plt.subplots_adjust(bottom=0.1)
plt.subplots_adjust(left=0.11)
ax1.set_xlabel("Counter")
ax1.set_ylabel("Light")
ax1.set_ylim(0, 1000)
ax1.set_xlim(datetime.datetime.now(),datetime.datetime.now() + datetime.timedelta(seconds=6))
fig.autofmt_xdate()
myFmt = mdates.DateFormatter('%H:%M:%S')
plt.gca().xaxis.set_major_formatter(myFmt)

open("example.txt", "w+").close() # Empties list

def getInput():
    """ Gets raw integer input from arduino """
    ser = serial.Serial("/dev/ttyACM1",9600)
    value = ser.readline()
    return int(value)

def updateValues(ardValue):
    """ Adds new values to the text file"""
    data = open("example.txt", "a+")
    data.write((str(ardValue)) + "\n")
    data.close()

def animate(i):
    """ Plots the graph and Updates it every second """
    with open('example.txt','r') as f:
        graph_data = f.read()
    lines = graph_data.split("\n")
    xs = []
    ys = []

    for line in lines:
        if len(line) > 1:
            ys.append(line)
    ax1.clear()
    ax1.plot_date(xs, ys)
    fig.autofmt_xdate()
    updateValues(getInput())
    updateAllAxis()

def updateAllAxis():
    """ As the axis are being cleared some values needs to be redeffined
    this function redeffines those values"""
    ax1.set_ylim(0, 1000)
    ax1.set_xlim(datetime.datetime.now(),datetime.datetime.now() + datetime.timedelta(seconds=6))
    ax1.set_xlabel("Counter")
    ax1.set_ylabel("Light")

    num_lines = sum(1 for line in open('example.txt'))
    if num_lines == 7:
        with open('example.txt', 'r') as fin:
            data = fin.read().splitlines(True)
        with open('example.txt', 'w') as fout:
            fout.writelines(data[1:])


def updateXaxis():
    num_lines = sum(1 for line in open('example.txt'))
    if num_lines < 7:
        x = [datetime.datetime.now() + datetime.timedelta(hours=i) for i in range(7)]
        return x


def main():
    ani = animation.FuncAnimation(fig, animate, interval=1000)
    plt.show()
    
if __name__ == "__main__":
    main()
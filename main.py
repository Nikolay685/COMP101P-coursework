import serial
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib import style

style.use("fivethirtyeight")

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)

def getInput():
    ser = serial.Serial("/dev/ttyACM1",9600)
    while True:
        print (ser.readline())

def animate(i):
    graph_data = open("example.txt", "r").read()
    lines = graph_data.split("\n")
    xs = []
    ys = []

    for line in lines:
        if len(line) > 1:
            x,y = line.split(",")
            xs.append(x)
            ys.append(y)
    ax1.clear()
    ax1.plot(xs, ys)

def main():

    ani = animation.FuncAnimation(fig, animate, interval=1000)
    plt.show()
    
if __name__ == "__main__":
    main()
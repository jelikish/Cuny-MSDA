import pandas as pd
import matplotlib.pyplot as plt
from scipy import misc
import numpy as np

df = pd.read_csv('c:/data/cars.data.csv', sep=',', header = None, names = ['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety', 'class'])

#Part 1
buyingdf = df['buying'].value_counts()
buyingdf.columns = ['values', 'count']
plt.subplot(221)
buyingdf.plot()
plt.yscale('linear')
plt.title('Buying')
plt.grid(True)

maintdf = df['maint'].value_counts()
plt.subplot(222)
maintdf.plot()
plt.yscale('linear')
plt.title('Maint')
plt.grid(True)

safetydf = df['safety'].value_counts()
plt.subplot(223)
safetydf.plot()
plt.yscale('linear')
plt.title('Safety')
plt.grid(True)

doorsdf = df['doors'].value_counts()
plt.subplot(224)
doorsdf.plot()
plt.yscale('linear')
plt.title('Doors')
plt.grid(True)

plt.show()

#Part2
brain = pd.read_csv('C:/Users/joseph/Documents/Cuny/602/brainandbody.csv', sep=',')

x = brain['body']
y = brain['brain']
plt.plot(x, y, 'ro')
plt.axis([0, 600, 0, 1500])
plt.title('Brain-to-body mass Relationship')
plt.plot(x,0.903*x -56.856)
plt.show()

#Part 3
coordinates = [(92,400),(114,285),(183,434),(180,160),(270,300),(420,375),(410,145),(510,70)]

x = [];
y = [];

for i in range(8):
    x.append(coordinates[i][0])
    y.append(512-coordinates[i][1])




plt.imshow(np.flipud(plt.imread('c:/data/images/objects.png')), origin='lower')
#plt.imshow(plt.imread('c:/data/images/objects.png'))
plt.plot(x,y,'ro')
plt.axis([0, 585, 0, 512])
plt.title('Object Center location')
plt.show()


#Part 4

log = pd.read_csv('c:/data/epa-http-out.txt', sep='\s+', quoting=1, header = None, names=['host','time','http','status','size'])

log['time'] = log['time'].replace('\[', value='', regex=True)
log['time'] = log['time'].replace('\]', value='', regex=True)
busy_by_hour = log['time'].groupby(log['time'].str.extract('\d\d:(\d\d):\d+')).count()
busy_by_hour.plot(kind='bar')
plt.title('Requests by hour')
plt.show()




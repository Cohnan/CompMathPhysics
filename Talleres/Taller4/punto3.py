import numpy as np
from scipy.interpolate import interp1d
import matplotlib as mpl
import matplotlib.pyplot as plt

data = np.genfromtxt('tabla.tsv', delimiter = '\t')

xd = data[:, 0]
yd = data[:, 1]

cub = interp1d(xd, yd, kind = 'cubic')

fig = plt.figure('Punto 3')
ax = fig.add_subplot(111)

x = np.linspace(min(xd), max(yd), len(xd))
line, = ax.plot(x, cub(x))

yNew = line.get_ydata()

print "|x|y|"
print "|---|---|"
for i in range(len(x)):
    print "|" + str(xd[i]) + "|" + str(yNew[i]) + "|"
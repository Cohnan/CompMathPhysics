# -*- coding: utf-8 -*-

import numpy as np
from scipy.interpolate import interp1d
import matplotlib as mpl
import matplotlib.pyplot as plt

data = np.genfromtxt('tabla.tsv', delimiter = '\t')

xd = data[:, 0]
yd = data[:, 1]

# Interpolación de los datos
cub = interp1d(xd, yd, kind = 'cubic')

fig = plt.figure('Punto 3')
ax = fig.add_subplot(111)

# Generación de x's uniformemente espaciados
#x = np.linspace(min(xd), max(yd), len(xd))
x = np.array([])
for i in range(len(xd)):
    x = np.append(x, [np.random.uniform(min(xd), max(xd))])

x = np.sort(x)

line, = ax.plot(x, cub(x))

xNew = line.get_xdata()
yNew = line.get_ydata()

print "|x|y|"
print "|---|---|"
for i in range(len(x)):

    print "|" + str(xNew[i]) + "|" + str(yNew[i]) + "|"

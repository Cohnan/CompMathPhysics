#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

**c.**
```python
from scipy.interpolate import lagrange, interp1d
from scipy.integrate import quad

x = np.linspace(0,2*np.pi, 100)

x1 = array([0., np.pi/2, np.pi, 3*np.pi/2, 2*np.pi])
x2 = np.linspace(0, 2*np.pi, 10)
x3 = np.linspace(0, 2*np.pi, 20)

# Interpolacones con 5 datos
lag1 = lagrange(x1, sin(x1))
lin1 = interp1d(x1, sin(x1), kind = 'slinear')
cub1 = interp1d(x1, sin(x1), kind = 'cubic')

# Interpolacones con 10 datos
lag2 = lagrange(x2, sin(x2))
lin2 = interp1d(x2, sin(x2), kind = 'slinear')
cub2 = interp1d(x2, sin(x2), kind = 'cubic')

# Interpolacones con 20 datos
lag3 = lagrange(x3, sin(x3))
lin3 = interp1d(x3, sin(x3), kind = 'slinear')
cub3 = interp1d(x3, sin(x3), kind = 'cubic')

fig = figure('InterpolacionSeno', figsize = (15, 15))

# Lagrange
ax1 = fig.add_subplot(331)
ax1.set_xlim(0, 2*np.pi)
ax1.set_ylim(-1.1, 1.1)
ax1.plot(x, lag1(x), 'b-')

ax2 = fig.add_subplot(332)
ax2.set_xlim(0, 2*np.pi)
ax2.set_ylim(-1.1, 1.1)
ax2.plot(x, lag2(x), 'r-')

ax3 = fig.add_subplot(333)
ax3.set_xlim(0, 2*np.pi)
ax3.set_ylim(-1.1, 1.1)
ax3.plot(x, lag3(x), 'k-')

tit1 = ax1.set_title("Lagrange")

# Linear Spline
ax4 = fig.add_subplot(334)
ax4.set_xlim(0, 2*np.pi)
ax4.set_ylim(-1.1, 1.1)
ax4.plot(x, lin1(x), 'b-')

ax5 = fig.add_subplot(335)
ax5.set_xlim(0, 2*np.pi)
ax5.set_ylim(-1.1, 1.1)
ax5.plot(x, lin2(x), 'r-')

ax6 = fig.add_subplot(336)
ax6.set_xlim(0, 2*np.pi)
ax6.set_ylim(-1.1, 1.1)
ax6.plot(x, lin3(x), 'k-')

tit2 = ax4.set_title("Linear Spline")

# Cubic Spline
ax7 = fig.add_subplot(337)
ax7.set_xlim(0, 2*np.pi)
ax7.set_ylim(-1.1, 1.1)
ax7.plot(x, cub1(x), 'b-')

ax8 = fig.add_subplot(338)
ax8.set_xlim(0, 2*np.pi)
ax8.set_ylim(-1.1, 1.1)
ax8.plot(x, cub2(x), 'r-')

ax9 = fig.add_subplot(339)
ax9.set_xlim(0, 2*np.pi)
ax9.set_ylim(-1.1, 1.1)
ax9.plot(x, cub3(x), 'k-')

tit3 = ax7.set_title("Cubic Spline")

# Graficación del seno en un color claro en cada gráfico de una interpolación
for i in range(9):
    eval("ax" + str(i+1) + ".plot(x, sin(x), 'c-')")

numDoings = 3

interps = ["lag", "lin", "cub"]


# Creación e impresión de funciones que evaluen la distancia entre cada una la funciones y calcule el error porcentual. (La distancia está configurada para que la del seno sea 1)
for inter in interps:
    for i in range(1, numDoings + 1):
        # Hace funciones que evalúan el cuadrado de la diferencia entre las funciones
        exec("def " + inter + str(i) + "Integ(x): return (sin(x) -" + inter + str(i) + "(x))**2")

        # Imprime un texto para formato, luego hace la integral del cuadrado anterior, saca su raiz cuadrada y
        # lo escala de modo que esto represente un producto interno, donde la raiz del producto interno de una 
        #función consigo misma sea su magnitud y se escala de modo que el seno tenga una magnitud de 1,
        # y finalmente se multplica por 100 para que sea un porcentaje. 
        print "El error porcentual de la distancia entre las funciones " + inter + str(i) + "(x) y seno(x) es de %" + \
        str(eval("100 * (1/np.pi)* sqrt(quad(" + inter + str(i) + "Integ, 0, np.pi)[0])"))
        exec("def " + inter + str(i) + "Integ(x): return 0.5 * 100 * abs(sin(x) -" + inter + str(i) + "(x))")
        print "El error porcentual de la distancia entre las funciones " + inter + str(i) + "(x) y seno(x) es de " + \
        str(eval("np.sqrt(quad(" + inter + str(i) + "Integ, 0, np.pi)[0])"))
    print 
```

La interpolación con 5, 10 y 20 datos, con el **seno** de color claro en cada una para apreciar la diferencia es:

![Interpolación del Seno](https://github.com/Cohnan/MC/blob/master/Talleres/Taller4/interpolacionSeno.png)

La distancia de la que hablo es la raiz cuadrada del producto interno de la diferencia de las funciones en el intervalo 0 a 2 PI.

+ El error porcentual de la distancia entre las funciones lag1(x) y seno(x) es de %5.57088003866
+ El error porcentual de la distancia entre las funciones lag2(x) y seno(x) es de %0.00125953372875
+ El error porcentual de la distancia entre las funciones lag3(x) y seno(x) es de %0.000335997569728
+ 
+ El error porcentual de la distancia entre las funciones lin1(x) y seno(x) es de %8.51232225711
+ El error porcentual de la distancia entre las funciones lin2(x) y seno(x) es de %1.75618227884
+ El error porcentual de la distancia entre las funciones lin3(x) y seno(x) es de %0.397315273852
+ 
+ El error porcentual de la distancia entre las funciones cub1(x) y seno(x) es de %5.57088003866
+ El error porcentual de la distancia entre las funciones cub2(x) y seno(x) es de %0.0568801893041
+ El error porcentual de la distancia entre las funciones cub3(x) y seno(x) es de %0.00121066615614

La interpolación de **Lagrange**  mostró ser la más precisa en todos los 3 casos (5, 10 y 20 datos). La menos precisa fue la interpolación con **spline lineal**, la cual ni siquiera con 20 datos mostró ajustarse de manera visualmente suave (lo cual es de esperarse debido a que ésta gráfica está compuesta únicamente de líneas rectas), como si lo hicieron las otras 2 de manera considerable.

La más precisa visualmente fue la interpolación spline cúbico, con inapreciable diferencia visible desde la interpolación con 10 datos, pero según los errores presentados por las distancias, la interpolación de Lagrange es la más fiel al seno en más lugares desde los 10 datos.

Lagrange fue mejor en apariencia con sólo 10 datos, que con 20, pero sus distancias al seno indican que esta primera se debió sólo a coincidencia y no refleja realmente el comportamiento de la función.

Tiene sentido que Lagrange sea la más adecuada interpolación ya que su expansión de Taylor es una serie alternante con términos decrecientes, donde cada término que se agregue a la suma parcial representa una reducción en el error de la aproximación  y dond el siguiente representa una cota superior para el error, así que al hacer con Lagrange polinomios de mayores grados se logran cada vez mejores aproximaciones.

En cambio, el spline cúbico simplemente aproxima la función en intervalos con funciones cúbicas, que no son suficientes para ajustarse perfectamente a la función en cada punto, pues la serie del seno es infinita.

En general, hacer la interpolación con más datos hizo que las gráficas fueran más cercanas al seno.

**d.**
```python
from scipy.interpolate import lagrange, interp1d

xd = array([-3., -2., -1., 0., 1., 2., 3.])
yp = array([0., 0., 0., 1., 0., 0., 0.])
ys = array([0., 0., 0., 1., 1., 1., 1.])

x = np.linspace(-3, 3, 100)

# Pulso interpolación
lagp = lagrange(xd, yp)
linp = interp1d(xd, yp, kind = 'slinear')
cubp = interp1d(xd, yp, kind = 'cubic')

# Step interpolación
lags = lagrange(xd, ys)
lins = interp1d(xd, ys, kind = 'slinear')
cubs = interp1d(xd, ys, kind = 'cubic')

fig = figure('Pulso y Step', figsize = (15, 10))

# Pulsog rafica
ax1 = fig.add_subplot(231)
ax1.set_title("Pulso")
ax1.plot(x, lagp(x))

ax2 = fig.add_subplot(232)
ax2.plot(x, linp(x))

ax3 = fig.add_subplot(233)
ax3.plot(x, cubp(x))

# Step grafica
ax4 = fig.add_subplot(234)
ax4.set_title("Step")
ax4.plot(x, lags(x))

ax5 = fig.add_subplot(235)
ax5.plot(x, lins(x))

ax6 = fig.add_subplot(236)
ax6.plot(x, cubs(x))

# Adición de datos originales en cada gráfico
for i in range(1, 4):
    sp = plt.subplot(2,3,i)
    sp.scatter(xd, yp)
    
for i in range(4, 7):
    sp = plt.subplot(2,3,i)
    sp.scatter(xd, ys)
```
Las gráficas de las interpolaciones de **Lagrange**, **Spline Lineal** y **Spline Cúbico** respectivamente son:

![Pulso y Step Interpolación](https://github.com/Cohnan/MC/blob/master/Talleres/Taller4/pulsoYstep.png)

Las funciones que utilizan polinomios, es decir Lagrange y el Cubic Spline, presentan oscilaciones 
entre los puntos de los datos originales cuando 2 de éstos están a la misma altura; esto 
para que los datos coincidan ya que, al ser polinomios (no constantes), tienen un número finito de raices 
y por lo tanto no tienen permitido permanecer en un valor en un intervalo.

El spline lineal en cambio, no muestra oscilación entre los puntos ya que únicamente se están 
uniendo los puntos con líneas.


2. Leer del libro [Numerical Methods and Optimization](http://ezproxy.uniandes.edu.co:8080/login?url=http://dx.doi.org/10.1007/978-3-319-07671-3) de *Eric Walter* los ejemplos de la sección 5.2: *Computer experiments*, *Prototyping* y *Mining surveys*.  

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|

```python
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

# Generación de x's distribuidos uniformemente
#x = np.linspace(min(xd), max(yd), len(xd))
x = np.array([])
for i in range(len(xd)):
    x = np.append(x, [np.random.uniform(min(xd), max(xd))])

x = np.sort(x)

line, = ax.plot(x, cub(x))

# Extracción de datos con distribución uniforme
xNew = line.get_xdata()
yNew = line.get_ydata()

# Impresión de tabla en formato para Markdown
print "|x|y|"
print "|---|---|"
for i in range(len(x)):

    print "|" + str(xNew[i]) + "|" + str(yNew[i]) + "|"
```

```bash
python punto3.py > tabla.md
```
Me produce la siguiente tabla en un archivo aparte:

|x|y|
|---|---|
|0.298169535182|2.20095512273|
|0.331634299637|2.12144694356|
|0.384473717222|1.95877821526|
|0.758645609401|0.122425827832|
|0.904731259766|-0.575674499752|
|1.21820639218|-1.45380804259|
|1.24792548721|-1.47052552181|
|1.35792386066|-1.40081542145|
|1.40146406575|-1.31632337755|
|1.41874391161|-1.27598310345|
|1.82757712896|0.169213706872|
|1.82992729244|0.177974918755|
|2.0200546348|0.791221119936|
|2.0377892432|0.83799068575|
|2.12795603045|1.04705380801|
|2.2982178865|1.30626663815|
|2.46463688575|1.40030329074|
|2.76493673473|1.41169825608|
|3.36144151623|1.08304986198|
|3.67142614181|0.706552341647|
|3.67767380167|0.698350565784|
|3.8495837089|0.470134628842|
|4.15371054129|0.0869784161715|
|4.2413443293|-0.00883737687544|


**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**

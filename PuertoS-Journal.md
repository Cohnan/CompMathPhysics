#Primera Clase 27-May-2015

¡Hola mundo!, aquí estoy comenzando el curso de **Métodos Computacionales**.

Herramientas del Curso:

+ git,
+ gitHub,
+ bash,
+ C,
+ y Python,

Y los métodos a estudiar son:

1. Interpoación,
2. Análisis de Fourier,
3. Diferenciacioón e integración numérica,
4. Ecuaciones diferenciales ordinarias,
5. Ecuaciones diferenciales parciales,
6. Métodos de Monte Carlo.

Se estudió Git, plataforma que permite el almacenamiento el manejo de versiones de archivos. Se basa en la creación de Repositorios, cada uno de los cuales corresponde a un proyecto diferente, al cual una o varias personas pueden aportar, con la ventaja de que para cada aporte o Commit puede guardar la información tal como estaba antes y es posible volver a ella.

Las etapas en las que puede estar un archivo son 3: Commited que indica que todos los cambios en el archivo son parte ya del repositorio; Staged, en el cual los cambios realizados a un archivo serán agregados como la versión actual al hacer commit; y Modified, donde el archivo ha sido modificado, pero los cambios no han sido agregados para el siguiente commit. Adicionalmente puede pensarse de otra etapa, Untracked, en la cual el archivo no ha sido agregado por primera vez al repositorio.

Vimos la integracion de Git con github.com. Escencialmente, github es otro lugar donde el repositorio se encuentra el repositorio con toda su historia, de manera que es posible descargar o Clonar el repositorio a la máquina local, hacer los commits deseados y cuando se desee, actualizar la información en github para igualar a la local.

Los comandos útiles vistos son:
+ `git add ARCHIVOS...` para cambiar de untracked a staged en el workarea
+ `git commit` para hacer el commit de todos los cambios agregados. Abre el editor de texto predeterminado para hacer comentarios sobre el commit. Permite la opci´on `-m` que recibe como argumento el comentario.
+ `git push origin master` para subir los cambios del repositorio a github a la rama master.
+ `git pull origin master` para descargar los cambios del repositorio a la carpeta local del mismo de la rama master.
+ `git clone DIRECCIÓN` para clonar un repositorio a la máquina local desde github.
+ `git config --global user.name "NOMBRE"` para cambiar el usuario de github con el que se suben los cambios.
+ `git config --global user.email EMAIL` para cambiar la contraseña del usuario anterior.
+ `git config --global core.editor EDITOR` para cambiar el editor de texto que abre git.
+ `git config --list` para ver la configuración actual.

Se estudió brevemente `ssh` (Secure Shell). Vimos que a grandes rasgos ssh sirve para conectarse remotamente a un host para el cual tenemos un login y contraseña. Por ejemplo `ssh sc.puerto10@compufi3.uniandes.edu.co` me conecta al computador 3 de compufísica con el usuario *sc.puerto10*.

También se estudió brevemente `sftp` (Secure File Transfer Protocol), el cual nos permite hacer transferencia segura de archivos de un host, para el cual tenemos usuario y contraseña, a la máquina local. La sintaxis vista era idéntica a la de `ssh`. Habiéndonos conectado al host, por medio del shell navegamos y con el comando `get` (que recibe de arguentos los archivos a transferir y como último argumento el pathname local a la cual se quiere transferir) se realiza la transferencia de archivos. 

Tanto para `ssh` como para `sftp` podemos apagar la conexión con el comando `exit`.

Vimos una línea de comando que utilizaba los comandos `grep`, `wget`, `awk`, `sed`, `curl`, `figlet`, pipelines, entre otras cosas, para extraer, y en ese caso, imprimir la hora dada por una página de internet que era obtenida de un reloj atómico.


#Segunda Clase 29-May-2015

Accedimos remótamente al [*Fuerte Super Dimensional*](http://sdf.org "*Super Dimensional Fortress*") (cuyo hostname es sdf.org) por medio de `ssh` . Creamos usuario y contraseña como se indicaba. Estando ya conectados probamos algunos comandos, entre ellos unos juegos y un chat.

##Hands-On 1

En el directorio *ejerciciosDeClase* subdirectorio *clase2* agregé un archivo llamado archivo.txt, hice commit, lo eliminé y volví a hacer commit. Luego con `git log` busqué el *hash* del primer commit y con `git checkout HASH` recuperé mi archivo (puesto que esto restaura la información a la versión anterior de mi repositorio).
Extraje el archivo indicado en el hands-on con `tar -xvf archivo` (la opción `-x` es para extraer, `-v` para mostrar en display el proceso, `-f` para indicar el archivo) y con `git log | less` y luego con ayuda de `G` (para ir al final) busqué el segundo commit hecho. Encontré que la fecha era *Sat Jan 5 23:05:56 2013 -0500*. Además encontré que ese commit fue el add del *syllabus.tex* donde dice que el tema de la Semana 15 es Métodos de inferencia bayesiana y SQL.

#Tercera Clase 02-Jun-2015

##Expresiones Regulares

+ Escape de caracteres especiales con slash (para ser entendidos literalmente)

Una expresión regular es una secuencia de caracteres que determinan un patrón de un string. Las expresiones regulares tradicionales consisten de 3 partes: *Anchors* que determinan la posición del patrón en una línea, *Character Sets* que especifican uno o varios caracteres para igualar en una posición, y *Modifieres* para indicar cuántas veces el Character Set anterior se repite en el patrón.

Patroń | Significado
 --- | ---
 `^` | Inicio de línea
 `$` | Fin de línea
 `.` | Cualquier caracter excepto newline.
 `*` | El caracter anterior se repite 0 o más veces.
 `+` | El caracter anterior se repite 1 o más veces.
 `(a|b)` | Determina un grupo, a y b son regexs. Indica que en esa posición puede ir cualquiera de las expresiones regulares que están separadas por la barra. 
 `[ayc]` | a. y, c son Character Sets. Indica que cualquiera de los caracteres indicados va en ese lugar.
 `[^abc]` | Opuesto al anterior: cualquiera a excepción de esos caracteres (y newline) pueden ir allí.
 `{n}` `{n,m}` `{n,}` | Para repetir el caracter anterior exactamente n veces; de n a m veces; n veces o más.
 `\d` | Dígitos
 `\D` | 

*NOTA:* Algunas de los patrones anteriores no hacen parte de los aceptados en expresiones regulares tradicionales, así que al menos `sed` requiere de la opción `-E` para que acepte estas nuevas expresiones regulares, llamadas extendidas.

+ Análisis de los datos de [Datos satélites Júpiter](http://nssdc.gsfc.nasa.gov/planetary/factsheet/joviansatfact.html)

##GNU Plot

Permite hacer gráficos tanto como 2D como 3D desde la terminal, inclusive dentro de ella.
Se abre con `gnuplot`.

Para que las gráficas se muestren en la terminal `set term dumb` (otras posibilidades para `term` son `qt`, `x11`). 

Para hacer la gráfica de una función 2D se escribe `plot ` y la función; para 3D el comando es `splot ` y la función. Por defecto, las variables son *x* y *y*.

Para especificar rango, en paréntesis cuadrados y separado por : antes de la función, o antes con el comando `set xrange` por ejemplo para el rango de x.

(type set to 'aqua' para resize la pantalla (creo))

Ejemplos: 
+ `plot x`
+ `plot [0:2*pi] sin(x)`

Algunas opciones para configurar con el comando `set` son:

+ `term`
+ `VARrange`
+ `title`
+ `xlabel`
+ `ylabel`
+ `grid`
+ `size`
+ `keys`

###Gráfica Paramétrica

`set parametric` cambia el modo de la función a graficar a paramétrica, además cambiando la variable a `t`.

`unset parametric` para quitar esta configuración.

La sintáxis básica es `plot fun(t),fun2(t)`, con `fun1` parametrizando el eje horizontal y `fun2` el vertical.

###Superficies

`splot fun(x,y)` 

Ejemplo: `splot x**2 + y**2`

###GNU con archivos

`set datafile separator ","` para que la coma seas el separador de campos para los archivos que se lean.

`plot "joviansatellites.csv" using 2:3` para que use los campos 2 y 3 como *x* y *y* respectivamente del archivo que dicho.

Opciones adicionales `... with lines`, `... with circles`.

###Scripts con gnuplot

Para poder alimentar a un programa, como `gnuplot`, que funciona como un REPL en la terminal, se utiliza el `<< EOF` al lado de gnuplot por ejemplo, y posteriormente cada comando se separa por newlines. Al fin de los comandos a gnuplot se representa con `EOF` otra vez. (No tiene que ser EOF, puede ser cualquier palabra)

###Funcionesen GNUplot

La forma intuitiva: `nomFun(x) = x**2`

Se le puede aplicar funciones a las columnas como muestra el siguiente ejemplo.

###Ejemplo

`plot "joviansatellites.txt" using (quad($2)):(cube($3)) with lines`

##Hands-on 2

###Expresiones Regulares

####Punto 1

La expresión regular: `^.... ` : representa cuatro caracteres cualesquiera al inicio de una línea.

####Punto 2

Utilizar expresiones regulares para limpiar la página http://en.wikipedia.org/wiki/Timeline_of_modern_history.

`^((?!.\d\d\d\d :*).)*$` reemplazarlo por emptystring

`\n\n+` reemplazarlo por emptystring

`^\n` por emptystring.

`  +` por emptystring

####Punto 3

+ Descargué la página con los 10 millones de decimales de PI y la guardé en rawPI.txt con `curl http://pi.karmona.com/ > rawPI.txt`
+ Extraje el número de la página y lo guardé en PIlimpio.txt con `grep 3.14159  rawPI.txt | sed 's/<[^0-9]*>//g' | sed -E 's/^[^3]*3\.14159/3.14159/' | sed -E 's/[^0-9][^0-9][^0-9]+$//g' > piLimpio.txt`. No es la forma más corta, pero sí se asegura relativamente bien de que no va a ser dependiente del título y posible pie de página y que no va a borrar parte de los números al borrar etiquetas HTML
+ Con `sed -E 's/(.{20})/\1\n/g' piLimpio.txt > piSeparadadoLineas.txt` hice un archivo con los dígitos de PI separados en líneas de 20 caracteres. (Incluye el 3.)
+ Con `pcregrep -M '3176795' piSeparadadoLineas.txt` determiné que los primeros 7 dígitos, pero nada más grande, de mi número de teléfono se encuentran dentro de los primeros 10 millones dígitos de Pi.


#Cuarta Clase 03-Jun-2015

##Gnuplot, 
###Hacer scatter plot con fechas.

Un ejemplo con `w3m`, donde se extrae una tabla con fechas como variable independiente para graficarla luego en `gnuplot`:

`w3m http://www.exchange-rates.org/history/COP/USD/T | grep "USD COP rate for" | sed 's/COP*//g' | sed 's/ USD.*//g' | sed 's/[a-zA-Z]*//g' | sed 's/  */,/g' | sed 's/, *$//g'`

Luego, en `gnuplot`

`set datafile separator ","`

Falla `plot 'dollar.csv' using 1:2`, entonces:

`set xdata time`
`set timefmt "%d/%m/%Y"`

Ahora sí:

`gnuplot 'dollar.csv' using 1:2 with lines`

grafica correctamente valor del dolar en pesos colombianos vs fecha.

###Regresión

Se puede hacer regresión a una función cualquiera. `gnuplot` hace la regresión y guarda los valores necesarios en las variables que se le indiquen. En el ejemplo, se hace una regresión lineal.

```
y(x) = m*x + b
fit y(x) 'galaxies.csv' using 1:2  via m, b
replot m*x + b
```
El `replot` permite hacer una nueva gráfica sobre una ya abierta. Aquí se utilizó porque primero se hizo el scatterplot de los datos, así que con el `replot` se dibujó el resultado de la regresión lineal sobre éste.

##Lenguaje C

Se compila con `gcc`. La opción `-o` recibe de argumento el nombre que se le quiere dar al compilado.


#Quinta Clase 05-Jun-2015

La clase se dedicó principalmente a ver un programa en C, cuyo output se utilizaba finalmente en una gráfica 3D de gnuplot (Tercer ejercicio Taller 3). Luego se hizo un breve repaso de python.

##Hands-on 3

Ejercicios de python básicos guardados en la carpeta /exercises/python. Parte de `make` y `lammps` se aplazó.


#Sexta Clase 09-Jun-2015

Se repasó el uso de librerías como *matplotlib* con ayuda del *notebook* de *iPython*, aprovechando para repasar su uso.

##Hands-on 4

###make

Su sintaxis es `make [ -f makefile ] [ options ] ... [ targets ] ...`

Resumen breve de su funcionalidad: Es una utilidad que permite la actualización de archivos que dependen de otros cuando éstos cambien. Se utiliza generalmente para la recompilación de pequeñas piezas de código cuando partes más grandes han sido actualizadas. Para su funcionamiento se requiere de la presencia de un archivo, llamado el makefile, que describa la serie de comandos a llevar a cabo cuando se determine que hubo actualización de determinados archivos. Es posible especificar qué archivos se desea actualizar, llamados targets, (primero determinando si es necesario) especificándolo como indica la sintaxis; de lo contrario se realiza este proceso al primer target que aparece en el makefile, que suele ser uno llamado *all*.

# Séptima Clase 10-Jun-2015

## Hands-on 5

[Enunciado](https://github.com/ComputoCienciasUniandes/MetodosComputacionales/blob/master/hands_on/HandsOn-5.md)
[Solución](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase7/solucionHandsOn5.ipynb)

Algunas curvas de Lissajous:

![Curvas de Lissajous](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase7/liss.png)

# Octava Clase 12-Jun-2015

## Hands-on 6

[Enunciado](https://github.com/ComputoCienciasUniandes/MetodosComputacionales/blob/master/hands_on/HandsOn-6.md)
[Solución](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase8/solucionHandsOn6.ipynb)

# Novena Clase 16-Jun-2015

## Hands-on 7

[Enunciado](https://github.com/ComputoCienciasUniandes/MetodosComputacionales/blob/master/hands_on/HandsOn-7.md)
[Solución](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase8/solucionHandsOn7.ipynb)

# Décima Clase 17-Jun-2015

##TODO github stuff about branching, merging, tags, program to administrate all of this. Fourier series.

## Hands-on 8

[Enunciado](https://github.com/ComputoCienciasUniandes/MetodosComputacionales/blob/master/hands_on/HandsOn-8.md)
[Solución](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase8/solucionHandsOn8.ipynb)

# Onceava Clase 19-Jun-2015

##TODO Fourier transforms, image processing.

## Hands-on 9

[Enunciado](https://github.com/ComputoCienciasUniandes/MetodosComputacionales/blob/master/hands_on/HandsOn-9.md)
[Solución](https://github.com/Cohnan/MC/blob/master/ejerciciosDeClase/clase8/solucionHandsOn9.ipynb)

#Project

+ Extracción de información de alguna página web y su posterior manipulación podría ser útil en la elaboración de un proyecto dinámico.
+ Graficación de información, que se extraiga de internet, con de `gnuplot`, ojalá interactivas.
+ La graficación realizarla mejor con matplotlib. Algún tipo de animación también.
+ Quizá utilizar imágenes que puedan ser analizadas con las herramientas de matplotlib. Algo como estrellas o planetas o algo, quizá tratar de analizar una serie de imágenes para analizar la trayectoria, y poder simular el futuro de ésto. (Quizá sea demasiado complicado, pero lo consideraré.)

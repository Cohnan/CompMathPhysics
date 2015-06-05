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

Se estudi´o Git, plataforma que permite el almacenamiento el manejo de versiones de archivos. Se basa en la creaci´on de Repositorios, cada uno de los cuales corresponde a un proyecto diferente, al cual una o varias personas pueden aportar, con la ventaja de que para cada aporte o Commit puede guarda la informaci´on tal como est´aba antes y es posible volver a ella.

Las etapas en las que puede estar un archivo son 3: Untracked en la que el archivo no es parte del repositorio, agregado al Work Stage que indica que para la versi´on generada a partir del pr´oximo commit los cambios al archivo al momento del add ser´an parte, y Stage (creo) que indica que todos los cambios en el archivo son parte ya del repositorio.

Vimos la integraci´on de Git con github.com. All´i los repositorios son almacenados junto con toda la informaci´on de los commits hechos a ´el, de modo que es posible descargar o Clonar el repositorio a la m´aquina local, hacer los commits deseados y cuando se desee, actualizar la informaci´on en github para igualar a la local.

Los comandos ´utiles vistos son:
+ ˋgit add ARCHIVOS...ˋ para cambiar de untracked a staged en el workarea
+ ˋgit commitˋ para hacer el commit de todos los cambios agregados. Abre el editor de texto predeterminado para hacer comentarios sobre el commit. Permite la opci´on ˋ-mˋ que recibe de argumento el comentario.
+ ˋgit push origin masterˋ para subir los cambios del repositorio a github.
+ ˋgit pull origin masterˋ para descargar los cambios del reposiorio a la carpeta local del mismo.
+ ˋgit cloneˋ para clonar un repositorio a la m´aquina local.
+ ˋgit config ˋ para cambiar el usuariode github con el que se suben los cambios.
+ ˋgit config ˋ para cambiar la contraseña del usuario anterior.
+ ˋgit config ˋ para cambiar el editor que abre git.

Se estudió brevemente `ssh` (Secure Shell). Vimos que a grandes rasgos ssh sirve para conectarse remotamente a un host para el cual tenemos un login y contraseña. Por ejemplo `ssh sc.puerto10@compufi3.uniandes.edu.co` me conecta al computador 3 de compufísica con el usuario *sc.puerto10*. (El usuario es opcional al momento de iniciar la conexión)

También se estudió brevemente `sftp` (Secure File Transfer Protocol), el cual nos permite hacer transferencia segura de archivos de un host, para el cual tenemos usuario y contraseña, a la máquina local. La sintaxis vista era idéntica a la de `ssh`. Habiéndonos conectado al host, por medio del shell navegamos y con el comando `get` (que recibe de arguentos los archivos a transferir y como último argumento el pathname local a la cual se quiere transferir) se realiza la transferencia de archivos. 

Tanto para `ssh` como para `sftp` podemos apagar la conexión con el comando `exit`.

Vimos una línea de comando que utilizaba los comandos `grep`, `wget`, `awk`, `sed`, `curl`, `figlet`, pipelines, entre otras cosas, para extraer, y en ese caso, imprimir la hora dada por una página de internet que era obtenida de un reloj atómico.


#Segunda Clase 29-May-2015

Accedimos remótamente al [*Fuerte Super Dimensional*](http://sdf.org "*Super Dimensional Fortress*") por medio de `ssh` (cuyo hostname es sdf.org). Creamos usuario y contraseña como se indicaba. Estando ya conectados provamos algunos comandos, entre ellos unos juegos y un chat.

En el directorio *ejerciciosDeClase* subdirectorio *clase2* agregé un archivo llamado archivo.txt, hice commit, lo eliminé y volví a hacer commit. Luego con `git log` busqué el *hash* del primer commit y con `git checkout` recuperé mi archivo (puesto que esto restaura la información a la versión anterior de mi repositorio).
Extraje el archivo indicado en el hands-on con `tar -xvf archivo` (la opción `-x` es para extraer, `-v` para mostrar en display el proceso, `-f` para indicar el archivo) y con `git log | less` y luego con ayuda de `G` (para ir al final) busqué el segundo commit hecho. Encontré que la fecha era *Sat Jan 5 23:05:56 2013 -0500*. Además encontré que ese commit fue el add del *syllabus.tex* donde dice que el tema de la Semana 15 es Métodos de inferencia bayesiana y SQL.

#Tercera Clase 02-Jun-2015

##Expresiones Regulares

+ Escape de caracteres especiales con slash (para ser entendidos literalmente)

Patroń | Significado
 --- | ---
 `^` | Inicio de línea
 `$` | 
 `.` | 
 `*` | 
 `(a|b)` | 
 `\(` | 
 `\[ayc\]` | 
 `\[^abc]` | 
 `\\d` | 
 `\\D` | 

+ Análisis de los datos de [Datos satélites Júpiter](http://nssdc.gsfc.nasa.gov/planetary/factsheet/joviansatfact.html)

*NOTA*: Expresión mágica para que regexps funcionen end `sed`

##GNU Plot

Se abre con `gnuplot`.

Para que las gráficas se muestren en la terminal `set term dumb`
Para especificar rango en paréntesis cuadrados y separado por : antes de la función.

(type set to 'aqua' para resize la pantalla (creo))

Ejemplos: 
+ x
+ sin(x)

`set title "titulo"` ( o xlabel, ylabel, grid, size ratio 1) para que aparezca en las gráficas de ahora en adelante.

Variable por defecto es *x*.

`set size` para el tamaño de los ejes. `set size ratio 1` para que el ratio de los ejes seas igual (así un círculo se muestar correctamente)

###Gráfica Paramétrica

`set parametric` que además cambia la variable a t.

`unset parametric` para quitar esta configuración

`plot fun1,fun2`

###Superficies

`splot fun(x,y)` 

Ejemplo: `splot x**2 + y**2`

###GNU con archivos

`set datafile separator ","` para que la coma seas el separador.

`plot "joviansatellites.csv" using 2:3` para que use los campos 2 y 3 para *x* y *y* respectivamente.

Opciones adicionales `... with lines`, `... with circles` (linecup)

###Scripts con gnuplot

Para poder alimentar a gnuplot de los comandos, se utiliza el `<< EOF` al lado de gnuplot y el fin de los comandos a gnuplot se representa con `EOF` otra vez. (No tiene que ser EOF, puede ser cualquier palabra I THINK)

###Funciones

La forma intuitiva: `nomFun(x) = x**2`

Se le puede aplicar funciones a las columnas del using

###Ejemplo

`plot "joviansatellites.txt" using (quad($2)):(cube($3)) with lines`

##Hands-on

###Expresiones Regulares

####Punto 1

La expresión regular: `^.... ` : representa cuatro caracteres cualesquiera al inicio de una línea.

####Punto 2

'^((?!.\d\d\d\d :*).)*$' reemplazarlo por emptystring

'\n\n+' reemplazarlo por emptystring

'^\n' por emptystring.

'  +' por emptystring


#Cuarta Clase 03-Jun-2015

Hacer scatter plot con fechas.

`w3m http://www.exchange-rates.org/history/COP/USD/T | grep "USD COP rate for" | sed 's/COP*//g' | sed 's/ USD.*//g' | sed 's/[a-zA-Z]*//g' | sed 's/  */,/g' | sed 's/, *$//g'`

set datafile separator ","

fallido 'plot `dollar.csv' using 1:`
entonces
set xdata time
set timefmt "%d/%m/%Y"
ahora asi
`gnuplot 'dollar.csv' using 1:2 with lines'

##Regresión

y(x) = m*x + b
fit y(x) 'galaxies.csv' using 1:2  via m, b
replot m*x + b

##Lenguaje C

Se compila con `gcc`. La opción `-o` recibe de argumento el nombre que se le quiere dar al compilado.



#Project

+ Extracción de información de alguna página web y su posterior manipulación podría ser útil en la elaboración de un proyecto dinámico.  +

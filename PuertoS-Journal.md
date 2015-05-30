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


Se estudió brevemente `ssh` (Secure Shell). Vimos que a grandes rasgos ssh sirve para conectarse remotamente a un host para el cual tenemos un login y contraseña. Por ejemplo `ssh sc.puerto10@compufi3.uniandes.edu.co` me conecta al computador 3 de compufísica con el usuario *sc.puerto10*. (El usuario es opcional al momento de iniciar la conexión)

También se estudió brevemente `sftp` (Secure File Transfer Protocol), el cual nos permite hacer transferencia segura de archivos de un host, para el cual tenemos usuario y contraseña, a la máquina local. La sintaxis vista era idéntica a la de `ssh`. Habiéndonos conectado al host, por medio del shell navegamos y con el comando `get` (que recibe de arguentos los archivos a transferir y como último argumento el pathname local a la cual se quiere transferir) se realiza la transferencia de archivos. 

Tanto para `ssh` como para `sftp` podemos apagar la conexión con el comando `exit`.

Vimos una línea de comando que utilizaba los comandos `grep`, `wget`, `awk`, `sed`, `curl`, `figlet`, pipelines, entre otras cosas, para extraer, y en ese caso, imprimir la hora dada por una página de internet que era obtenida de un reloj atómico.


#Segunda Clase 29-May-2015

Accedimos remótamente al [*Fuerte Super Dimensional*](http://sdf.org "*Super Dimensional Fortress*") por medio de `ssh` (cuyo hostname es sdf.org). Creamos usuario y contraseña como se indicaba. Estando ya conectados provamos algunos comandos, entre ellos unos juegos y un chat.

En el directorio *ejerciciosDeClase* subdirectorio *clase2* agregé un archivo llamado archivo.txt, hice commit, lo eliminé y volví a hacer commit. Luego con `git log` busqué el *hash* del primer commit y con `git checkout` recuperé mi archivo (puesto que esto restaura la información a la versión anterior de mi repositorio).
Extraje el archivo indicado en el hands-on con `tar -xvf archivo` (la opción `-x` es para extraer, `-v` para mostrar en display el proceso, `-f` para indicar el archivo) y con `git log | less` y luego con ayuda de `G` (para ir al final) busqué el segundo commit hecho. Encontré que la fecha era *Sat Jan 5 23:05:56 2013 -0500*. Además encontré que ese commit fue el add del *syllabus.tex* donde dice que el tema de la Semana 15 es Métodos de inferencia bayesiana y SQL.

#Project

+ Extracción de información de alguna página web y su posterior manipulación podría ser útil en la elaboración de un proyecto dinámico.

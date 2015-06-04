#!/bin/bash
# Programa que recibe como un parámetro un año (a partir de 1500) (tiene como default 1996), del cual obtiene un evento histórico obtenido del archivo dado e imprime una tabla con a lo sumo 5 filas con orientación e identificación de estrellas cuya luz sea contemporánea a los eventos (resécto al año 2015).
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 1 Punto 3

# Define el separador decimal a . (con scope este script y sus subprocesos)
export LC_NUMERIC="en_US.UTF-8"

# Definición de variables
# width: toma como ancho un medio del ancho de la ventana de la terminal
# separador: guarda el character que define las líneas de separación que se imprimen
# year: para evitar conflicto con el awk posteriormente, se guarda el año que se recibe como parámetro aquí. Si no argumento dado, toma como valor 1996.
# cell: tamaño de la celda de la tabla
width=$(($(tput cols) / 2))
separador="#"
year=${1:-1996}
cell=$((width / 3))

# Generación de línea de separación de texto que se imprime.
lineaSep=$separador

while ((${#lineaSep} < $width))
do
	lineaSep="$lineaSep$lineaSep$lineaSep"
done

lineaSep=${lineaSep:0:$width}

## Impresión de texto con formato dado en el enunciado.
# Impresión de el año con figlet, y sección correspondiente al evento histórico.
echo $lineaSep
figlet $year
# El awk filtra la columna correspondiente al año.
echo "$(awk 'BEGIN {FS="\t"};{if ($1 == $year) print $2}' worldhistory.tsv)"
echo $lineaSep

# Impresión de sección correspondiente a las estrellas.
echo "LOOK AT THE FOLLOWING STARS:"
printf "%-${cell}s%-${cell}s%-${cell}s\n" "RA/°" "DEC/°" "HIP No."

# Guarda el valor previo para el IFS (que determina el word splitting que sucede durante la expansión de argumentos).
# Aunque no es necesario guardar el valor previo para el archivo tal y como está (puesto que su scope es sólo este script), preferí hacerlo en caso de luego querer extender el archivo para no tener problemas luego con el word splitting
oldIFS="$IFS"

# Imprime con un buen formato los datos de orientación e identificación de a lo sumo 5 estrellas cuya luz sea contemporánea (su distancia en años luz es la diferencia entre este año a los eventos históricos.
printf "%-${cell}.2f%-${cell}.2f%-${cell}d\n" $(awk 'BEGIN {FS=","; i=0};{if (i < 5 && (2015-$year) <= $10 && $10 <= (2015-$year + 1)) {print $8,$9,$2; i++}}' hyg.csv)

# Restauración del valor
IFS="$oldIFS"


### Cambios que se pueden hacer
# Con una variable que guarde el año actual, que se puede obtener con `date +%Y` y luego se guarda con sustitución de comando, se puede volver el programa válido sin importar cuándo se ejecute (con lo que respecta al año)
# Similar a como hice con el punto uno con arrays, no debe ser complicado ajustar el programa para que manipule más de 1 año que se reciba como argumento.

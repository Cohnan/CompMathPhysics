#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. La información necesaria siempre va a estar en el momento adecuado en el archivo [lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

###Solución

```bash
#!/bin/bash

wget -q 'https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv' #lottery.sh

read fecha < lottery.csv
echo $fecha
awk -F, '{if ($1 == 201318518) print $2}' < lottery.csv

rm lottery.csv
```

## Expresiones Regulares

1. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

	* eliminar todos los puntos,

	* cambiar por puntos todas las comas que estén seguidas de algún dígito,

	* cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,

	* eliminar todos los paréntesis derechos,

	* y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.

	* Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.

###Solución
```bash
sed 's/\.//g' pgn.dat | sed -E 's/,([0-9])/.\1/g' | sed -E 's/ ([0-9]|\()/\t\1/g' | sed 's/)//g' | sed 's/(/-/g' > pgn.tsv

head -29 pgn.tsv | sort --field-separator=$'\t' -k 6,6 | head -1 | cut -f 1
```

## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.

```bash
# Se elimina manualmente las palabras Lesser Satellites. La serie de seds elimina espacios al inicio de línea, comas de miles, R's de rotación retrógrada, 2 o más newlines, y separa en tabs. Guarda esto en un archivo para que gnuplot lo pueda leer.
#!/bin/bash
sed -E 's/^ +//g' saturnoSatelites | sed -E 's/([0-9]),/\1/g' | sed -E 's/([0-9])R/\1/g' | sed ':a;N;$!ba;s/\n\n\n*/\n/g' | sed -E 's/  +/\t/g'> saturnoSatelitesMej.tsv

gnuplot << EOF
set datafile separator "\t"
set titulo "Satelites de Saturno: 3a ley de Kepler"
set xlabel "Cuadrado del Tiempo de Orbita"
set ylabel "Cubo del Semieje Mayor"
cuad(x) = x**2
cubo(x) = x**3
plot "saturnoSatelitesMej.tsv" using (cuad($4)):(cubo($2)) with lines
EOF
```

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**

#!/bin/bash
# Programa que lee el archivo kepler.csv para: Obtener el número de planetas catalogados, los planetas con una masa menor a 1/100 de la masa de Júpiter, y el nombre del planeta con menor periodo orbital alrededor de su estrella.
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 1 Punto 2

## Ya que no estoy seguro de que la carpeta para archivos temporales sea la misma en diferentes sistemas operativos, los archivos temporales son creados en la carpeta donde se guarda el script y removidos posteriormente.

## Imprimir la cantidad de planetas en el catálogo
echo

curl -s "https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/kepler.csv" > .keplercsv

# Remueve el encabezado del archivo y lo guarda para su manipulación posterior en el resto del programa.
awk 'BEGIN {FS = ","};{if ($1 != "NAME"&& $2 != "MSINI")  print $0}' .keplercsv > .keplerSinHeadcsv

rm .keplercsv

# Imprime el número de planetas catalogados.
# La Sustitución de Comandos es para evitar que se imprima también el nombre del archivo.
echo "El número de planetas en el catálogo es:" $(wc -l < .keplerSinHeadcsv)

echo

# Guarda los nombre de los planetas con masa registada menor a 1/100 de la masa de Júpiter.
awk 'BEGIN {FS = ","};{if ($2 != "" && $2 < 0.01)  print $1}' .keplerSinHeadcsv > .keplerMasaPequenacsv

# Impresión de el número y los nombre de los planetas mencionados en el comentario anterior.
# Sustitución de comandos para evitar impresión nombre del archivo
# cat para imprimir en stdout el archivo
printf "Los planetas con masa menor a 1/100 de la masa de Jupiter son %d. " $(wc -l < .keplerMasaPequenacsv)
printf "Y estos son:\n"
cat .keplerMasaPequenacsv

rm .keplerMasaPequenacsv

echo

# Imprime el nombre del planeta con menor periodo orbital alrededor de su estrella.
# Hace uso de sort para ordenar los datos de menor a mayor respecto a la columna con el periodo, head para extraer la primera línea, y cut para simplemente imprimir el campo del nombre
echo "El nombre del planeta con el menor periodo orbital es:" $(sort --field-separator="," --key=6 -n .keplerSinHeadcsv | head -1 | cut --delimiter="," -f 1)

rm .keplerSinHeadcsv

echo

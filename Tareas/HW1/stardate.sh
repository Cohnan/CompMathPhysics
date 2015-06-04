#!/bin/bash
# 
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 1 Punto 3

export LC_NUMERIC="en_US.UTF-8"

width=$(($(tput cols) / 2))
separador="#"
year=${1:-1996}
cell=$((width / 3))

lineaSep=$separador

while ((${#lineaSep} < $width))
do
	lineaSep="$lineaSep$lineaSep$lineaSep"
done

lineaSep=${lineaSep:0:$width}

echo $lineaSep
figlet $year
echo "$(awk 'BEGIN {FS="\t"};{if ($1 == $year) print $2}' worldhistory.tsv)"
echo $lineaSep

echo "LOOK AT THE FOLLOWING STARS:"
printf "%-${cell}s%-${cell}s%-${cell}s\n" "RA/°" "DEC/°" "HIP No."

oldIFS="$IFS"

printf "%-${cell}.2f%-${cell}.2f%-${cell}d\n" $(awk 'BEGIN {FS=","; i=0};{if (i < 5 && (2015-$year) <= $10 && $10 <= (2015-$year + 1)) {print $8,$9,$2; i++}}' hyg.csv)

IFS="$oldIFS"

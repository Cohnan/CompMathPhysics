#!/bin/bash
# 
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 1 Punto 3

export LC_NUMERIC="en_US.UTF-8"

width=40
separador="="
year=${1:-1983}

echo $year

lineaSep=$separador

while ((${#lineaSep} < $width))
do
	lineaSep="$lineaSep$lineaSep$lineaSep"
done

echo $lineaSep
figlet $year
echo -e "$(awk 'BEGIN {FS="\t"};{if ($1 == $year) print $2}' worldhistory.tsv)"
echo $lineaSep

echo "LOOK AT THE FOLLOWING STARS:"
printf "%-8s%-8s%-8s\n" "RA/°" "DEC/°" "HIP No."
oldIFS="$IFS"

printf "%-8.2f%-8.2f%-8d\n" $(awk 'BEGIN {FS=","; i=0};{if (i < 5 && 32 <= $10 && $10 <= 33) {print $8,$9,$2; i++}}' hyg.csv)

IFS="$oldIFS"

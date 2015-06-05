#!/bin/bash

sed -E 's/^ +//g' saturnoSatelites.csv | sed -E 's/([0-9]),/\1/g' | sed -E 's/([0-9])R/\1/g' | sed ':a;N;$!ba;s/\n\n\n*/\n/g' | sed -E 's/  +/\t/g'> saturnoSatelitesMej.tsv

gnuplot << EOF 
set datafile separator "\t"
set title "Satelites de Saturno: 3a ley de Kepler"
set xlabel "Cuadrado del Tiempo de Orbita"
set ylabel "Cubo del Semieje Mayor"
cuad(x) = x**2
cubo(x) = x**3
plot "saturnoSatelitesMej.tsv" using (cuad(\$4)):(cubo(\$2))
y(x)=m*x + b
fit y(x) "saturnoSatelitesMej.tsv" using (cuad($4)):(cubo($2)) via m, b
replot m*x + b
EOF


#!/bin/bash
gcc -std=c99 -o punto3.out punto3.c -lm
./punto3.out > sphericalrands.csv

gnuplot << EOF
	set datafile separator ","
	set view equal xyz
	splot "sphericalrands.csv" using 1:2:3
EOF

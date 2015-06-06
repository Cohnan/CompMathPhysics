#!/bin/bash

./punto3.out > sphericalrands.csv

gnuplot << EOF
	set datafile separator ","
	set view equal xyz
	splot "sphericalrands.csv" using 1:2:3
EOF

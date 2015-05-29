#!/bin/bash
# Punto 2 Taller 1 Métodos Computacionales
# 2015-19
# Sebastián Puerto

echo
echo Número, Cuadrado > punto2.csv
for i in {1..1000}
do
	((n = i))
	((m = i*i))
	echo "$n, $m" >> punto2.csv
done

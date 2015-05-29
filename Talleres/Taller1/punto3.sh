#!/bin/bash
# Punto 2 Taller 1 Metodos Computacionales
# 2015-19
# Sebastian Puerto

echo
cat punto2.csv | awk 'BEGIN {FS = ","};{print $1 + $2}'

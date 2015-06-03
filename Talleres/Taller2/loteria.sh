#!/bin/bash

wget -q 'https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv' #lottery.sh

read fecha < lottery.csv
echo $fecha
awk -F, '{if ($1 == 201318518) print $2}' < lottery.csv

rm lottery.csv

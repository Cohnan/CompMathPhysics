#!/bin/bash

destino='/home/sc.puerto10/gitReps/MC/Experimentos/Exp1/generacionDatos'
desde='/home/sc.puerto10/Descargas/artmdsim2/src'

for i in {1..20}
do
	mkdir datos$i
	awk 'NR == 7 {print "int randSeedP = '$i'\;"}; NR != 7 {print}' $desde/in_rand.c > $desde/.tmpRand
	less $desde/.tmpRand > $desde/in_rand.c

	gcc -O -o $destino/pr_02_1 $desde/pr_02_1.c -lm
	
	./pr_02_1 < pr_02_1.in > ../datos/Rayleigh$i.csv
	mv pr_02_1 datos$i
done

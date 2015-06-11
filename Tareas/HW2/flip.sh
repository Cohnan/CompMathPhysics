#!/bin/bash
# Programa que recibe intercambia las letras (CASE SENSITIVE) recibidas como los 2 primeros parámetros, en el archivo que se recibe como 3er parámetro
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 3-1

cont="$(less $3)"				#Contenido del archivo
res=					#Variable que almacenará el resultado final luego del intercambio

# FOR para evaluar e intercambiar las letras, una por una, en caso de ser una de las dichas
for i in $(seq 0 $((${#cont} - 1)))
do
	letraAct=${cont:$i:1}		#Letra analizando
	letraPro=			#Para la letra que se concatenará luego del procesamiento de la actual.

	if [[ $letraAct = $1 ]]
	then
		letraPro=$2
	elif [[ $letraAct = $2 ]]
	then
		letraPro=$1
	else
		letraPro=$letraAct
	fi

	res=$res$letraPro		#Concatenación de la letra procesada al resultado
	
done

# Impresión al stdout el resultado
echo $res

# Esto se puede hacer perfectamente sin recurrir a variables, con sólo cut y >>

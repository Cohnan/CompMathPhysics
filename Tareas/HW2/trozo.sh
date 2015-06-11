#!/bin/bash
# Programa que recibe como argumentos una posición inicial, una final y un archivo de texto (newline cuenta y se imprime como espacio), del cual se extrae e imprime el trozo de texto que está entre esas posiciones (empezando en 1; incluyendo ambos extremos).
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 3-2

#Salir con error si posiciones inválidas
if (($2 < $1))
then
	echo "Error con el orden de las posiciones"
	exit 1
fi

longitud=$(($2 - $1 + 1))			# Longitud del trozo a extraer.

# Almacenamiento del texto en una variable.
printf -v texto "$(less $3)"			

# Salir con error si no es posible extraer el trozo
if ((${#texto} < $1)) || ((${#texto} < $2)) || ((${#texto} < $longitud))
then
	echo "No existe tal trozo"
	exit 2
fi

# Extracción e impresión del trozo.
echo ${texto:$(($1 - 1)):$longitud}

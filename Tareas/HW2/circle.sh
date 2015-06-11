#!/bin/bash
# Programa que recibe como argumento un número asumido 0 y 1 que será tomado como el radio para un círculo que se dibujará en pantalla en un cuadro de lado 2 con centro el origen.
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 1-1

# Cuadra el tamaño del cuadrado de acuerdo al número de columnas y filas de la terminal actual.
tamano=$(if test $(tput lines) -le $(tput cols)
	then
		echo $(tput lines)
	else
		echo $(tput cols)
	fi
	)

radio=$1

gnuplot << EOF
set term dumb size $((tamano * 2)),$tamano	#El ajuste ya que, al menos aproximadamente, el alto de un caracter en la terminal es el doble de su ancho.
set size .95,1					#Con el .95 se corrige un poco el problema del ratio actual entre alto y ancho
set parametric
set xrange [-1:1]
set yrange [-1:1]
unset tics				#lineas de escala
unset border				#borde
unset key				#cuadro de convenciones
plot ($radio*sin(t)),($radio*cos(t))
EOF

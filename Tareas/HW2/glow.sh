#!/bin/bash
# Programa que muestra círculos con radios dados por un coseno cuadrado dependiente del tiempo, haciendo uso del script circle.sh
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 1-2

#Asegurarse de que sea ejecutable este script
chmod +x circle.sh

#Parámetros iniciales
omega=.2
t=0

#Loop que limpia la pantalla, calcula el radio y ejecuta circle.sh para mostrar el círculo.
#Con la configuración dada para tiempo, omega y sleep, el tiempo t está dado en decisegundos, y el omega es 2 radianes por segundo.
while true
do
	clear
	radio=$(gnuplot << EOF
set print "-"				#Para que el resultado lo imprima en el stdout
print cos($omega*$t)**2
EOF
)
	./circle.sh $radio
	t=$((t + 1))
	sleep .1
done

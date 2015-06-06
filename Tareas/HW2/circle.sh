tamano=$(if test $(tput lines) -le $(tput cols)
	then
		echo $(tput lines)
	else
		echo $(tput cols)
	fi
	)

radio=$1

gnuplot << EOF
set term dumb size $((tamano * 2)),$tamano
set size .95,1
set parametric
set xrange [-1:1]
set yrange [-1:1]
unset tics				#lineas de escala
unset border				#borde
unset key				#cuadro de convenciones
plot ($radio*sin(t)),($radio*cos(t))
EOF



# buscar para cambiar colores
# buscar ratio entre alto y ancho de un caracter (no parece ser exactamente 2)

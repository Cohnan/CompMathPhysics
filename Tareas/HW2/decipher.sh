#!/bin/bash
# Programa que recibe como argumentos frases para ser buscadas en la página de arXiv en el tema específicado(physics en este caso). Las mayúsculas no son relevantes para la búsqueda, pero espacios sí"
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 3-4

#Implementación de fuerza bruta de la desencriptación.

barridos=10			#Número de barridos con los que se encriptó
chmod +x flip.sh		#Hacer de flip.sh un ejecutable

function flip {			#Función para hallar la letra de la cual proviene el caracter argumento
	case $1 in
	i) echo a ;;
	n) echo b ;;
	w) echo c ;;
	l) echo d ;;
	o) echo e ;;
	q) echo f ;;
	t) echo g ;;
	k) echo h ;;
	y) echo i ;;
	c) echo j ;;
	a) echo k ;;
	j) echo l ;;
	b) echo m ;;
	m) echo n ;;
	r) echo o ;;
	d) echo p ;;
	e) echo q ;;
	x) echo r ;;
	g) echo s ;;
	f) echo t ;;
	s) echo u ;;
	z) echo v ;;
	u) echo w ;;
	p) echo x ;;
	h) echo y ;;
	v) echo z ;;
	esac
}

#Leer de stdin la información para desencriptar y guardarla temporalmente en un archivo que será modificado a lo largo del programa para contener la información original
read trozo
echo "$trozo" > .trozoModificado

#Para cada barrido, reemplaza utilizando flip.sh, empezando desde la última letra que pudo ser modificada de acuerdo a la tabla, la modificación de letras que se realizó en la encriptación por la inmediatamente anterior
for i in $(seq 1 $barridos)
do
	for lt in  v h p u z s f g x e d r m b j a c y k t q o l w n i
	do
		./flip.sh $lt $(flip $lt) .trozoModificado > .t2
		mv .t2 .trozoModificado
	done
done

# Impresión del mensaje desencriptado
cat .trozoModificado

#Eliminación del archivo temporal
rm .trozoModificado

#!/bin/bash
# Programa que recibe como argumentos frases para ser buscadas en la página de arXiv en el tema específicado(physics en este caso). Las mayúsculas no son relevantes para la búsqueda, pero espacios sí"
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 2 Punto 3-4

#Implementación mejorada.

barridos=10			#Número de barridos con los que se encriptó
chmod +x flip.sh		#Hacer de flip.sh un ejecutable

#Función con la que se hicieron los flips
function flip {			
	case $1 in
	a) echo i ;;
	b) echo n ;;
	c) echo w ;;
	d) echo l ;;
	e) echo o ;;
	f) echo q ;;
	g) echo t ;;
	h) echo k ;;
	i) echo y ;;
	j) echo c ;;
	k) echo a ;;
	l) echo j ;;
	m) echo b ;;
	n) echo m ;;
	o) echo r ;;
	p) echo d ;;
	q) echo e ;;
	r) echo x ;;
	s) echo g ;;
	t) echo f ;;
	u) echo s ;;
	v) echo z ;;
	w) echo u ;;
	x) echo p ;;
	y) echo h ;;
	z) echo v ;;
	esac
}

#Leer archivo. Primero de argumento y si no de stdin.
if [ ${1-X} = X ]
then
	read texto
	printf "$texto" > .trozoEncriptando

	if [ ! -s .trozoEncriptando ]
	then
		echo "No hay nada que leer"
		exit 1
	fi
else
	cp "$1" .trozoEncriptando
fi

#Hace, si no existe, un archivo con la información de el caracter final luego de hacer un barrido completo a todo el abecedario.
#Si ya existe, cualquier desencripción es mucho maś rápida a la realizada en la solución ingenua que subí antes.
if [ ! -e .encryptionCode ] || [[ $(wc -c < .encryptionCode) != 104 ]]
then
	> .encryptionCode

	#Archivo con el abecedario que almacenará el resultado luego del barrido
	printf "%s" {a..z} > .encryptedAlphTemp	

	#Hacer un barrido sobre este archivo
	for i in {1..26}
	do
		lt=$(printf "\\$(printf '%03o' "$((i+96))")")
		./flip.sh $lt $(flip $lt) .encryptedAlphTemp > .t2
		mv .t2 .encryptedAlphTemp
	done

	#Imprimirlo con un formato que se pueda leer luego con grep y cut
	for i in {1..26}
	do
		lt=$(printf "\\$(printf '%03o' "$((i+96))")")
		printf "%s\t%s\n" $lt $(cut -c $i .encryptedAlphTemp) >> .encryptionCode
	done
	
	rm .encryptedAlphTemp
fi

#Hacer la desencripción
for i in $(seq 1 $barridos)
do
	res=
	for j in $(seq 1 $(wc -c < .trozoEncriptando))
	do
		lt=$(cut -c $j .trozoEncriptando)

		if [[ $lt == [a-z] ]]						#Sólo hacerlo a caracteres del alfabeto en minúscula.
		then
			res=$res$(grep "$lt$" .encryptionCode | cut -f 1)	#Extrae la letra que lleva a que se haya impreso esta letra. Se puede rápidamente cambiar a encripción cambiando el patrón del grep a "^$lt" y el campo de cut a 2.
		else
			res="$res$lt"
		fi	
	done
	
	printf "$res" > .trozoEncriptando

done

# Impresión del mensaje desencriptado
cat .trozoEncriptando
echo

#Eliminación del archivo temporal
rm .trozoEncriptando

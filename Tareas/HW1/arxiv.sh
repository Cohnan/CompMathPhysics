#!/bin/bash
# Programa que recibe como argumentos frases para ser buscadas en la página de arXiv en el tema específicado(physics en este caso). Las mayúsculas no son relevantes para la búsqueda, pero espacios sí"
# Autor: Sebastián Camilo Puerto	Código: 201318518
# Materia: Métodos Computacionales
# Periodo: 2015-19
# Tarea 1 Punto 1

# Valores no directamente relevantes, que pueden ser potencialmente cambiados con banderas de opciones
width=$(tput cols)
separador='='
tema="physics"

# Generación de la página en la que se realizará la búsqueda
pagina="http://arxiv.org/list/$tema/new"

# Inicialización de arrays y valores en los que se va a almacenar información relevante.
# nFrases tendrá después del for el número de frases
# arrayFrases contiene las frases clave
# totalAciertos contiene el ńúmero de títulos que contienen cada frase clave
# titulosConAciertos almacena un string con los títulos que contienen la correspondiente frase clave según el formato específicado para su posterior impresión

nFrases=0

for frase in "$@"
do
	arrayFrases[$nFrases]="${frase,,}"
	totalAciertos[$nFrases]=0
	titulosConAciertos[$nFrases]=
	nFrases=$((nFrases+1))
done

## En vez de trabajar con archivos, trabajé con variables.

# Guarda la página en la variable cont. La sustitución de comandos asegura que todo whitespace se convierta en un espacio.
printf -v cont '%s' "$(curl -s $pagina)"

# Extrae el número de entradas en la página y la almacena en entries
paraEntries1=${cont#*total of }
entries=${paraEntries1%% *}

# Esta variable es un string con el formato con el que trabaja el siguiente for.
# El formato es simplemente el título del artículo inmediatamente al inicio del string.
contMod=${cont#*Title\:</span> }

# El for extrae título por título y estudia su contenido.
for i in $(seq 1 $entries)
do
	#Extracción del título de contMod y modificación de contMod para el formato indicado.
	titulo="$(echo ${contMod%%?</div>*})" # Command subs para eliminar doble espacio generado por nueva linea en página entre el título que interviene en la lectura de espacios
	contMod=${contMod#*Title\:</span> }
	
	# Para cada frase se estudia el título y guarda la información necesaria
	for indFrase in $(seq 0 $((nFrases - 1)))
	do
		# Guarda temporalmente en frase la frase que se desea buscar en el título
		frase="${arrayFrases[$indFrase]}"
		
		# Si la frase en el título, aumenta el número de aciertos y guarda el título, cada uno en el correspondiente array.
		if [[ ${titulo,,} =~ .*$frase.* ]]
		then
			totalAciertos[$indFrase]=$((${totalAciertos[$indFrase]} + 1))
			titulosConAciertos[$indFrase]="${titulosConAciertos[$indFrase]}\n- $titulo"
		fi

	done
done

## Fin de procesamiento. Impresión de texto

# Prepara la línea que separa los diferentes segmentos del texto
lineaSep=$separador

while ((${#lineaSep} < $width))
do
	lineaSep="$lineaSep$lineaSep$lineaSep"
done

lineaSep=${lineaSep:0:$width}

# Impresión del texto en el formato indicado en el enunciado de la tarea.
figlet -cw $width arXiv

echo "$lineaSep"
echo "Searching the arXiv for the new stuff"
echo "$pagina"
echo "$lineaSep"

#Imprime para cada frase: la frase, el número de títulos que la contienen, dichos títulos; esto en el formato indicado
for i in $(seq 0 $((nFrases - 1)))
do
	echo "key phrase:" "${arrayFrases[$i]}"
	echo "$lineaSep"
	echo  "Articles found:" ${totalAciertos[$i]}
	echo -e "${titulosConAciertos[$i]}"
	echo "$lineaSep"
done

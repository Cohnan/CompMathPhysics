/* Programa que pide al usuario un tipo de producto (numérico, válido) y la cantidad de dicho artículo, e imprime el precio que esto costaría.
* Autor: Sebastián Camilo Puerto	Código: 201318518
* Materia: Métodos Computacionales
* Periodo: 2015-19
* Tarea 2 Punto 2-6
*/
#include <stdio.h>

int main ( )
{
	//Variables.
	const float precioT1 = 3.50;
	const float precioT2 = 5.50;
	short tipo;
	int cantidad;
	double total;				//Double por el rango posible luego de la multiplicación, en caso de elegirse valores de los precios más grandes.

	//Pedir información.
	printf("Tipo del producto (1 o 2): ");
	scanf("%hd", &tipo);
	printf("Cantidad de elementos: ");
	scanf("%d", &cantidad);

	// Cálculo del precio. Se basa en el hecho de que los tipos son enteros consecutivos.
	total = precioT1 * cantidad + (tipo - 1) * (precioT2 - precioT1) * cantidad;
	
	//Imprimir información.
	printf("\nEl precio total es de: $%.2f\n", total);

	return 0;
}

// Podría utilizarse enumeradores para extender este programa de manera natural, incluyendo el cálculo del precio.

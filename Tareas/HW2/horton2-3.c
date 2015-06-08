#include <stdio.h>

int main ( )
{
	//TODO mirar las consecuencias del posterior casting si utilizo unsigned
	const float precioT1 = 3.50;
	const float precioT2 = 5.50;
	short tipo;				// Tratar de hacerlo con un enumerador
	int cantidad;
	double total;				//Por el rango posible luego de la multiplicación

	printf("Tipo del producto (1 o 2): ");
	scanf("%hd", &tipo);
	printf("Cantidad de elementos: ");
	scanf("%d", &cantidad);

	total = precioT1 * cantidad + (tipo - 1) * (precioT2 - precioT1) * cantidad;
	
	printf("\nEl precio total es de: $%.2f\n", total);
}


/* Por mejorar:
+ Asegurarse de que el tipo es uno de los 2 valores correctos
+ Asegurarse que la cantidad es positiva
*/

/* Programa que le pide al usuario una distancia en pulgadas, e imprime esta misma distancia en yardas, pies y pulgadas
* Autor: Sebastián Camilo Puerto	Código: 201318518
* Materia: Métodos Computacionales
* Periodo: 2015-19
* Tarea 2 Punto 2-4
*/
#include <stdio.h>

int main ( )
{
	// Asumiendo que no va a ser mayor en magnitud al permitido por float.
	float inches;			

	// Pedir la distancia en pulgadas
	printf("Distancia en pulgadas: ");
	scanf("%f", &inches);
	
	// Imprimir la conversión. Dentro del mismo printf puesto que son operaciones sencillas cuyo resultado no serán usados posteriormente.
	printf("\nLa distancia entonces en:\n\
			Yardas es    %.3f,\n\
			Pies es	     %.3f,\n\
			Pulgadas es  %.3f.\n", inches/36, inches/12, inches);

	return 0;
}

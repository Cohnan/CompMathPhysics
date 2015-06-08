#include <stdio.h>

int main ( )
{
	// Asumiendo que no va a ser mayor en magnitud a TODO
	float inches;			

	printf("Distancia en pulgadas: ");
	scanf("%f", &inches);
	
	printf("\nLa distancia entonces en:\n\
			Yardas es    %.3f,\n\
			Pies es	     %.3f,\n\
			Pulgadas es  %.3f.\n", inches/36, inches/12, inches);
}

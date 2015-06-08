#include <stdio.h>

int main ( )
{
	// Asumiendo que no va a ser mayor en magnitud a TODO
	float largoFt, anchoIn, areaYd;

	printf("Largo del salón en Pies: ");
	scanf("%f", &largoFt);
	printf("Ancho del salón en Pulgadas: ");
	scanf("%f", &anchoIn);

	areaYd = (largoFt/3) * (anchoIn/36);
	
	printf("\nEl área en Yardas es entonces: %.3f\n", areaYd);
}

/* Programa que pide al usuario un largo en pies y un ancho en pulgadas, e imprime el área en yardas de un rectángulo con dichas dimensiones.
* Autor: Sebastián Camilo Puerto	Código: 201318518
* Materia: Métodos Computacionales
* Periodo: 2015-19
* Tarea 2 Punto 2-5
*/
#include <stdio.h>

int main ( )
{
	// Variables. Asumiendo que los valores ingresados no van a ser mayores en magnitud a los permitidos por float.
	float largoFt, anchoIn;
	double areaYd;				//Por si se da un caso extremo de valores de valores, la multiplicación de ellos puede ser de una magnitud que requiera de un double.
	
	// Pedir información.
	printf("Largo del salón en Pies: ");
	scanf("%f", &largoFt);
	printf("Ancho del salón en Pulgadas: ");
	scanf("%f", &anchoIn);

	// Calculo del ára con conversión implícita.
	areaYd = (largoFt/3) * (anchoIn/36);
	
	// Impresión de información.
	printf("\nEl área en Yardas es entonces: %.2f\n", areaYd);

	return 0;
}

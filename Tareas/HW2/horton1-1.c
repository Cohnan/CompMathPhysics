/* Programa que imprime mi nombre y dirección con printf's diferentes para cada una.
* Autor: Sebastián Camilo Puerto	Código: 201318518
* Materia: Métodos Computacionales
* Periodo: 2015-19
* Tarea 2 Punto 2-1#include <stdio.h>
*/
#include <stdio.h>

int main ( )
{
	// Variables con la información a imprimir.
	char name[]  = "Sebastian Camilo Puerto Galindo";
	char address[] = "Cra 29B #0-20, Santa Isabel";

	//Impresión de la información.
	printf("Mi nombre es: %s\n", name);
	printf("Mi direción es: %s\n", address);
	
	return 0;
}

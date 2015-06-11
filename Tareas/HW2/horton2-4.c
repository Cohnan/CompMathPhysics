/* Programa que pide al usuario su el número de horas trabajadas a la semana, junto con el salario total e imprime el pago por hora en el formato indicado.
* Autor: Sebastián Camilo Puerto	Código: 201318518
* Materia: Métodos Computacionales
* Periodo: 2015-19
* Tarea 2 Punto 2-7
*/
#include <stdio.h>

int main ( )
{
	//Variables.
	float weeklyPay;
	float hoursWorked;
	float average;
	short avgDollars, avgCents;

	//Pedir información.
	printf("Weekly pay in dollars: ");
	scanf("%f", &weeklyPay);
	printf("Hours worked in the week: ");
	scanf("%f", &hoursWorked);
	
	//Cálculo de los valores a imprimir, ayudándose del average preciso.
	average = weeklyPay / hoursWorked;
	avgDollars = (short) average;
	avgCents = (short) (100 * (average - avgDollars) + 0.5);		//Sumar 0.5 permite que el casting del short aproxime, bajo las reglas tradicionales, los centavos.

	//Imprimir información.
	printf("\nYour average hourly pay rate is %hd dollars and %hd cents.\n", avgDollars, avgCents);

	return 0;
}


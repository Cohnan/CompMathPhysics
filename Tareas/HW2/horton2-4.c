#include <stdio.h>

int main ( )
{
	//TODO mirar las consecuencias del posterior casting si utilizo unsigned
	float weeklyPay;
	float hoursWorked;
	float average;
	short avgDollars, avgCents;

	printf("Weekly pay in dollars: ");
	scanf("%f", &weeklyPay);
	printf("Hours worked in the week: ");
	scanf("%f", &hoursWorked);
	
	average = weeklyPay / hoursWorked;
	avgDollars = (short) average;
	avgCents = (short) (100 * (average - avgDollars) + 0.5);

	printf("\nYour average hourly pay rate is %hd dollars and %hd cents.\n", avgDollars, avgCents);
}


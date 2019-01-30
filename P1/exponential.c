/*
Author: Miguel de Carvalho
Date: 29/11/2018
*/

#include <stdio.h>
#include <math.h>

int main()
{
    double base, exponent, result;

    printf("Enter a base number: ");
    scanf("%lf", &base);

    printf("Enter an exponent: ");
    scanf("%lf", &exponent);

    // calculates the power
    result = pow(base, exponent);

    printf("%f", result);

    return 0;
}

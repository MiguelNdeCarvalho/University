#include <stdio.h>

/*
This program is going to calculate how many root does the polinomial function have
*/


int main()
{
    int a, b, c, aux;
    aux = b^2-4*a*c;
    printf("You will need to insert the polynomial function with this format. ax^2+bx+c \n");
    printf("Insert the a \n");
    scanf("%d", &a);
    printf ("%d", a);
    printf("Insert the b \n");
    scanf("%d", &b);
    printf ("%d", b);
    printf("Insert the c \n");
    scanf("%d", &c);
    if (aux<0)
    {
    printf("It doesn't have roots");
    }
    else if (aux==0)
    {
    printf ("It has one root");
    }
    else if (aux>0)
    {
    printf("It has 2 roots")
    }
}

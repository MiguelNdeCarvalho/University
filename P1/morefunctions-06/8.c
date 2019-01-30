#include <stdio.h>
#include <math.h>

/*
This program is going to say if the number is equal to the sum of his cubs. For example 153 = 13^3 + 53^3 + 33^3
*/

int cube (int numb)
{
    int a1, a2, a3, aux,sum;
    a1=numb/100;
    //printf("%d\n", a1); \\debug purposes only
    aux=numb%100;
    //printf("%d\n", aux); \\debug purposes only
    a2=aux/10;
    //printf("%d\n", a2); \\debug purposes only
    a3=aux%10;
    //printf("%d\n", a3); \\debug purposes only
    sum= pow(a1,3)+pow(a2,3)+pow(a3,3);
    //printf("%d\n", sum); \\debug purposes only
    if (sum == numb)
    {
        printf("The number is equal the sum of his cubes");
    }
    else
    {
        printf("The number is not equal the sum of his cubes");
    }
}


int main()
{
    int numb;
    printf ("Enter the desired number\n");
    scanf ("%d", &numb);
    cube (numb);
}

/*
This program is going to do the factorial in the normal way
*/

#include <stdio.h>


int fac_iterative (int n){
    int fac=1;
    while(n >0)
    {
        fac=fac*n;
        n--;
        printf("%d\n", fac);
    }
    return fac;
}

int main()
{
    int n;
    printf("Insert the desired number to calculate the factorial:\n");
    scanf("%d",&n);
    fac_iterative(n);
    return 0;
}

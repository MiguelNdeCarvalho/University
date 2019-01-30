/*
This program is going to use the fibondacci function
*/

#include <stdio.h>


int fib(int n)
{
    if(n==0 || n==1)
    {
        return 1;
    }else
    {
        return fib(n-1)+fib(n-2);
    }
}

int main()
{
    int n;
    printf("Insert the desired number:\n");
    scanf("%d", &n);
    fib(n);
}

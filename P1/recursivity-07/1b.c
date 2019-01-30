/*
This program is going to do the factorial in the recursive way
*/

#include <stdio.h>


int fac_recursive(int n){
    if (n==1){
        return 1;
    }
    return n*fac_recursive(n-1);
}

int main()
{
    int n;
    printf("Insert the desired number to calculate the factorial:\n");
    scanf("%d",&n);
    printf("%d", fac_recursive(n));
    return 0;
}

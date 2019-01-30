#include <stdio.h>

/*
This is going to say if the number is perfect or not
*/

int perfect( int n ){
    int i, rem, sum;
    sum=0;
    for (i = 1; i <= (n - 1); i++)
        {
            rem = n % i;
        if (rem == 0)
            {
                sum = sum + i;
            }
        }
        if (sum == n)
            printf("Entered Number is perfect number");
        else
            printf("Entered Number is not a perfect number");
        return 0;
}

int main()
{
    int n;
    printf ("Insert the desired number:\n");
    scanf("%d", &n);
    perfect(n);
    return 0;
}

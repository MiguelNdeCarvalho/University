/*
Author: Miguel de Carvalho
Date: 29/11/2018
*/

#include <stdio.h>


int main()
{
    struct date
    {
        int day;
        int month;
        int year;
    };

    struct date today;

    printf("Insert the day:\n");
    scanf("%d", &today.day);
    printf("Insert the month:\n");
    scanf("%d", &today.month);
    printf("Insert the year:\n");
    scanf("%d", &today.year);
    printf("Today date is %i/%i/%i.", today.day, today.month, today.year%100);
    return 0;
}

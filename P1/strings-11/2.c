#include <stdio.h>

void letras(char s[])
{
    int i;
    for (i=0; s[i]!=0; i++)
    {
       printf("%c\n", s[i]);
    }
}

int main()
{
char s[50];
printf("Insira uma frase:\n");
gets(s);
letras(s);
return 0;
}

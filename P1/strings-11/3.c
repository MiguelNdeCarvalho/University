#include <stdio.h>

int tamanho(char s[])
{
    int i, contador=0;
    for (i=0; s[i]!='\0'; i++)
    {
        contador+=1;
    }
    return contador;
}

void letras_inv(char s[])
{
    int i;
    for (i=tamanho(s)-1 ; i>=0; i--)
    {
       printf("%c\n", s[i]);
    }
}

int main()
{
char s[50];
printf("Insira uma frase:\n");
gets(s);
letras_inv(s);
return 0;
}

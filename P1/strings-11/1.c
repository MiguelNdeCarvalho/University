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

int main()
{
char s[50];
printf("Insira uma frase:\n");
gets(s);
printf("O tamanho da string e:%d", tamanho(s) );
return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include "colorSquares.c"
#include "colorSquares.h"


int main()
{
  int comecar = intro_inter();
  if(comecar == 1)
  {
    int sz, l, c, x, y, pontos, p_total, verifica_fim;
    p_total=0;
    printf("\nInsira o tamanho do tabuleiro (max 20): ");
    scanf("%d", &sz);
    if(sz>20)
    {
      printf("O tamanho maximo do tabuleiro e 20!");
      exit(1);
    }
    else
    {
      srand(time(NULL));
      int tabuleiro[50][50];
      for(l = 0 ; l < sz ; l++)
      {
        for(c = 0 ; c < sz ; c++)
        {
          tabuleiro[l][c] = rand()%4 + 1; // Gera um numero random entre 1-4
        }
      }


      mostrar(tabuleiro, sz);
      int verifica_fim = fim(tabuleiro, sz);
      while(verifica_fim == 0)
       {
        printf("Insira a sua jogada (x,y): ");
        scanf("%d,%d", &x, &y);
        y=(sz-1)-y;                          //inverte o eixo das linhas
        pontos = jogada(tabuleiro, sz, x, y);
        gravidade(tabuleiro, sz);
        for(int i=0; i<sz; i++)
        {
          coluna(tabuleiro, sz);
        }
        mostrar(tabuleiro, sz);
        verifica_fim = fim(tabuleiro, sz);
        printf("Pontos da jogada: %d\n", pontos);
        printf("\n");
        p_total += pontos;
        printf("Pontos totais: %d\n", p_total);
        printf("\n");
      }
        printf("O jogo terminou, pontos finais: %d \n", p_total);
        printf("\n");
        printf("Obrigado por jogar!!\n");
        printf("\n");
      return 0;
     }
   }
   else if(comecar==0)
   {
     exit(0);
   }
 }

#include <stdlib.h>
#include <stdio.h>
#include "colorSquares.h"

int marcar(int tabuleiro[50][50], int sz, int x, int y)
{
  int num_quadrados = 1;
  int fixo = tabuleiro[y][x];
  tabuleiro[y][x] = 0;
  if( (x < sz && y < sz ) && (x >= 0 && y >= 0 ) ){
    if (tabuleiro[y][x+1] == fixo && x + 1 < sz)
    {
      num_quadrados += marcar(tabuleiro, sz, x + 1, y);
    }
    if (tabuleiro[y][x-1] == fixo && x - 1 >= 0)
    {
      num_quadrados += marcar(tabuleiro, sz, x-1, y);
    }
    if (tabuleiro[y+1][x] == fixo && y + 1 < sz)
    {
      num_quadrados += marcar(tabuleiro, sz, x, y+1);
    }
    if (tabuleiro[y-1][x] == fixo && y - 1 >= 0)
    {
      num_quadrados += marcar(tabuleiro, sz, x, y-1);
    }
  }
  return num_quadrados;
}


int pontuacao(int num_quadrados)
{
  int pontos;
  pontos = num_quadrados * (num_quadrados + 1) / 2;
  return pontos;
}

void gravidade(int tabuleiro[50][50], int sz)
{
  for(int c = 0 ; c < sz ; c++)
  {
    for(int l = 0 ; l < sz ; l++)
    {
      if(tabuleiro[l][c] == 0 && tabuleiro[l-1][c] != 0 && l-1 >=0)
      {
          tabuleiro[l][c] = tabuleiro[l-1][c];
          tabuleiro[l-1][c] = 0;
          l=0;
          c=0;
        }
      }
    }
  }


void coluna(int tabuleiro[][50], int sz)
{
  int n_z = 0;
  int ocupacao = 0;
  int p_actual = 0;
  int limite = sz-ocupacao;
  while(p_actual<limite)
  {
    if(tabuleiro[0][p_actual]==0)
    {
      for(int j =0;j<sz;j++)
      {
        if(tabuleiro[j][p_actual]!=0)
        {
          p_actual++;
          n_z=0;
          break;
        }
        else
        {
          n_z++;
        }
      }
      if(n_z==sz)
      {
        int temp=0;
        while(temp<sz)
        {
          for(int i =p_actual;i<limite;i++)
          {
              tabuleiro[temp][i] = tabuleiro[temp][i+1];
              tabuleiro[temp][i+1] = 0;
          }
          temp++;
        }
        n_z=0;
        ocupacao++;
        break;
      }

    }
    else
    {
      p_actual++;
    }
  }
}

int jogada(int tabuleiro[50][50], int sz, int x, int y)
{
  int num_quadrados = marcar(tabuleiro, sz, x, y);
  int pontos = pontuacao(num_quadrados);
  return pontos;
}

void mostrar(int tabuleiro[50][50], int sz)
{
  printf("\n");
  for(int l = 0 ; l < sz ; l++)
  {
    for(int c = 0 ; c < sz ; c  ++)
    {
      if(tabuleiro[l][c]!=0){
        if(c!=sz-1){
          printf("| %d ", tabuleiro[l][c]);
        }else
        {
          printf("| %d |", tabuleiro[l][c]);
        }
      }else
      {
        if(c!=sz-1){
          printf("| - ", tabuleiro[l][c]);
        }else
        {
          printf("| - |", tabuleiro[l][c]);
        }
      }
    }
    printf("\n");
  }
  printf("\n");
}

int fim(int tabuleiro[50][50], int sz) //A função verifica se o tabuleiro está preenchido com números ou se está vazia.
{
  if(tabuleiro[sz-1][0] == 0)
  {
      return 1;
  }
  else
  {
      return 0;
  }
}


int intro_inter()
{
  int op, op2;
  printf("  ,ad8888ba,                88                            ad88888ba                                                                            \n");
  printf(" d8''    `'8b               88                           d8''    ''8b                                                                          \n");
  printf("d8'                         88                           Y8,                                                                                   \n");
  printf("88              ,adPPYba,   88   ,adPPYba,   8b,dPPYba,  `Y8aaaaa,     ,adPPYb,d8  88       88  ,adPPYYba,  8b,dPPYba,   ,adPPYba,  ,adPPYba,  \n");
  printf("88             a8'     '8a  88  a8'     '8a  88P'   'Y8    `'''''8b,  a8'    `Y88  88       88  '''     `Y8  88P'   'Y8  a8P_____88  I8[    '' \n");
  printf("Y8,            8b       d8  88  8b       d8  88                  `8b  8b       88  88       88  ,adPPPPP88  88          8PP'''''''   `'Y8ba,   \n");
  printf(" Y8a.    .a8P  8a,     ,a8  88  8a,     ,a8  88          Y8a     a8P  '8a    ,d88  '8a,   ,a88  88,    ,88  88          '8b,   ,aa  aa    ]8I  \n");
  printf("  `'Y8888Y''    `'YbbdP''   88   ''YbbdP''   88           'Y88888P'    `'YbbdP'88   `'YbbdP'Y8  `'8bbdP'Y8  88           `'Ybbd8''  `'YbbdP''  \n");
  printf("                                                                               88                                                              \n");
  printf("                                                                               88                                                              \n");

  printf("!!BEM-VINDO ao jogo ColorSquares modo INTERATI!!\n");
  printf("Selecione uma das seguintes opcoes: \n");
  printf("\n");
  printf("1 - Comecar o jogo!!\n");
  printf("2 - Regras\n");
  printf("3 - Fechar\n");
  printf("\n");
  scanf("%d", &op);
  if(op!=1 && op!=2 && op!=3)
  {
    while(op!=1 && op!=2 && op!=3)
    {
      printf("OPCAO INVALIDA!!\n");
      printf("Selecione uma das seguintes opcoes: \n");
      printf("\n");
      printf("1 - Comecar o jogo!!\n");
      printf("2 - Regras\n");
      printf("3 - Fechar\n");
      printf("\n");
      scanf("%d", &op);
    }
  }
  if(op==3)
  {
    printf("Obrigado por jogar!\n");
    return 0;
  }
  if(op==2)
  {
        printf("\n");
        printf("REGRAS: Um tabuleiro e preenchido com quadrados de numeros diferentes\n");
        printf("e o jogador deve remover grupos com o mesmo numero; um grupo consiste\n");
        printf("num conjunto de quadrados com lados partilhados. Apos cada movimento,\n");
        printf("o tabuleiro e atualizado de acordo com as seguintes regras:\n");
        printf("\n");
        printf("1. gravidade: Os quadrados acima da area vazia caem devido a gravidade;\n");
        printf("2. coluna: Quando toda a coluna esta vazia, ela colapsa movendo os blocos da direita\n");
        printf("para a esquerda para fechar a separacao.\n");
        printf("\n");
        printf("PRETENDE COMECAR O JOGO??\n");
        printf("\n");
        printf("1 - SIM\n");
        printf("2 - NAO\n");
        printf("\n");
        scanf("%d", &op2);
        if(op2 != 1 && op2 != 2)
        {
          while(op2 != 1 && op2 != 2)
          {
            printf("OPCAO INVALIDA!!\n");
            printf("PRETENDE COMECAR O JOGO??\n");
            printf("\n");
            printf("1 - SIM\n");
            printf("2- NAO\n");
            scanf("%d", &op2);
          }
        }
        if(op2 == 2)
        {
        printf("Obrigado por jogar!\n");
          return 0;
        }
        if(op2 == 1)
        {
          return 1;
        }
  }
  if(op==1)
  {
    return 1;
  }
}

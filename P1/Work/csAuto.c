#include <stdio.h>
#include "colorSquares.c"
#include "colorSquares.h"

int main()
{
  char fNome[50], linha_coor[300], linha_mov[10], c_sz[3], linha_tab[21];
  int mov, x, y, p, tabuleiro[50][50], sz, elemento, pontos, p_total;
  printf("Qual e o nome do ficheiro de texto? Nao se esqueca de colocar a extensao (.txt) no final\n");
  printf("\n");
  scanf("%s", &fNome);
  FILE *fPointer= fopen(fNome, "r");
  fgets(c_sz, 3, fPointer);
  sscanf(c_sz, "%d", &sz);          //sscanf transforma strings em int.
  for(int i=0; i<sz; i++)
  {
    fgets(linha_tab, 21, fPointer);
      for(int a=0; a<sz; a++)
      {
        elemento= linha_tab[a] - '0';
        tabuleiro[i][a]= elemento;
      }
  }
  fgets(linha_mov, 10, fPointer);
  sscanf(linha_mov, "%d", &mov);
  fgets(linha_coor, 300, fPointer);
  fclose(fPointer);
  p=0;
  p_total=0;
  for(int i=0; i<mov; i++)
  {
    x= linha_coor[p] - '0';
    y= linha_coor[p+2] - '0';
    y=(sz-1)-y;
    if(tabuleiro[y][x]!=0)
    {
      pontos = jogada(tabuleiro, sz, x, y);
      gravidade(tabuleiro, sz);
      for(int i=0; i<sz; i++)
      {
        coluna(tabuleiro, sz);
      }
      p_total += pontos;
    }
    p += 5;
  }
  printf("Pontos finais: %d \n", p_total);
  return 0;
}

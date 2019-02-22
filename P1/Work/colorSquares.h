#ifndef GUARDA_colorSquares_H //Criação de um guard. Utilizado para prevenir que as funções sejam definidas mais do que uma vez.
#define GUARDA_colorSquares_H
  int marcar(int [50][50], int, int, int);

  int pontuacao(int);

  void gravidade(int [50][50], int);

  void coluna(int [50][50], int);

  int jogada(int [50][50], int, int, int);

  void mostrar(int [50][50], int);
#endif //GUARDA_colorSquares_H

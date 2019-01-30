/*
This program says if the triangle is rectangle, acute or obtuse
*/

#include <stdio.h>

int triangle(int l1, int l2, int lmax)
{
  if (lmax>=l1+l2)
  {
    printf ("There is no triangle");
  }
  else if ((lmax^2)==(l1^2)+(l2^2))
  {
    printf("The triangle is rectangle");
  }
  else if ((lmax^2)>=(l1^2)+(l2^2))
  {
    printf("The triangle is acute");
  }
  else if ((lmax^2)<=(l1^2)+(l2^2))
  {
    printf("The triangle is obtuse");
  }

}


int main()
{
  int l1, l2, lmax;
  printf ("Insert the first side:");
  scanf("%d", &l1);
  //printf("%d", l1); // Just used to debug
  printf ("Insert the second side:");
  scanf("%d", &l2);
  //printf("%d", l2); // Just used to debug
  printf ("Insert the largest side:");
  scanf("%d", &lmax);
  //printf("%d", lmax); // Just used to debug
  triangle (l1,l2,lmax);
  return 0;
}

#include <stdio.h>

int min(int n1, int n2, int n3)
{
  if (n1<n2 && n1<n3)
  {
    printf ("%i\n",n1);
  }
  else if (n2<n1 && n2<n3)
  {
    printf("%i\n",n2);
  }
  else
  {
    printf("%i\n", n3);
  }

}


int main()
{
  int n1, n2, n3;
  printf ("Insert the first number:");
  scanf("%d", &n1);
  //printf("%d", n1); // Just used to debug
  printf ("Insert the second number:");
  scanf("%d", &n2);
  //printf("%d", n2); // Just used to debug
  printf ("Insert the third number:");
  scanf("%d", &n3);
  //printf("%d", n3); // Just used to debug
  printf ("The smallest numher is:");
  printf (min (n1,n2,n3));
  return 0;
}

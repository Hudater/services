#include <stdio.h>

int main()
{
  int lowlim=1,uplim=999999,x,i;

  // printf("Enter your lower limit: ");
  // scanf("%d", &lowlim);

  // printf("Enter higher limit: ");
  // scanf("%d",  &uplim);

  for(x=lowlim; x<=uplim; x++)
  {
    for(i=2; i<x; i++)
    {
      if (x%i==0)
      
      {
        break;
      }
    }
    if (i==x)
    {
      printf("%d\n", x);
    }
  }
  return 0;
}

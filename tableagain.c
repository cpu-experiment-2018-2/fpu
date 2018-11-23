#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void){
  FILE *f;
  f = fopen("table.txt","w");
  if (f == NULL) {
    printf("cannot open\n");
    exit(1);
  }
  int i;
  int j;

  unsigned long long x0int;
  unsigned long long s;
  unsigned long long ss;
  unsigned long long t;
  union {float x0; int x0bit;} hoge;

  for (i=0;i<2048;i++){
    x0int = 0;
    hoge.x0 = ((2048.0 / (i + 2048.0)) + (2048.0 / ((i+1.0) + 2048.0)))/2.0;

    for( j = 0; j <23 ; j++ ){
      x0int = x0int + ((( hoge.x0bit >> j ) & 1 ) << j);
    }
    x0int = x0int + (1 << 23);
    s = ((2048 + i) * x0int * x0int);
    ss =  2 * x0int - (s >> 35);
    t = (x0int * x0int) >> 35;
    fprintf (f,"assign s[%d] = %llu;\nassign t[%d] = %llu;\n",i,ss,i,t);
     
 
  }
  fclose(f);
  return 0;
}




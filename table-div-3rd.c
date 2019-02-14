#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(void){
  FILE *f;
  f = fopen("table2.txt","w");
  if (f == NULL) {
    printf("cannot open\n");
    exit(1);
  }
  int i;
  float x;
  union {float f;int b;} key;
  union {float f;int b;} key2;
  int a;
  int b;
  int c;
  for (i=0;i<1024;i++){
    x = 1.0 + (i/1024.0);
    key.f = 2.0/x + 1.0/(4194304.0 * pow(x,3.0));
    key2.f = 2.0/pow(x,2.0);
    a = key.b & 0b00000000011111111111111111111111;
    b = 4096 + ((key2.b & 0b00000000011111111111100000000000) >> 11);
    if (((key2.b & 0b01111111100000000000000000000000) >> 23) == 126){
      c = 1;
    }
    else {
      c = 0;
    }
    fprintf(f,"assign key[%d] = %d;\nassign key2[%d] = %d;\nassign key3[%d] = %d;\n",i,a,i,b,i,c);
  }
  fclose(f);
  return 0;
}


    




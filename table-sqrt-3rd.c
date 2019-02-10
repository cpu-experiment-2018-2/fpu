#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(void){
  FILE *f;
  f = fopen("table.txt","w");
  if (f == NULL) {
    printf("cannot open\n");
    exit(1);
  }
  int i;
  int rx;
  int trxb1;
  int r2x;
  int r2xb1;
  union {float f;int b;} key;
  union {float f;int b;} key2;
  for (i=0;i<512;i++){
    if (i>255){
      key.f = pow(i/256.0,0.5);
      key2.f = 1.0/(2.0*pow(i/256.0,0.5));
      rx = key.b & 0b00000000011111111111111111111111;
      trxb1 = ((key2.b & 0b00000000011111111111100000000000) >> 11) + 4096;
      fprintf(f,"assign key[%d] = %d;\nassign key2[%d] = %d;\n",i,rx,i,trxb1);
    }
    else {
      key.f = pow((256.0+i)*2.0/256.0,0.5);
      key2.f = 1.0/pow((256.0+i)*2.0/256.0,0.5);
      r2x = key.b & 0b00000000011111111111111111111111;
      r2xb1 = ((key2.b & 0b00000000011111111111110000000000) >> 10) + 8192;
      fprintf(f,"assign key[%d] = %d;\nassign key2[%d] = %d;\n",i,r2x,i,r2xb1);
    }
  }
  fclose(f);
  return 0;
}




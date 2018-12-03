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
  
  float x;
  union {float t; int tbit;} hoge;
  union {float u; int ubit;} fuga;
  union {float s; int sbit;} piyo;
  for (i=0;i<2048;i++){
  int te,ue;
    int A1;
    A1 = (i > 1023) ? i : i + 1024;
    if (i < 1024) {
      x = 1.0/pow((A1+A1+1.0) / pow(2.0,10.0) , 0.5) ;
      piyo.s = 3.0*x*A1/pow(2.0,10.0) - x*x*x*A1*A1/pow(2.0,19.0);
      hoge.t = 3.0*x-x*x*x*A1/pow(2.0,8.0);
      fuga.u = x*x*x;
      te = (hoge.tbit & 0b01111111100000000000000000000000) >> 23;
      ue = (fuga.ubit & 0b01111111100000000000000000000000) >> 23;
      fprintf(f,"assign s[%d] = %d;\nassign tm[%d] = %d;\nassign te[%d] = %d;\n",i,(piyo.sbit & 0b00000000011111111111111111111111)-4,i,4096+((hoge.tbit & 0b00000000011111111111100000000000) >> 11),i,(139-te) > 26 ? 26 : 139-te);
      }
      else {
            x = 1.0/pow((A1+A1+1.0) / pow(2.0,11.0) , 0.5) ;
      piyo.s = 3.0*x*A1/pow(2.0,11.0) - x*x*x*A1*A1/pow(2.0,21.0);
      hoge.t = 1.5*x-x*x*x*A1/pow(2.0,10.0);
      fuga.u = x*x*x;
      te = (hoge.tbit & 0b01111111100000000000000000000000) >> 23;
      ue = (fuga.ubit & 0b01111111100000000000000000000000) >> 23;
      fprintf(f,"assign s[%d] = %d;\nassign tm[%d] = %d;\nassign te[%d] = %d;\n",i,(piyo.sbit & 0b00000000011111111111111111111111)-4,i,4096+((hoge.tbit & 0b00000000011111111111100000000000) >> 11),i,(139-te) > 26 ? 26 : 139-te);
      }
  }
  fclose(f);
  return 0;
}




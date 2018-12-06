#include <stdio.h>
#include <stdlib.h>

union Hoge {
  int bit; 
  float f;
};

int main(int argc,char *argv[]){
  int fuga;
  union Hoge hoge;
  fuga = atoi(argv[1]);
  hoge.f = (float)fuga;
  printf ("f %d\n",hoge.bit);
  hoge.bit = atoi(argv[1]);
  fuga = (int)hoge.f;
  printf("d %d\n",fuga);
  return 0;
}



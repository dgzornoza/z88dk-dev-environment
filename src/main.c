/* C source start */

#include <arch/zx.h>
#include "functions.c"

int main()
{
  int result = sum(5, 10);
  zx_border(INK_BLACK);
  return 0;
}

/* C source end */
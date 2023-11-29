#define CLASSIC 1

#if CLASSIC > 0
#include <arch/zx/spectrum.h>
#else
#include <arch/zx.h>
#endif

#include <stdlib.h>

int a[5] = {0, 1, 2, 3, 4};

extern void neg_and_triple_a(void); // implemented elsewhere

void negate_odd_a(void)
{
    for (int i = 0; i != 5; ++i)
    {
        if (a[i] & 0x01)
        {
            a[i] = -a[i]; // negate odd numbers in array a[]
        }
    }

    return;
}

void plot(unsigned char x, unsigned char y)
{
    *zx_pxy2saddr(x, y) |= zx_px2bitmask(x);
}

int main(void)
{
    unsigned char i;

    neg_and_triple_a(); // call to asm subroutine

    for (i = 0; i < 15; i++)
    {
        plot(rand() % 256, rand() % 192);
    }

    return 0;
}

/* C source end */
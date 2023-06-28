#include <stdio.h>

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

main()
{
    neg_and_triple_a(); // call to asm subroutine

    for (int i = 0; i != 5; ++i)
    {
        printf("a[%d]=%d\n", i, a[i]);
    }

    return 0;
}
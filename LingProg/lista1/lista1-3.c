#include <stdio.h>
#include <math.h>
void main(void) {
    int x, y, z;

    x = y = 10;
    printf("Após x = y = 10, x = %d, y = %d\n", x, y);

    z = ++x;
    printf("Após z = ++x, z = %d, x = %d\n", z, x);

    x = -x;
    printf("Após x = -x, x = %d\n", x);

    y++;
    printf("Após y++, y = %d\n", y);

    x = x + y -(z--);
    printf("Após x = x + y -(z--):\n");
    printf("x %d \ny %d\nz %d\n", x, y, z);
} 


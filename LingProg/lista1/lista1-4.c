#include <stdio.h>

void main() {
    int a, b, c = 5;

    a = b = 0;
    a = ++b + ++c;
    printf("\n%d %d %d", a, b, c);
    a = b++ + c++;
    printf("\n%d %d %d", a, b, c);
    a = ++b + c++;
    printf("\n%d %d %d", a, b, c);
    a = b-- + --c;
    printf("\n%d %d %d", a, b, c);
    a = ++c + c--;
    printf("\n%d %d %d", a, b, c);
    printf("\n\n");
}


#include <stdio.h>

void main() {
    int i, j, k, m, n;
    i = j = k = 3;
    m = n = 5;

    k %= m = -(1 + n/(2 - n)); 
    printf("%d\n", k);
}

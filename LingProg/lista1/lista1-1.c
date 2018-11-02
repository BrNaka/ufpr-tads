#include <stdio.h>

void main() {
    int A, B, C, D, E;
    A = 5;
    A += 2;
    B = A++;
    C = (2 * A + 3) % B;
    D = (B != C) && (A + B == 3 * C);
    E = A <= B ? A : C;
    printf("\nA %d \nB %d \nC %d\nD %d\nE %d\n", A, B, C, D, E);
}

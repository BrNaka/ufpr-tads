/* Faça um programa que leia um número (N) e apresente os N-termos da série de
 * Fibonacci. */

#include <stdio.h>

int main(void) {
    int n, n1, n2, n3;

    printf("Quantos termos (n) da sequência de Fibonacci deseja saber?: ");
    scanf("%d", &n);
    
    for (int i = 0; i < n; i++) {
        if (i == 0 || i == 1) {
            n1 = n2 = 1; 
            printf("%d ", 1);
        }
        else {
            n3 = n1 + n2;
            n1 = n2;
            n2 = n3;
            printf("%d ", n3);
        }
    }
    printf("\n");

    return 0;
}

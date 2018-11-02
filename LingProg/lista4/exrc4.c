/* 4. Escreva um programa em C que leia um vetor de 15 elementos inteiros.
Ordene o vetor em ordem decrescente e exiba-o. */

#include <stdio.h>

#define N 15

int main(void) {
    int elements[N];

    printf("Informe %d números!\n", N);
    for (int indx = 0; indx < N; ++indx) {
        printf("Elem. %d: ", indx+1);
        scanf("%d", elements+indx);
    }

    return 0;
}

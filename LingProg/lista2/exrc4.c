/* Faça um programa que receba dois números X e Y, sendo X < Y. Calcule e mostre:
 *  - a soma dos números pares desse intervalo de números, incluindo os números digitados;
 *  - a multiplicação dos números ímpares desse intervalo, incluindo os digitados */

#include <stdio.h>

int main(void) {
    int x, y, soma = 0, multi = 1;

    do {
        printf("\nRegra: x < y\n");
        printf("Informe x: ");
        scanf("%d", &x);
        printf("Informe y: ");
        scanf("%d", &y);
    } while (y < x);

    for (x; x <= y; ++x) {
       if (x % 2) multi *= x;
       else soma += x;
    }

    printf("Soma dos pares: %d\nMultiplicação: %d\n\n", soma, multi);

    return 0;
}
     

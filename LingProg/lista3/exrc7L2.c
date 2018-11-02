/* Calcular e imprimir o total da soma obtida dos cem primeiros números inteiros
 * (1+2+3+...+98+99+100). */

#include <stdio.h>

int main(void) {
    int n;
    printf("Este programa calcula a soma dos n números entre 1..n\n");
    printf("Informe o valor de n: ");
    scanf("%d", &n);
    printf("Soma = %d\n", ((1 + n) * n) / 2);
    return 0;
}

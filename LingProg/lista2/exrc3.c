/* 3) Fazer um programa no qual o usuário vai entrando sucessivamente com valores positivos.
 * Quando o usuário entrar com um valor negativo o programa pára de pedir valores e calcula a
 * média dos valores já fornecidos. */

#include <stdio.h>

#define TRUE 1

int main(void) {
    int num, count, soma;
    num = count = soma = 0;

    while (TRUE) {
        printf("Informe um número positivo: ");
        scanf("%d", &num);
        if (num < 0) 
            break;
        soma += num;
        count++; 
    };

    printf("Média = %.2f\n", (float) soma / count);
    
    return 0;
}
        

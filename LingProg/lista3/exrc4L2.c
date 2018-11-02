/* Faça um programa contendo um menu que executa as seguintes operações:
 * S - soma
 * P - produto
 * U - subtração
 * D - divisão
 * Q - sair
 * Utilize a estrutura switch-case. Quando o usuário teclar Q o programa deve
 * terminar */

#include <stdio.h>
#include <stdlib.h>

#define TRUE 1

char menu_calc(); 

int main(void) {
    int num1, num2, option, result;
    float div_result;

    while (TRUE) {
        option = menu_calc();
        if (option == 'Q') exit(0);
        printf("Informe dois números para serem calculados: ");
        scanf("%d %d", &num1, &num2);
        switch(option) {
            case 'S': result = num1 + num2; break;
            case 'P': result = num1 * num2; break;
            case 'U': result = num1 - num2; break;
            case 'D': if (num2 == 0) {printf("Divisão por 0\n"); exit(0);} else {div_result = num1 / num2;} break;
            default: printf("Opção não permitida\n"); exit(0);
        }
        if (option == 'D') printf("Resultado = %.2f\n", div_result);
        else printf("Resultado = %d\n", result);
    }
    return 0;
}

char menu_calc() {
    char op;
    printf("\n S - soma\n");
    printf("\n P - produto\n");
    printf("\n U - subtração\n");
    printf("\n D - divisão\n");
    printf("\n Q - sair\n\n");
    printf("Operação: ");
    scanf(" %c", &op);
    return op;
}

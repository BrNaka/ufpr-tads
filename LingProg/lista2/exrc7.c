/* Escreva um programa em C para ler o saldo inicial de uma conta bancária. A seguir ler um
número indeterminado de pares de valores indicando respectivamente o tipo da operação
(codificado da seguinte forma: 1.Depósito 2.Retirada 3.Fim) e o valor. Quando for informado
para o tipo o código 3, o programa deve ser encerrado e impresso o saldo final da conta com
as seguintes mensagens: CONTA ZERADA, CONTA ESTOURADA (se o saldo for negativo) ou
CONTA PREFERENCIAL (se o saldo for positivo). */

#include <stdio.h>

#define TRUE 1
#define FALSE 0

int menu();

int main(void) {
    int operation, verdade = TRUE;
    float saldoInicial, valor;
    
    printf("\nSaldo inicial da Conta Bancária: R$ ");
    scanf("%f", &saldoInicial);
    
    while (verdade) {
        operation = menu();
        switch(operation) {
            case 1: printf("Valor de Depósito: R$ ");
                    scanf("%f", &valor); 
                    saldoInicial += valor; 
                    break;
            case 2: printf("Valor de Retirada: R$ "); 
                    scanf("%f", &valor); 
                    saldoInicial -= valor; 
                    break;
            case 3: printf("Operações Finalizadas!\n");
                    verdade = FALSE;
                    break;
            default: printf("Operação não permitida!\n");
        }
        printf("\n-----------------------------------------\n");
    }
    
    printf("\nSaldo final = R$ %.2f\n", saldoInicial);
    
    if (saldoInicial >= 0 ) printf("CONTA PREFERENCIAL!\n");
    else if (saldoInicial == 0 ) printf("CONTA ZERADA!\n");
    else printf("CONTA ESTOURADA!\n");
}

int menu() {
    int op;
    printf("\n1. Depósito\n");
    printf("2. Retirada\n");
    printf("3. Fim\n\n");
    printf("Operação: ");
    scanf("%d", &op);
    return op;
}   

/* 6) Escreva um programa em C para validar um lote de cheques. O programa deverá inicialmente
 * solicitar a soma do lote e o número de cheques. A seguir deverá ler o valor de cada cheque
 * calculando a soma total. Após a digitação de todos os cheques o programa deverá imprimir as
 * seguintes mensagens: LOTE Ok se a soma informada for igual a soma calculada. Diferença
 * negativa se a soma calculada for menor que a informada. Diferença positiva se a soma
 * calculada for maior que a informada. Observação: O valor da diferença deve ser impresso
 * (caso exista). */

#include <stdio.h>

int main(void) {
    int numCheques;
    float somaLote, valorCheque, somaTotal = 0.0;

    printf("Informe o número de Cheques: ");
    scanf("%d", &numCheques);

    printf("Informe a soma do lote: R$ ");
    scanf("%f", &somaLote);

    for (int cheque = 1; cheque <= numCheques; ++cheque) {
        printf("Valor do cheque %d: R$ ", cheque);
        scanf("%f", &valorCheque);
        somaTotal += valorCheque;
    }

    printf("Soma do Lote = R$ %.2f\n", somaLote);
    printf("Soma dos Cheques = R$ %.2f\n", somaTotal);

    if (somaLote == somaTotal) printf("LOTE Ok\n");
    else if (somaLote > somaTotal) printf("Diferença negativa! R$ -%.2f\n", somaLote-somaTotal);
    else printf("Diferença positiva! R$ +%.2f\n", -(somaLote-somaTotal));
}  

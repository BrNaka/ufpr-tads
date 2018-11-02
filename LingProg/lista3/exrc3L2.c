/* Escrever um programa que declara três variáveis int (a, b e c). Ler um valor
 * maior que zero para cada variável (se o valor digitado não é válido, mostrar
 * mensagem e ler novamente). Exibe o menor valor lido multiplicado pelo maior e
 * o maior valor dividido pelo menor */

#include <stdio.h>

int returnMax(int, int); // Função retorna o maior número entre dois números;
int returnMin(int, int); // Função retorna o menor número entre dois números;

int main(void) {
    int a, b, c, min, max;

    do {
        printf("Digite os valores de 'a', 'b' e 'c' (valores > 0): ");
        scanf("%d %d %d", &a, &b, &c);
    } while ((a <= 0) && (b <= 0) && (c <= 0));

    max = returnMax(a, returnMax(b, c));
    min = returnMin(a, returnMin(b, c));
    
    printf("\nMenor = %d\nMaior = %d\n", min, max);
    printf("%d x %d = %d\n", min, max, min * max); 
    printf("%d / %d = %.2f\n", max, min, (float) max / min);

    return 0;
}

int returnMax(int n1, int n2) {
    if (n1 > n2)
        return n1;
    return n2;
}

int returnMin(int n1, int n2) {
    if (n1 < n2)
        return n1;
    return n2;
}
       

/* Ler 2 notas. Calcular a média e verificar:
 * a. se média >= 7 imprimir APROVADO
 * b. se 4 <= média < 7 imprimir EXAME
 * c. se média < 4 imprimir REPROVADO */

#include <stdio.h>

int main(void) {
    float nota1, nota2, media;

    printf("Nota 1 = ");
    scanf("%f", &nota1);

    printf("Nota 2 = ");
    scanf("%f", &nota2);

    media = (nota1 + nota2) / 2; 
    printf("Média = %.2f\n", media);

    if (media >= 7) printf("APROVADO!\n");
    else if (media >= 4 && media < 7) printf("EXAME\n");
    else printf("REPROVADO!\n");

    return 0;
}

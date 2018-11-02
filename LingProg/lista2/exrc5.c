/* Escreva um programa em C que leia as notas das 2 avaliações normais e a nota da avaliação
 * optativa. Caso o aluno não tenha feito a optativa deve ser fornecido um valor negativo.
 * Calcular a média do semestre considerando que a prova optativa substitui a nota mais baixa
 * entre as 2 primeiras avaliações. Escrever a média e uma mensagem que indique se o aluno foi
 * aprovado, reprovado ou está em exame. */

#include <stdio.h>

#define GRADES 3

void get_grades(float*);        // Recebe as notas (input);
void sort_grades(float*);       // Ordena as notas em ordem decrescente;
void print_result(float*);      // Calcula a média e imprime o resultado; 

int main(void) {
    float notas[GRADES];
    get_grades(notas);
    sort_grades(notas);
    print_result(notas);
    return 0;  
}

void get_grades(float* notas) {
    printf("Avaliação 1: ");
    scanf("%f", &notas[0]);  

    printf("Avaliação 2: ");
    scanf("%f", &notas[1]);

    printf("Optativa: ");
    scanf("%f", &notas[2]); 
} 

void sort_grades(float* notas) {
    float temp;
    for (int i = 1; i < GRADES; ++i) {
        for (int j = 1; j < GRADES; ++j) {
            if (notas[j-1] < notas[j]) {
                temp = notas[j];
                notas[j] = notas[j-1];
                notas[j-1] = temp;
            }
        }
    }
}

void print_result(float* notas) {
    float media;
    media = (notas[0] + notas[1]) / 2;
    printf("Media: %.2f\n", media);
    if (media < 40) printf("Está Reprovado!\n");
    else if (media >= 40 && media < 70) printf("Está de final!\n");
    else printf("Parabéns! Aprovado!\n");
}

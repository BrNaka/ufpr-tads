/* Faça um programa para corrigir provas de múltipla escolha. Cada prova
tem oito questões, e cada questão vale um ponto, exceto as questões 3 e
8 que valem 2.0 pontos cada uma. O primeiro conjunto de dados a ser
lido é o gabarito da prova. Os outros dados são os números dos alunos, e
as respostas que deram às questões. Existem 10 alunos matriculados.
Calcule e mostre o número e a nota de cada aluno */

#include <stdio.h>
#include <stdlib.h>

#define QUESTOES 8
#define ALUNOS 10

int main(void) {
    char gabarito[QUESTOES];
    char* gab_alunos[ALUNOS];
    int notas[ALUNOS];

    for (int aluno = 0; aluno < ALUNOS; aluno++) {
        notas[aluno] = 0;
        gab_alunos[aluno] = malloc(sizeof(char) * QUESTOES);
    }
    
    printf("INFORME O GABARITO:\n");
    for (int quest = 0; quest < QUESTOES; quest++) {
        printf("Questão %d: ", quest + 1);
        scanf(" %c", &gabarito[quest]);
    }

    for (int aluno = 0; aluno < ALUNOS; aluno++) {
        printf("RESPOSTAS ALUNO %d\n", aluno + 1);
        for (int quest = 0; quest < QUESTOES; quest++) {
            printf("Questão %d: ", quest + 1);
            scanf(" %c", &gab_alunos[aluno][quest]);
            if (gabarito[quest] == gab_alunos[aluno][quest]) {
                if (quest == 2 || quest == 7) {
                    notas[aluno] += 2;
                }
                else 
                    notas[aluno]++;
            }
        }
        printf("\n");
    }

    printf("\n\nNotas:\n");
    for (int aluno = 0; aluno < ALUNOS; aluno++)
       printf("Aluno %d = %d\n", aluno + 1, notas[aluno]); 

    return 0;
}  

/* Existem 2 candidatos para uma vaga no Senado e 20 eleitores, cada eleitor
 * tem direito a 1 voto, onde este pode ser:
 * 0 - voto em branco
 * 1 - candidato 1
 * 2 - candidato 2
 * outro - voto nulo
 * Fazer um programa que detecte a contagem de votos, i e, quantos brancos,
 * nulos, candidato 1 e 2 */

#define BRANCO 0
#define CANDI1 1
#define CANDI2 2
#define NULO 3
#define TOTAL 20

#include <stdio.h>

int main(void) {
    int votos[4] = {0, 0, 0, 0}, voto;

    for (int eleitor = 1; eleitor <= TOTAL; ++eleitor) {
        printf("Voto %d: ", eleitor);
        scanf("%d", &voto);
        switch(voto) {
            case 0: printf("BRANCO!\n\n"); votos[BRANCO]++; break;
            case 1: printf("CANDIDATO1!\n\n"); votos[CANDI1]++; break;
            case 2: printf("CANDIDATO2!\n\n"); votos[CANDI2]++; break;
            default: printf("NULO!\n\n"); votos[NULO]++;
        }
    }

    printf("\nContagem dos Votos:\n");
    printf("BRANCO = %d\n", votos[BRANCO]);
    printf("CANDI1 = %d\n", votos[CANDI1]);
    printf("CANDI2 = %d\n", votos[CANDI2]);
    printf("NULOS = %d\n", votos[NULO]);

    return 0;
}

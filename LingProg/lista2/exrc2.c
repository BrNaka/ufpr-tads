#include <stdio.h>

#define FEITOS 0
#define SOFRIDOS 1
#define VITORIAS 0
#define EMPATES 1
#define DERROTAS 2

int main(void) {
    int num_jogos;                                                      // Número de jogos
    int gols[2] = {0, 0};                                               // Gols feitos/sofridos em cada partida
    int total_gols[2] = {0, 0};                                         // Total de gols feitos/sofridos
    int resultado[3] = {0, 0, 0};                                       // Resultados (Vitórias, Empates, Derrotas)
    float media_gols[2] = {0.0, 0.0};                                   // Média de gols feitos/sofridos

    printf("Informe o número de jogos: ");                              // Recebe do teclado o número de jogos
    scanf("%d", &num_jogos);                                            //

    for (int jogo = 1; jogo <= num_jogos; ++jogo) {                     // Loop de acordo com o número de jogos
        printf("Jogo %d | Gols Feitos: ", jogo);                        // Recebe quantidade de gols feitos na partida
        scanf("%d", &gols[FEITOS]);                                     //

        printf("Jogo %d | Gols Sofrid: ", jogo);                        // Recebe quantidade de gols sofridos na partida
        scanf("%d", &gols[SOFRIDOS]);                                   // 

        total_gols[FEITOS] += gols[FEITOS];                             // Soma o total de gols feitos
        total_gols[SOFRIDOS] += gols[SOFRIDOS];                         // Soma o total de gols sofridos

        if (gols[FEITOS] > gols[SOFRIDOS]) resultado[VITORIAS]++;       // Incrementa Vitórias
        else if (gols[FEITOS] == gols[SOFRIDOS]) resultado[EMPATES]++;  // Incrementa Empates
        else resultado[DERROTAS]++;                                     // Incrementa Derrotas
        printf("\n");
    }

    media_gols[FEITOS] = total_gols[FEITOS] / num_jogos;                // Calcula a média de gols feitos
    media_gols[SOFRIDOS] = total_gols[SOFRIDOS] / num_jogos;            // Calcula a média de gols sofridos

    printf("\nVitórias = %d\n", resultado[VITORIAS]);                   /*                          */
    printf("Empates = %d\n", resultado[EMPATES]);                       /*          IMPRIME         */
    printf("Derrotas = %d\n", resultado[DERROTAS]);                     /*                          */       
    printf("Média Gols Feitos = %.2f\n", media_gols[FEITOS]);           /*         RESULTADOS       */
    printf("Média Gols Sofridos = %.2f\n", media_gols[SOFRIDOS]);       /*                          */
}

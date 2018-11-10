/* CAMPEONATO JOGO DA VELHA */
/* Nome         : Bruno Nakayabu
 * GRR          : 20185463
 * Disciplina   : Linguagem de Programação I
 * Professor(a) : Andreia de Jesus */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define TRUE 1
#define BUFF 255

/* Variável global */
    char tab[3][3];

/* Definição da Struct */
    typedef struct Velha {
        int partida;
        char JogVelha[3][3];
        char resultado;
        char player1[BUFF];
        char sinal1;
        char player2[BUFF];
        char sinal2;
    } Partida;

/* Funções Obrigatórias */
    int jogada_usuario(int, int, char);
    void jogada_computador(char, int);
    int menu();
    void escolha_simb(char*, char*, char*, char*, int);
    void inicializa_velha();
    int verifica_ganhador(char);
    void registra_jogadores(char*, char, char*, char, Partida*);
    int grava_resultado(char*, Partida*);
    void readFile(char*, int);
    void mostra_partidas(char*);

/* Funções Criadas */
    void tabuleiro();
    void imprime_rodada(int*, int);
    int ganhador(int, char, char*);
    void turno(char*, char, int*, int*);
    int empate(int);
    void escolhe_nome(char*, char*, int);
    void stop();
    int basico(char);
    int intermediario(char);
    int avancado(char);
    int jogada(char, int, char, char);
    void cria_nome_arquivo(char*, char*, char*);
    void guarda_tabuleiro(Partida*);
    int nova_partida();
    int resultado(char*);

void main() {
    int opcao, nivel, rodada = 0, partida = 1, op;
    char p1[BUFF], p2[BUFF], arqName[BUFF];
    char s1, s2; // Símbolo player1 (s1) e Símbolo player2 (s2)
    int lin, col;
    Partida jogo;
    
    opcao = menu();

    /* Player x Player */
    if (opcao == 2) {
        escolhe_nome(p1, p2, opcao);
        escolha_simb(p1, p2, &s1, &s2, opcao);
        cria_nome_arquivo(arqName, p1, p2);
        registra_jogadores(p1, s1, p2, s2, &jogo);
        while (TRUE) {
            inicializa_velha();
            while (TRUE) { 
                imprime_rodada(&rodada, 0);
                tabuleiro();
                turno(p1, s1, &lin, &col);
                opcao = verifica_ganhador(s1);
                if (ganhador(opcao, s1, p1)) { 
                    jogo.resultado = s1;
                    break;
                }

                if (empate(rodada)) {
                    jogo.resultado = 'V';
                    break;
                }

                imprime_rodada(&rodada, 0);
                tabuleiro();
                turno(p2, s2, &lin, &col);
                opcao = verifica_ganhador(s2);
                if(ganhador(opcao, s2, p2)) { 
                    jogo.resultado = s2;
                    break;
                }
            }
            jogo.partida = partida;
            guarda_tabuleiro(&jogo);
            grava_resultado(arqName, &jogo);
            if (nova_partida()) {
                partida++; 
                rodada = 0;
            } else {
                resultado(arqName);
                exit(0);    
            }
        }
    }

    /* Player x Computador */
    if (opcao != 2) {
        nivel = opcao;
        escolhe_nome(p1, p2, opcao);
        escolha_simb(p1, p2, &s1, &s2, opcao);
        while (TRUE) { 
            inicializa_velha();
            while (TRUE) {
                imprime_rodada(&rodada, nivel);
                tabuleiro();
                nivel == 5 ? jogada_computador(s1, nivel) : turno(p1, s1, &lin, &col);
                opcao = verifica_ganhador(s1);
                if (ganhador(opcao, s1, p1)) break;

                if (empate(rodada)) break;

                imprime_rodada(&rodada, nivel);
                tabuleiro();
                nivel == 5 ? turno(p1, s2, &lin, &col) : jogada_computador(s2, nivel);
                opcao = verifica_ganhador(s2);
                if(ganhador(opcao, s2, p2)) break;
            }
            if (nova_partida()) {
                while (TRUE) {
                    printf("\nNovo nível?\n\n[3] Básico\n[4] Intermediário\n[5] Avançado\n\n   Opção: ");
                    scanf("%d", &nivel);
                    if ((nivel >= 3) && (nivel <= 5)) break;
                    printf("\nOpção [%d] inválida!!! Tente novamente!\n\n", nivel);
                }
                opcao = nivel;
                rodada = 0;
            }
            else { 
                exit(0);
            }    
        }
    }
}

int menu() {
    int op;
    while (TRUE) {
        printf("___________________________");
        printf("\n__________ MENU ___________\n\n Escolha a modalidade:\n    [1] Player x Computador\n    [2] Player x Player\n");
        
        printf(" Opção: ");
        scanf("%d", &op);
        setbuf(stdin, NULL);

        if (op == 1) break;
        if (op == 2) return op;
        printf("ERRO: Opção [%d] inválida!!!\n\n", op);
        
    }
    while(TRUE) {
        printf("\nDificuldade do Computador:\n[3] Básico\n[4] Intermediário\n[5] Avançado\n");

        printf("Opção: ");
        scanf("%d", &op);
        setbuf(stdin, NULL);

        if ((op >= 3) && (op <= 5)) return op;
        printf("ERRO: Opção [%d] inválida!!!", op); 
    }
}

void inicializa_velha() {
    int lin, col;
    system("clear");
    for (lin = 0; lin < 3; lin++) {
        for (col = 0; col < 3; col++)
            tab[lin][col] = ' ';
    }
}

void imprime_rodada(int* rodada, int nivel) {
    system("clear");
    ++(*rodada);
    switch(nivel) {
        case 0: printf("\n======== RODADA %d ========\n\n", *rodada); break;
        case 3: printf("\n==== RODADA %d - Nível %s ====\n\n", *rodada, "Básico"); break;
        case 4: printf("\n==== RODADA %d - Nível %s ====\n\n", *rodada, "Intermediário"); break;
        case 5: printf("\n==== RODADA %d - Nível %s ====\n\n", *rodada, "Avançado"); break;
    }
}

void tabuleiro() {
    int lin, col;
    for (lin = 0; lin < 3; lin++) {
        for (col = 0; col < 3; col++)
            col == 2 ? printf(" %c ", tab[lin][col]) : printf(" %c |", tab[lin][col]);
        lin == 2 ? printf("\n\n") : printf("\n--- --- ---\n"); 
    }
}

void escolhe_nome(char* player1, char* player2, int op) {
    int len = 0;

    system("clear");

    printf("Nome do Jogador 1: ");
    fgets(player1, BUFF, stdin);
    len = strlen(player1);
    player1[len-1] = '\0';
    setbuf(stdin, NULL);
    
    if (op == 2) { 
        printf("Nome do Jogador 2: ");
        fgets(player2, BUFF, stdin);
        len = strlen(player2);
        player2[len-1] = '\0';
        setbuf(stdin, NULL);
    } else {
        player2 = "Computador";
    }

}

void escolha_simb(char* p1, char* p2, char* s1, char* s2, int op) {
    system("clear");
    op == 2 ? printf("\n======== %s X %s =========\n\n", p1, p2) : printf("\n___________ %s X COMPUTADOR  ___________\n\n", p1);
    printf("Escolha um símbolo ('X' ou 'O')\n");
    do {
        printf("    %s: ", p1);
        scanf(" %c%*c", s1);
    } while((*s1 != 'X') && (*s1 != 'O'));
    *s2 = *s1 == 'X' ? 'O' : 'X';
    printf("\nSímbolo dos Jogadores: \n");
    printf("    %s ---> %c\n", p1, *s1);
    op == 2 ? printf("    %s ---> %c\n", p2, *s2) : printf("    Computador ---> %c\n", *s2);
    stop();
}

int jogada_usuario(int lin, int col, char jog) {
    if (((lin < 0) || ((lin > 2))) || ((col < 0) || (col > 2))) {
        printf("\nJogada Inválida!\n");
        return 1;
    }
    if (tab[lin][col] == ' ') {
        tab[lin][col] = jog;
        return 0;
    }
    printf("\nCampo já marcado!\n");
    return 2;
}

int verifica_ganhador(char jog) {
    int lin, col, linha, coluna, D = 0, d = 0;

    for (lin = 0; lin < 3; lin++) {
        linha = coluna = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == jog) linha++;
            if (tab[col][lin] == jog) coluna++;
        }
        if (tab[lin][lin] == jog) D++;
        if (tab[lin][2-lin] == jog) d++;
        if ((linha == 3) || (coluna == 3) || (D == 3) || (d == 3)) return 1;
    }

    return 0;
}

int ganhador(int op, char jog, char* nome) {
    if (op == 1) { 
        system("clear");
        printf("\n======== %s %c VENCEU!!! ======== \n\n", nome, jog);
        tabuleiro();
        stop();
        return 1;
    }
    return 0;
}

void turno(char* player, char jog, int* lin, int* col) {
    int op;
    do {
        printf("Sua vez, %s (%c): \n", player, jog);
        printf("Coordenada: ");
        scanf("%d %d", lin, col);
        setbuf(stdin, NULL);
        op = jogada_usuario(*lin, *col, jog); 
    } while (op != 0); 
}

int empate(int rodada) {
    if (rodada == 9) {
        system("clear");
        printf("========= EMPATE =========\n\n");
        tabuleiro();
        stop();
        return 1;
    }
    return 0;
}

void jogada_computador(char jog, int nivel) {
    switch(nivel) {
        case 3: basico(jog); break;
        case 4: intermediario(jog); break;
        case 5: avancado(jog); break;
    }
}

int basico(char jog) {
    int lin, col;
    srand(time(NULL));
    while (TRUE) {
        lin = rand() % 3;
        col = rand() % 3;
        if (tab[lin][col] == ' ') {
            tab[lin][col] = jog;
            return 1;
        }
    }
}

int jogada(char tipo, int fixed, char pos, char jog) {
    int lin, col;
    char adv = jog == 'X' ? 'O' : 'X';
    while (TRUE) {
        switch(pos) {
            case 'C': lin = fixed; col = rand() % 3; break;
            case 'L': lin = rand() % 3; col = fixed; break;
            case 'D': lin = rand() % 3; col = lin; break;
            case 'd': lin = rand() % 3; col = 2-lin; break;
        }
        if (tipo != 'A') {
            if (tab[lin][col] == jog)
                return 0;
        } else {
            if (tab[lin][col] == adv)
                return 0;
        }
 
        if (tab[lin][col] == ' ') {
            tab[lin][col] = jog;
            return 1;
        }
    }
    return 0;
}

int intermediario(char jog) {
    int lin, col, coluna, linha, D = 0, d = 0, flag;
    char adv = jog == 'X' ? 'O' : 'X';
    srand(time(NULL));

    for (lin = 0; lin < 3; lin++) {
        linha = coluna = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == jog) { 
                linha++;
                if (linha == 2) 
                    if (jogada('A', lin, 'C', jog) == 1) return 1;
            }
            if (tab[col][lin] == jog) {
                coluna++;
                if (coluna == 2) 
                    if (jogada('A', lin, 'L', jog) == 1) return 1;
            }
        }
        if (tab[lin][lin] == jog) {
            D++;
            if (D == 2) 
                if (jogada('A', lin, 'D', jog) == 1) return 1;
        }
        if (tab[lin][2-lin] == jog) {
            d++;
            if (d == 2)
                if (jogada('A', lin, 'd', jog) == 1) return 1;
        }
    }

    D = 0; d = 0;

    for (lin = 0; lin < 3; lin++) {
        linha = coluna = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == adv) { 
                linha++;
                if (linha == 2) 
                    if (jogada('R', lin, 'C', jog) == 1) return 1;
            }
            if (tab[col][lin] == adv) {
                coluna++;
                if (coluna == 2) 
                    if (jogada('R', lin, 'L', jog) == 1) return 1;
            }
        }
        if (tab[lin][lin] == adv) {
            D++;
            if (D == 2) 
                if (jogada('R', lin, 'D', jog) == 1) return 1;
        }
        if (tab[lin][2-lin] == adv) {
            d++;
            if (d == 2)
                if (jogada('R', lin, 'd', jog) == 1) return 1;
        }
    }

   while (TRUE) {
        lin = rand() % 3;
        col = rand() % 3;
        if (tab[lin][col] == ' ') {
            tab[lin][col] = jog;
            return 1;
        }
    }

    return 0;
}

int avancado(char jog) {
   int lin, col, linha, coluna, D = 0, d = 0, flag;
   char adv = jog == 'X' ? 'O' : 'X';
   srand(time(NULL));
    
    // Ataca
    for (lin = 0; lin < 3; lin++) {
        linha = coluna = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == jog) { 
                linha++;
                if (linha == 2) 
                    if (jogada('A', lin, 'C', jog) == 1) return 1;
            }
            if (tab[col][lin] == jog) {
                coluna++;
                if (coluna == 2) 
                    if (jogada('A', lin, 'L', jog) == 1) return 1;
            }
        }
        if (tab[lin][lin] == jog) {
            D++;
            if (D == 2) 
                if (jogada('A', lin, 'D', jog) == 1) return 1;
        }
        if (tab[lin][2-lin] == jog) {
            d++;
            if (d == 2)
                if (jogada('A', lin, 'd', jog) == 1) return 1;
        }
    }

    D = 0; d = 0;

    // Defende
    for (lin = 0; lin < 3; lin++) {
        linha = coluna = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == adv) { 
                linha++;
                if (linha == 2) 
                    if (jogada('R', lin, 'C', jog) == 1) return 1;
            }
            if (tab[col][lin] == adv) {
                coluna++;
                if (coluna == 2) 
                    if (jogada('R', lin, 'L', jog) == 1) return 1;
            }
        }
        if (tab[lin][lin] == adv) {
            D++;
            if (D == 2) 
                if (jogada('R', lin, 'D', jog) == 1) return 1;
        }
        if (tab[lin][2-lin] == adv) {
            d++;
            if (d == 2)
                if (jogada('R', lin, 'd', jog) == 1) return 1;
        }
    }
    
   while (TRUE) {
       if ((tab[0][0] != ' ') && (tab[0][2] != ' ') && (tab[2][0] != ' ') && (tab[2][2] != ' ')) { 
           break;
       }
       lin = rand() % 2 == 0 ? 0 : 2;
       col = rand() % 2 == 0 ? 0 : 2;
       if (tab[lin][col] == ' ') {
           tab[lin][col] = jog;
           return 1;
       }
   }
   return 0;
}

void registra_jogadores(char* p1, char s1, char* p2, char s2, Partida* jogo) {
    FILE* arq;

    strcpy(jogo->player1, p1);
    strcpy(jogo->player2, p2);
    jogo->sinal1 = s1;
    jogo->sinal2 = s2;

    if ((arq = fopen("nomes_jogadores.txt", "w+")) == NULL) {
        printf("O arquivo não pode ser aberto!\n");
        exit(0);
    }

    fprintf(arq, "Jogador 1: %s\nSímbolo: %c\n\n", p1, s1);
    fprintf(arq, "Jogador 2: %s\nSímbolo: %c\n\n", p2, s2);

    fclose(arq);
}

void cria_nome_arquivo(char* name, char* p1, char* p2) {
    strcat(name, p1);
    strcat(name, "_x_");
    strcat(name, p2);
    strcat(name, ".dat");
} 

int grava_resultado(char* nom_arq, Partida* Resultado) {
    FILE* arq;
    int partidas = Resultado->partida;

    if ((arq = fopen(nom_arq, "a+b")) == NULL ) {
        printf("O arquivo não pode ser aberto!");
        exit(0);
    }
    
    if (fwrite(Resultado, 1, sizeof(Partida), arq) != partidas) {
        fclose(arq); 
        return 0;
    }

    fclose(arq);
    return 1;
}

void guarda_tabuleiro(Partida* jogo) {
    int lin, col;
    for (lin = 0; lin < 3; lin++) {
        for (col = 0; col < 3; col++) {
            jogo->JogVelha[lin][col] = tab[lin][col];
        }
    }
}

int nova_partida() {
    int op;
    do {               
        printf("Deseja jogar novamente?\n[1] SIM\n[2] NÃO\n");
        scanf("%d", &op);
    } while ((op != 1) && (op != 2)); 

    if (op == 2) return 0;

    return 1;
}

int resultado(char* filename) {
    int op, partida;
    while (TRUE) {
        printf("\n ==== RESULTADO DO CAMPEONATO  ===\n[1] Escolha uma partida\n[2] Todas as partidas\n[0] SAIR\n    Opção: ");
        scanf("%d", &op);
        switch(op) {
            case 1: readFile(filename, partida); break;
            case 2: mostra_partidas(filename); stop(); break;
            case 0: exit(0);
            default: printf("Opção [%d] inválida!!!\n", op);    
        }
    }
}

void readFile(char* filename, int partida) {
    FILE* f;
    Partida buffer;
    int pos = partida-1, lin, col;

    if ((f = fopen(filename, "rb")) == NULL) {
        printf("ERRO ao abrir o arquivo!\n");
        exit(0);
    }

    while (TRUE) {
        printf("\nDigite o número da partida: ");
        scanf("%d", &partida);
        system("clear");
  
        pos = partida-1;
        fseek(f, sizeof(Partida) * pos, SEEK_SET);
        if (fread(&buffer, sizeof(Partida), 1, f)) break;
        printf("Partida %d não existe!", partida);
    }

    printf("\nPartida = %d\n", buffer.partida);
    printf("________________________\n\n");
    printf("Tabuleiro\n\n");
    for (lin = 0; lin < 3; lin++) {
        for (col = 0; col < 3; col++)
            col == 2 ? printf(" %c ", buffer.JogVelha[lin][col]) : printf(" %c |", buffer.JogVelha[lin][col]);
        lin == 2 ? printf("\n\n") : printf("\n--- --- ---\n"); 
    }
    printf("________________________\n");
    buffer.resultado == buffer.sinal1 ? printf("\nGanhador: %s *- %c -*\n", buffer.player1, buffer.resultado) : printf("\nGanhador: %s *- %c -*\n", buffer.player2, buffer.resultado);
    stop();
    fclose(f);
}

void mostra_partidas(char* filename) {
    FILE *f;
    Partida buffer;
    int lin, col, p1 = 0, p2 = 0;

    if ((f = fopen(filename, "rb")) == NULL) {
        printf("ERRO ao abrir o arquivo\n");
        exit(0);
    }

    while (fread(&buffer, sizeof(Partida), 1, f) != 0) {
        printf("\n======= Partida %d | Vencedor '%c' =======\n\n", buffer.partida, buffer.resultado);
        for (lin = 0; lin < 3; lin++) {
            for (col = 0; col < 3; col++)
                col == 2 ? printf(" %c ", buffer.JogVelha[lin][col]) : printf(" %c |", buffer.JogVelha[lin][col]);
            lin == 2 ? printf("\n\n") : printf("\n--- --- ---\n"); 
        }
        printf("\n");
        buffer.resultado == buffer.sinal1 ? ++p1 : ++p2;
    }

    printf("\n=========== Placar =============\n\n%s ('%c') ---> %d\n%s ('%c') ---> %d\n\n", buffer.player1, buffer.sinal1, p1, buffer.player2, buffer.sinal2, p2);
    if (p1 > p2) { 
        printf("    ======================\n");
        printf("        %s Campeã(o)     \n", buffer.player1);
        printf("    ======================\n");
    } else if (p2 > p1) {
        printf("    ======================\n");
        printf("        %s Campeã(o)     \n", buffer.player2);
        printf("    ======================\n");
    } else {
        printf("    ======================\n");
        printf("             Empate     \n");
        printf("    ======================\n");
    }
    fclose(f);
}

void stop() {
    setbuf(stdin, NULL);
    getchar();
    setbuf(stdin, NULL);
    system("clear");
}

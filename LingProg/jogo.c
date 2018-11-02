/* CAMPEONATO JOGO DA VELHA */
/* Nome         : Bruno Nakayabu
 * GRR          : 20185463
 * Disciplina   : Linguagem de Programação I
 * Professor(a) : Andreia de Jesus */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TRUE 1

/* Variável global */
    char tab[3][3];

/* Funções Obrigatórias */
    int jogada_usuario(int, int, char);
    void jogada_computador(char, int);
    int menu();
    void escolha_simb(char*, char*, int);
    void inicializa_velha();
    int verifica_ganhador(char);

/* Funções Criadas */
    int tutorial();
    void mostra_tutorial();
    void mostra_tabuleiro();
    void imprime_rodada(int*, int);
    void imprime_ganhador(int, char);
    void turno(char*, char, int*, int*);
    void verifica_empate(int);
    void stop();
    int basico(char);
    int intermediario(char);
    int procura_jogada(int, char, char);
    int avancado(char);

void main() {
    int opcao, nivel, rodada = 0;
    char p1, p2;
    int lin, col;

    inicializa_velha();
    tutorial();
    
    opcao = menu();
    inicializa_velha();

    if (opcao == 2) {
        escolha_simb(&p1, &p2, opcao);
        while (TRUE) { 
            imprime_rodada(&rodada, 0);
            mostra_tabuleiro();
            turno("Player 1", p1, &lin, &col);
            opcao = verifica_ganhador(p1);
            imprime_ganhador(opcao, p1);

            verifica_empate(rodada);

            imprime_rodada(&rodada, 0);
            mostra_tabuleiro();
            turno("Player 2", p2, &lin, &col);
            opcao = verifica_ganhador(p2);
            imprime_ganhador(opcao, p2);
        }
    }

    if (opcao != 2) {
        nivel = opcao;
        escolha_simb(&p1, &p2, opcao);
        while (TRUE) {
            imprime_rodada(&rodada, nivel);
            mostra_tabuleiro();
            nivel == 5 ? jogada_computador(p1, nivel) : turno("Player 1", p2, &lin, &col);
            opcao = verifica_ganhador(p1);
            imprime_ganhador(opcao, p1);

            verifica_empate(rodada);

            imprime_rodada(&rodada, nivel);
            mostra_tabuleiro();
            nivel == 5 ? turno("Player", p2, &lin, &col) : jogada_computador(p1, nivel);
            opcao = verifica_ganhador(p2);
            imprime_ganhador(opcao, p2);
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

        if (op == 1)
            break;
        if (op == 2) {
            return op;
        }

        printf("ERRO: Opção [%d] inválida!!!\n\n", op);
        
    }
    while(TRUE) {
        printf("\nDificuldade do Computador:\n[3] Básico\n[4] Intermediário\n[5] Avançado\n");

        printf("Opção: ");
        scanf("%d", &op);

        if ((op >= 3) && (op <= 5)) {
            return op;
        }

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

int tutorial() {
    int op;
    while(TRUE) {
        printf("\n_________________________________________________________________");
        printf("\n_________________ CAMPEONATO DE JOGO DA VELHA  __________________\n");
        printf("\nDeseja ver o tutorial?\n    [1] Sim\n    [2] Não\n\n");
        printf("Opção: ");
        scanf("%d", &op);
        setbuf(stdin, NULL);

        if ((op == 1) || (op == 2)) 
            break;

        printf("ERRO: Opção [%d] inválida\nTente Novamente\n\n", op);
    }


    if (op == 2) {
        system("clear");
        return 0;
    }

    system("clear");
    mostra_tutorial();

    printf("\n'ENTER' para sair ");
    stop();

    return 1;
}

void mostra_tutorial() {
   int lin, col;
   printf("_____________________________________________________");
   printf("\n______________________ TUTORIAL _____________________\n\n");
   printf("1) Coordenadas do jogo:\n\n");
   for (lin = 0; lin < 3; lin++) {
       for (col = 0; col < 3; col++)
           col == 2 ? printf(" %d,%d ", lin, col) : printf(" %d,%d |", lin, col);
       lin == 2 ? printf("\n\n") : printf("\n----- ----- -----\n");
   }
   
   printf("2) Ex: 'Jogador X escolhe posição 1,1'\n\n");
   tab[1][1] = 'X';
   mostra_tabuleiro();

   printf("3) Ex: 'Jogador O escolhe posição 0,0'\n\n");
   tab[0][0] = 'O';
   mostra_tabuleiro();
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

void mostra_tabuleiro() {
    int lin, col;
    for (lin = 0; lin < 3; lin++) {
        for (col = 0; col < 3; col++)
            col == 2 ? printf(" %c ", tab[lin][col]) : printf(" %c |", tab[lin][col]);
        lin == 2 ? printf("\n\n") : printf("\n--- --- ---\n"); 
    }
}

void escolha_simb(char* p1, char* p2, int op) {
    printf("____________________________________________");
    op == 2 ? printf("\n____________ PLAYER X PLAYER  ______________\n\n") : printf("\n___________ PLAYER X COMPUTADOR  ___________\n\n");
    printf("Escolha um símbolo ('X' ou 'O')\n");
    do {
        printf("    JOGADOR 1: ");
        scanf(" %c%*c", p1);
    } while((*p1 != 'X') && (*p1 != 'O'));
    *p2 = *p1 == 'X' ? 'O' : 'X';
    printf("\nSímbolo dos Jogadores: \n");
    printf("    Jogador 1 ---> %c\n", *p1);
    op == 2 ? printf("    Jogador 2 ---> %c\n", *p2) : printf("    Computador ---> %c\n", *p2);
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
    int lin, col;
    /* Verifica horizontais */
    for (lin = 0; lin < 3; lin++) {
        if (tab[lin][0] == jog) {
            if ((tab[lin][0] == tab[lin][1]) && (tab[lin][0] == tab[lin][2]))
                return 1;
        }
    }

    /* Verifica verticais */
    for (col = 0; col < 3; col++) {
        if (tab[0][col] == jog) {
            if ((tab[0][col] == tab[1][col]) && (tab[0][col] == tab[2][col]))
                return 1;
        }
    }

    /* Verifica diagonais */
    if ((tab[0][0] == jog) && (tab[0][0] == tab[1][1]) && (tab[0][0]) == tab[2][2]) return 1;
    if ((tab[0][2] == jog) && (tab[0][2] == tab[1][1]) && (tab[0][2]) == tab[2][0]) return 1;

    return 0;
}

void imprime_ganhador(int op, char jog) {
    if (op == 1) { 
        system("clear");
        printf("\n======== JOGADOR %c VENCEU!!! ======== \n\n", jog);
        mostra_tabuleiro();
        stop();
        exit(0);
    }
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

void verifica_empate(int rodada) {
    if (rodada == 9) {
        system("clear");
        printf("========= EMPATE =========\n\n");
        mostra_tabuleiro();
        stop();
        exit(0);
    }
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

int procura_jogada(int fixed, char pos, char jog) {
    int lin, col;
    while (TRUE) {
        switch(pos) {
            case 'C': lin = fixed; col = rand() % 3; break;
            case 'L': lin = rand() % 3; col = fixed; break;
            case 'D': lin = rand() % 3; col = lin; break;
            case 'd': lin = rand() % 3; col = 2 - lin; break;
        }
        if (tab[lin][col] == jog)
            break;
        if (tab[lin][col] == ' ') {
            tab[lin][col] = jog;
            return 1;
        }
    }
    return 0;
}

int intermediario(char jog) {
    int lin, col, count, flag;
    char adv = jog == 'X' ? 'O' : 'X';
    srand(time(NULL));

    for (lin = 0; lin < 3; lin++) {
        count = 0; flag = 0;
        for (col = 0; col < 3; col++) {
            if (tab[lin][col] == adv) count++;
        }
        if (count == 2) flag = procura_jogada(lin, 'C', jog);
        if (flag == 1) return 1;
    }

    for (col = 0; col < 3; col++) {
        count = 0; flag = 0;
        for (lin = 0; lin < 3; lin++) {
            if (tab[lin][col] == adv) count++;
        }
        if (count == 2) flag = procura_jogada(col, 'L', jog);
        if (flag == 1) return 1;
    }

    for (lin = 0; lin < 3; lin++) {
        count = 0; flag = 0;
        if (tab[lin][lin] == adv) count++;
        if (count == 2) flag = procura_jogada(lin, 'D', jog);
        if (flag == 1) return 1;
    }

    for (lin = 2, col = 0; lin >= 0; lin--, col++) {
        count = 0; flag = 0;
        if (tab[lin][col] == adv) count++;
        if (count == 2) flag = procura_jogada(lin, 'd', jog);
        if (flag == 1) return 1;
    }

    while (TRUE) {
        lin = rand() % 3;
        col = rand() % 3;
        if (tab[lin][col] == ' ') {
            tab[lin][col] = jog;
            return 1;
        }
    }
}

int avancado(char jog) {
   int lin = 0, col = 0, count, flag;
   char adv = jog == 'X' ? 'O' : 'X';
   srand(time(NULL));

   for (lin = 0; lin < 3; lin++) {
       count = 0; flag = 0;
       for (col = 0; col < 3; col++) {
           if (tab[lin][col] == jog) count++;
       }
       if (count == 2) flag = procura_jogada(lin, 'C', jog);
       if (flag == 1) return 1;
   }
 
   for (col = 0; col < 3; col++) {
       count = 0; flag = 0;
       for (lin = 0; lin < 3; lin++) {
           if (tab[lin][col] == jog) count++;
       }
       if (count == 2) flag = procura_jogada(col, 'L', jog);
       if (flag == 1) return 1;
   }

    for (lin = 0; lin < 3; lin++) {
        count = 0; flag = 0;
        if (tab[lin][lin] == jog) count++;
        if (count == 2) flag = procura_jogada(lin, 'D', jog);
        if (flag == 1) return 1;
    }

    for (lin = 2, col = 0; lin >= 0; lin--, col++) {
        count = 0; flag = 0;
        if (tab[lin][col] == jog) count++;
        if (count == 2) flag = procura_jogada(lin, 'd', jog);
        if (flag == 1) return 1;
    }

   for (lin = 0; lin < 3; lin++) {
       count = 0; flag = 0;
       for (col = 0; col < 3; col++) {
           if (tab[lin][col] == adv) count++;
       }
       if (count == 2) flag = procura_jogada(lin, 'C', jog);
       if (flag == 1) return 1;
   }
 
   for (col = 0; col < 3; col++) {
       count = 0; flag = 0;
       for (lin = 0; lin < 3; lin++) {
           if (tab[lin][col] == adv) count++;
       }
       if (count == 2) flag = procura_jogada(col, 'L', jog);
       if (flag == 1) return 1;
   }

    for (lin = 0; lin < 3; lin++) {
        count = 0; flag = 0;
        if (tab[lin][lin] == adv) count++;
        if (count == 2) flag = procura_jogada(lin, 'D', jog);
        if (flag == 1) return 1;
    }

    for (lin = 2, col = 0; lin >= 0; lin--, col++) {
        count = 0; flag = 0;
        if (tab[lin][col] == adv) count++;
        if (count == 2) flag = procura_jogada(lin, 'd', jog);
        if (flag == 1) return 1;
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

   if (tab[0][0] == jog) { 
       if (tab[0][0] == tab[0][2]) tab[0][1] = jog;
       else if (tab[0][0] == tab[2][0]) tab[1][0] = jog;
       else if (tab[0][0] == tab[2][2]) tab[1][1] = jog;
   } 
   else if (tab[0][2] == jog) {
       if (tab[0][2] == tab[2][2]) tab[1][2] = jog;
       else if (tab[0][2] == tab[2][0]) tab[1][1] = jog;
   }
   else if (tab[2][0] == jog) {
       if (tab[2][0] == tab[2][2]) tab[2][1] = jog;
   }
   return 1;
}

void stop() {
    getchar();
    setbuf(stdin, NULL);
    system("clear");
}

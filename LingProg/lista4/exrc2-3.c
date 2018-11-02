/* 2. Crie um vetor com 10 numeros e:
    • Verifique se um valor digitado pelo usuário é um numero do vetor. Se
        sim, informe a posição em que o numero ocorre.
    • Percorrendo o vetor uma única vez, determine o menor e o maior
        numero do vetor, e as posições em que ocorrem.
    • Informe para cada numero se ele é par ou ímpar
    • Calcule a soma de todos os numeros do vetor.
    • Calcule a soma de todos os numeros positivos do vetor.
    • Calcule a soma de todos os numeros negativos do vetor.
    • Crie outro vetor com 10 numeros gerados aleatoriamente e informe os
        numeros que aparecem nos dois vetores. (pesquise a função rand da
        biblioteca stdlib.h) */

#include <stdio.h>
#include <stdlib.h>

#define N 800
#define TRUE 1
#define FALSE 0
#define PAR 0
#define ALL 0
#define POSITIVE 1
#define NEGATIVE 2
#define MAX_RANGE 999

void matched(int*, int*, int);
void swap(int*, int);
void update_position(int*, int);
void matched_position(int, int, int);
void print_max_min(int, int, int, int);
void even_or_odd(int, int);
void sum(int* , int);
void print_sum(int*);
int menu();

int main(void) {
    int numbers[N]; 
    int digit, position, maior, menor, pos_maior, pos_menor, op;
    int soma[3] = {0, 0, 0};
    int flag = FALSE;
    time_t t;
    
    /* Preenche o vetor com números aleatórios entre 0...MAX_RANGE */
    srand((unsigned) time(&t));
    for (int i = 0; i < N; i++)
        numbers[i] = rand() % MAX_RANGE;
    maior = menor = numbers[0];
    printf("Digite um número: ");
    scanf("%d", &digit);
    op = menu();
    if (op == 3) {
        printf("\nINDICE | NUMERO | P/I\n");
    }
    for (int indx = 0; indx < N; ++indx) {
        if (numbers[indx] == digit) {
            matched(&flag, &position, indx);
        }
        if (numbers[indx] > maior) {
            swap(&maior, numbers[indx]);
            update_position(&pos_maior, indx);
        }
        else if (numbers[indx] <= menor) {
            swap(&menor, numbers[indx]);
            update_position(&pos_menor, indx);
        }
        if (op == 3) {
            even_or_odd(numbers[indx], indx);
        }
        sum(soma, numbers[indx]);
    }
    switch(op) {
        case 1 : matched_position(flag, position, digit); break;
        case 2 : print_max_min(maior, menor, pos_maior, pos_menor); break;
        case 4 : print_sum(soma); break;
        case 5 : exit(0);
        default: printf("OPÇÃO INVÁLIDA\n");
    }
    return 0;
} 

void matched(int* flag, int* pos, int indx) {
    *flag = TRUE;
    *pos = indx;
}

void swap(int* old_num, int new_num) {
    *old_num = new_num;
}

void update_position(int* pos, int indx) {
    *pos = indx;
}

void matched_position(int flag, int pos, int digit) {
    if (flag) printf("\nDigito %d pertence ao vetor. Encontra-se na posição: %d\n", digit, pos);
    else printf("\nDígito %d não pertence ao vetor!\n", digit);
}

void print_max_min(int greater, int smaller, int pos_g, int pos_s) {
    printf("\nMaior número do vetor = %d\nPosição = %d\n", greater, pos_g);
    printf("Menor número do vetor = %d\nPosição = %d\n\n", smaller, pos_s);
}

void even_or_odd(int num_vect, int indx) {
    num_vect % 2 == PAR ? printf(" [%d]      %d      PAR\n", indx, num_vect) : printf(" [%d]      %d      ÍMPAR\n", indx, num_vect);
} 

void sum(int* array, int num_vect) {
    if(num_vect > 0) array[POSITIVE] += num_vect;
    else array[NEGATIVE] += num_vect;
    array[ALL] += num_vect;
}

void print_sum(int* array) {
    printf("\nSOMA TOTAL = %d", array[ALL]);
    printf("\nPOSITIVOS = %d", array[POSITIVE]);
    printf("\nNEGATIVOS = %d\n", array[NEGATIVE]);
}

int menu() {
    int option;
    printf("[1] Verifica se número pertence ao vetor\n"); 
    printf("[2] Imprimir maior e menor\n"); 
    printf("[3] Par ou ímpar\n"); 
    printf("[4] Soma todos os números, positivos, negativos\n"); 
    printf("[5] SAIR\n"); 
    scanf("%d", &option);
    return option;
}

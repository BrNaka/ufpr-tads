/*  Faça um programa que apresente os números de 1 a 15 na forma de um
 *  triangulo, como apresentado a seguir:
 *  1
 *  2 3
 *  4 5 6
 *  7 8 9 10
 *  11 12 13 14 15
 *  Utilize nesse exercício apenas 1 laço */

#include <stdio.h>

#define MAX 500

int main(void) {
    int num, lineRange, line;
    num = lineRange = line = 1;
    while (num <= MAX) {
        printf("%d ", num);
        if (num == lineRange) {
            printf("\n");
            line++;
            lineRange += line;
        }
        num++;
    }
    return 0;
}


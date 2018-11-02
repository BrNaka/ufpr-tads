/* . Faça um programa que apresente a tabela ASCII (0 a 255), no formato de
 * 16x16, tendo a 1a linha e a 1a coluna rotulada com o valor em hexadecimal de
 * 0 a F.
 * Observação: Inicialmente, substitua os valores < 32 por 32, para evitar a
 * impressão dos códigos de controle. */

#include <stdio.h>

#define MAXROW 17
#define MAXCOL 17

int main(void) {
    int count = 0;
    for (int line = 0; line < MAXROW; ++line) {
        for (int col = 0; col < MAXCOL; ++col) {
            if (line == 0 && col == 0) printf("  "); 
            else if (line == 0) printf("%x ", (col-1));
            else if (col == 0) printf("%x ", (line-1));
            else {
                if (count < 32) printf("%c ", '-');
                else printf("%c ", count);
                count++;
            }
        }
        printf("\n");
    }
    return 0;
}



#include <stdio.h>

int main(void) {

    float nota1 = 0, nota2 = 0, media = 0;
    char ch;

    printf("Nota1: ");
    scanf("%f%*c", &nota1);
    
    printf("Nota2: ");
    scanf("%f%*c", &nota2);

    media = nota1 + nota2;
    getchar();

    printf("APERTE QUALQUER TECLA PARA ENCERRAR %f ", media);

    return 0;
}

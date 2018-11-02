/* Mostrar a tabuada de um nº definido pelo usuário. A tabuada deve começar
 * com 0 e terminar com 10. Exemplo com o nº 2 :
 * 2*0 = 0
 * 2*1 = 2
 * ...
 * 2*10 = 20 */

#include <stdio.h>

int main(void) {
    int num;

    printf("Informe o número para saber sua tabuada: ");
    scanf("%d", &num);

    for (int i = 0; i <= 10; i++)
        printf("%d x %d = %d\n", num, i, num * i);

    return 0;
}

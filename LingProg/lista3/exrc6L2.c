/* Ler 3 números e mostrá-los na ordem crescente. */

#include <stdio.h>

int main(void) {
    int a, b, c;

    printf("Informe três números: ");
    scanf("%d %d %d", &a, &b, &c);

    if (a < b && a < c) {
       if (b < c) printf("%d %d %d\n", a, b, c);
       else printf("%d %d %d\n", a, c, b);
    }
    else if (b < a && b < c) {
        if (a < c) printf("%d %d %d\n", b, a, c);
        else printf("%d %d %d\n", b, c, a);
    }
    else {
        if (a < b) printf("%d %d %d\n", c, a, b);
        else printf("%d %d %d\n", c, b, a);
    }

    return 0;
}


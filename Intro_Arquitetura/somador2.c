#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#define SIZE 255

int baseToDec(char* num_base, int base) {
    int indx = 0, exp = 0, len = 0, dec = 0, num = 0;
    while(num_base[len] != '\0') {
        len++;
    }
    for(exp, indx=(len-1); exp < len; exp++, indx--) {
        if(base == 16) {
            if(num_base[indx] >= 'a' && num_base[indx] <= 'f')
                num = num_base[indx] - 87;
            else
                num = (int)num_base[indx] - (int)'0';
            }
        else
            num = (int)num_base[indx] - (int)'0';
            if(num > (base-1) || num < 0) {
                printf("Você informou um número inválido!\n");
                    exit(0);
            }
        dec += num * pow(base, exp);
    }
    return dec;
}



char XOR(char A, char B) {
    return ((A-48) ^ (B-48)) + 48;
}

char AND(char A, char B) {
    return ((A-48) && (B-48)) + 48;
}

char OR(char A, char B) {
    return ((A-48) || (B-48)) + 48;
}


int main(void) {
    
    unsigned char A[SIZE], B[SIZE], SUM[SIZE], SUM_CON[SIZE], vaiUM;
    int indx, i, x;
    size_t a, b; 

    printf("Informe o número binário A:");
    scanf("%s", A);

    printf("Informe o número binário B:");
    scanf("%s", B);

    a = strlen(A);
    b = strlen(B);

    i = x = 0;
    indx = a - 1;

    printf("Antes do for\n");

    for(i, indx; i < a; i++, indx--) {
        // Meio Somador
        if(indx == a - 1) {
            SUM[i] = XOR(A[indx], B[indx]); 
            vaiUM = AND(A[indx], B[indx]);
        }
        // Somador Completo
        else {
            SUM[i] = XOR(XOR(A[indx], B[indx]), vaiUM);
            vaiUM = OR(AND(XOR(A[indx], B[indx]), vaiUM), AND(A[indx], B[indx]));
        }
    }

    if(vaiUM == '1')
        SUM[i] = vaiUM;
    else
        SUM[i] = '\0';

    for(i = a, x; i >= 0; i--, x++) {
        if(SUM[i] == '\0') {
            x--;
            continue;
        }
        SUM_CON[x] = SUM[i];
    }

    SUM_CON[x] = '\0';
    
    printf("\n%8c%10c\n\n", 'A', 'B');
    printf("%8s%10s\n", A, B);
    printf("%8d%10d\n", baseToDec(A, 2), baseToDec(B, 2));
    printf("\nA + B = %10s\n", SUM_CON);
    printf("\nA + B = %10d\n", baseToDec(SUM_CON, 2)); 

    return 0;

}

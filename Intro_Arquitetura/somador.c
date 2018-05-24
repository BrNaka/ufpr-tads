#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#define SIZE 255

// Função que converte número na base 2, 8 ou 16 para a base Decimal
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


// Porta lógica XOR. 
char XOR(char A, char B) {
    return ((A-48) ^ (B-48)) + 48;
}

// Porta lógica AND. 
char AND(char A, char B) {
    return ((A-48) && (B-48)) + 48;
}

// Porta lógica OR.
char OR(char A, char B) {
    return ((A-48) || (B-48)) + 48;
}

// Função que simula as portas lógicas. 
char* somador(char* A, char* B, char* SUM) {
    int indx, indxSum, iSumCon;
    size_t a_numSize, b_numSize;
    char saida[SIZE], carryOut;

    a_numSize = strlen(A);
    b_numSize = strlen(B); 

    indxSum = iSumCon = 0;
    indx = a_numSize-1; 

    for(indxSum, indx; indxSum < a_numSize; indxSum++, indx--) {
        // Meio Somador
        if(indx == a_numSize-1) {
            saida[indxSum] = XOR(A[indx], B[indx]); 
            carryOut = AND(A[indx], B[indx]);
        }
        // Somador Completo
        else {
            saida[indxSum] = XOR(XOR(A[indx], B[indx]), carryOut);
            carryOut = OR(AND(XOR(A[indx], B[indx]), carryOut), AND(A[indx], B[indx]));
        }
    }

    saida[indxSum] = carryOut;

    for(indxSum, iSumCon; indxSum >= 0; indxSum--, iSumCon++) {
        SUM[iSumCon] = saida[indxSum];
    }

    SUM[iSumCon] = '\0';

    return SUM;

}
int main(void) {
    
    char A[SIZE], B[SIZE], SUM[SIZE];

    printf("Informe o número binário A: ");
    scanf("%s", A);

    printf("Informe o número binário B: ");
    scanf("%s", B);
    
    printf("\n%17s%10s\n\n", "BINÁRIO", "DECIMAL");
    printf("%3c%13s%10d\n", 'A', A, baseToDec(A,2));
    printf("%3c%13s%10d\n", 'B', B, baseToDec(B,2));
    printf("\n Soma%11s%10d\n\n", somador(A, B, SUM), baseToDec(somador(A, B, SUM), 2));

    return 0;

}

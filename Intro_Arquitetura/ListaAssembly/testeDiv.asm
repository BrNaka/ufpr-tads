; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM N�MERO INTEIRO
; DE 0 AT� 9 E IMPRIMA SEU VALOR NA TELA.

include emu8086.inc
ORG 100h

    MOV AL, 11
    MOV BL, 2
    DIV BL
    
    MOV BL, AH
    
    PRINT '10 DIVIDIDOS POR 2   QUOCIENTE �: '
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48 
    INT 21H
    PUTC 0AH
    PUTC 0DH
    
    PRINT '10 DIVIDIDOS POR 2   RESTO �: '
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 48
    INT 21H
    PUTC 0AH
    PUTC 0DH
    
RET                                




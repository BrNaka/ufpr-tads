; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM NÚMERO INTEIRO
; DE 0 ATÉ 9 E IMPRIMA SEU VALOR NA TELA.

include emu8086.inc
ORG 100h

    PRINT 'INFORME UM NUMERO ENTRE 0-9: '
    MOV AH, 01H
    INT 21H
    PUTC 0AH
    PUTC 0DH
    SUB AL, 48
    MOV BL, AL
    PRINT 'O NUMERO INFORMADO FOI: '
    MOV AH, 02H
    ADD AL, 48
    MOV DL, AL
    INT 21h
    PUTC 0AH
    PUTC 0DH
    
RET                                




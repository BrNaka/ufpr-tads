; ESCREVA UM PROGRAMA EM ASSEMBLY QUE LEIA UM NUMERO E O IMPRIMA CASO ELE SEJA MAIOR QUE 20

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC

    PRINT 'DIGITE UM NÚMERO ENTRE 0-99: '
    MOV AH, 01H
    INT 21H
    
    SUB AL, 48
    CMP AL, 10
    JL  SEC_DIG
    
    
SEC_DIG:
    MOV BL, 10
    MUL BL
    MOV BL, AL
    INT 21H
    SUB AL, 48
    ADD AL, BL
    CMP AL, 20
    PUTC 0AH
    PUTC 0DH
    JG  MAIOR
    JLE MENOR

MAIOR:
    PRINT 'O NÚMERO É MAIOR QUE 20'
    PUTC 0AH
    PUTC 0DH
    JMP END_MAIN

MENOR:
    PRINT 'O NÚMERO É MENOR QUE 20'
    PUTC 0AH
    PUTC 0DH    
    JMP END_MAIN
    
END_MAIN:
    MOV AH, 4CH
    INT 21H
    
END     MAIN                 




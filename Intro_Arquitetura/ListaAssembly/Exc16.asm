; ESCREVA UM PROGRAMA ASSEMBLY QUE IMPRIMA OS 100 PRIMEIROS NUMEROS ÍMPARES DE 100 A 200

include emu8086.inc                      
.model small                                      
.stack 100h
.data      
    TAM EQU 0AH
    NUM DB TAM DUP(?)
                                                    
.code 

MAIN    PROC 
    
    MOV DI, 00H
    
INPUT_NUM:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM[DI], AL
    INC DI
    CMP DI, 0AH
    JL INPUT_NUM
    
    MOV DI, 00H
    MOV AX, 00H 
    PUTC 0AH
    PUTC 0DH
    
PRINT_NUM:
    MOV AH, 02H
    MOV DL, NUM[DI]
    ADD DL, 30H
    INC DI
    INT 21H
    CMP DI, 0AH
    JL PRINT_NUM

END     MAIN                 




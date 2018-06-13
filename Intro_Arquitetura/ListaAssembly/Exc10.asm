; ESCREVA UM PROGRAMA EM ASSEMBLY PARA DETERMINAR SE UM DADO NUMERO N É POSITIVO,
; NEGATICO OU NULO

include emu8086.inc                      
.model small                                      
.stack 100h
.data            
    TAM EQU 0AH
    INPUT_NUM DB TAM DUP(?)
    NUM DW ?
    CONT DW ?
                                           
.code 
MAIN    PROC  
    MOV DI, 00H

    PRINT 'INFORME UM NUMERO: '    
INPUT:    
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV INPUT_NUM[DI], AL
    INC DI 
    ADD AL, 48
    CMP AL, 0DH
    JNE INPUT    
    
    SUB DI, 01H
    MOV CX, DI
    MOV DI, 00H
    MOV CONT, CX 
    PUTC 0AH
    PUTC 0DH
    
COMPUTE_NUM:  
    MOV AX, 01H
    CMP CX, 01H
    JE MULT_NUM       
POTENCIA:
    MOV BX, 0AH
    MUL BX
    DEC CX     
    CMP CX, 01H
    JG POTENCIA    
MULT_NUM:    
    MOV CX, AX
    MOV AL, INPUT_NUM[DI]
    MOV BX, CX
    MUL BX
    ADD NUM, AX
    INC DI      
    MOV CX, CONT
    SUB CX, DI
    CMP DI, CONT
    JL COMPUTE_NUM          
    PUTC 0AH
    PUTC 0DH 
    
    MOV AX, NUM
    MOV BL, 3
    DIV BL
    CMP AH, 00H
    JE MULTIPLO
    JNE NAO_MULTIPLO
    
MULTIPLO:   
    PRINT 'É MULTIPLO DE 3'
    .Exit

NAO_MULTIPLO:
    PRINT 'NÃO É MULTIPLO DE 3'
    .Exit
              
END     MAIN                 




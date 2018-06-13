; ESCREVA UM PROGRAMA EM ASSEMBLY PARA DETERMINAR SE UM DADO NUMERO N É POSITIVO,
; NEGATICO OU NULO

include emu8086.inc                      
.model small                                      
.stack 100h
.data            
    TAM EQU 0AH
    INPUT_NUM DB TAM DUP(?)
    CONT DW ?
                                           
.code 
MAIN    PROC  
    
    MOV DI, 00H
    
    PRINT 'INFORME UM NÚMERO: '

INPUT:    
    MOV AH, 01H
    INT 21H
    MOV INPUT_NUM[DI], AL
    INC DI
    CMP AL, 0DH
    JNE INPUT
    
    MOV CONT, DI 
    MOV DI, 00H
    SUB CONT, 01H              
    PUTC 0AH
    PUTC 0DH
         
    PRINT 'NUMERO INFORMADO = '
PRINT_NUM:
    MOV AH, 02H  
    MOV DL, INPUT_NUM[DI]  
    INT 21H
    INC DI
    CMP DI, CONT
    JL PRINT_NUM 
    
    PUTC 0AH
    PUTC 0DH
    
    MOV DI, 0
    
    CMP INPUT_NUM[DI], 2DH ; SINAL DE MENOS   
    MOV AL, INPUT_NUM[DI]
    JE PRINT_NEG 
    JNE POS_OU_NULO
    
PRINT_NEG: 
    PRINT 'NUMERO NEGATIVO!'
    .Exit          
    
POS_OU_NULO:       
    CMP AL, 48
    JNE POSITIVO  
    JE NULO:
    
POSITIVO:
    PRINT 'NUMERO POSITIVO!'
    .Exit

NULO:
    PRINT 'NUMERO NULO!'
    .Exit
              
END     MAIN                 




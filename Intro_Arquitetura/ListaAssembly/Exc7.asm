; ESCREVA UM PROGRAMA EM ASSEMBLY QUE LEIA UM NUMERO E O IMPRIMA CASO ELE SEJA MAIOR QUE 20

include emu8086.inc                      
.model small                                      
.stack 100h
.data  
    TAM EQU 10     
    A DB TAM DUP(?)
    NUM DW ?
    cont DW ?
                                            
.code 
MAIN    PROC
          
    MOV DI, 00H   
    PRINT 'INFORME UM NUMERO MAIOR QUE 20: '      
    
INPUT_NUM:
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV A[DI], AL
    INC DI     
    ADD AL, 48
    CMP AL, 0DH
    JNE INPUT_NUM       
    
    SUB DI, 01H
    MOV CX, DI
    MOV DI, 00H
    MOV cont, CX 
    PUTC 0AH
    PUTC 0DH  
    
    MOV AH, 0  
    MOV NUM, 0 
    
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
    MOV AL, A[DI]
    MOV BX, CX
    MUL BX
    ADD NUM, AX
    INC DI      
    MOV CX, cont
    SUB CX, DI
    CMP DI, cont
    JL COMPUTE_NUM 
    
    MOV DI, 0 
    MOV AX, NUM
    CMP NUM, 20     
    JLE END_PROGRAM
    JG PRINT_MAIOR
       
PRINT_MAIOR:
    MOV AH, 02H
    MOV DL, A[DI]
    ADD DL, 48    
    INT 21H
    INC DI
    CMP DI, cont
    JL PRINT_MAIOR 
    .EXIT
    
END_PROGRAM:
    PRINT 'NUMERO MENOR OU IGUAL A 20!'
   .EXIT   
   
END     MAIN                 




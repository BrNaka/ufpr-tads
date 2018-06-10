; ESCREVA UM PROGRAMA ASSEMBLY QUE ESCREVA TODOS OS NÚMEROS INTEIROS DE 1 A 99 (EM ORDEM CRESCENTE)

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC
    
    MOV BL, 1  
    
LOOP1:
    MOV AH, 02H
    MOV AL, BL
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    
    INC BL
    CMP BL, 0AH
    PUTC 0AH
    PUTC 0DH
    JL LOOP1 
    JG LOOP2

LOOP2:         
    MOV AH, 0
    MOV AL, BL
    MOV CL, 10
    DIV CL
    MOV CL, AH   
    
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48
    INT 21H 
    
    MOV AH, 02H
    MOV DL, CL
    ADD DL, 48
    INT 21H
    
    INC BL
    CMP BL, 100
    PUTC 0AH
    PUTC 0DH
    JL  LOOP2
    JGE END_MAIN
        
    END_MAIN:
    MOV AH, 4CH
    INT 21H
        
END     MAIN                 




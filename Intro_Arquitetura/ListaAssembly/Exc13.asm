; ESCREVA UM PROGRAMA ASSEMBLY QUE ESCREVA TODOS OS NÚMEROS INTEIROS DE 100 A 99
; (EM ORDEM DECRESCENTE)

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC
    
    PRINT '100'
    PUTC 0AH
    PUTC 0DH
    
    MOV BL, 99

LOOP1:      
    MOV AX, 00H   
    MOV AL, BL
    MOV CX, 10
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
    
    DEC BL
    CMP BL, 10
    PUTC 0AH
    PUTC 0DH
    JGE  LOOP1
    
LOOP2:
    MOV AH, 02H
    MOV AL, BL
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    
    DEC BL
    CMP BL, 00H
    PUTC 0AH
    PUTC 0DH
    JGE LOOP2
        
END     MAIN                 




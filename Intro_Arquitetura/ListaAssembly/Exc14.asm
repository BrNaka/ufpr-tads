; ESCREVA UM PROGRAMA ASSEMBLY QUE ESCREVA TODOS OS NÚMEROS INTEIROS DE 100 A 200

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC

    MOV CL, 100
    MOV DI, 0
    
DIV_AGAIN:
    MOV AL, CL
    MOV AH, 0
    MOV BL, 100
    DIV BL
    MOV BL, AH
           
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    MOV AL, BL
    JMP CONTADOR   
        
CONTADOR:    
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV BL, AH
        
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48
    INT 21H         
             
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 48
    INT 21H   
    ADD CX, 1
    INC DI
    CMP DI, 100
    PUTC 0AH
    PUTC 0DH
    JLE DIV_AGAIN
        
END     MAIN                 




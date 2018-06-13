; ESCREVA UM PROGRAMA ASSEMBLY QUE IMPRIMA OS 100 PRIMEIROS NUMEROS ÍMPARES DE 100 A 200

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC
   
    MOV BL, 1 
    MOV DI, 0 
    
LOOP1:
    MOV AH, 02H
    MOV AL, BL
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    
    ADD BL, 2
    INC DI
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
    
    ADD BL, 2
    INC DI
    CMP BL, 100
    PUTC 0AH
    PUTC 0DH
    JL  LOOP2
 
    MOV AX, 00H
    MOV CL, BL
    
LOOP3:
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
    ADD CX, 2
    INC DI
    CMP DI, 100
    PUTC 0AH
    PUTC 0DH
    JLE LOOP3
        
    END_MAIN:
    MOV AH, 4CH
    INT 21H
        
END     MAIN                 




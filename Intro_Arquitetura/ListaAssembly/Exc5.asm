; ESCREVA UM PROGRAMA ASSEMBLY QUE IMPRIMA SE O VALOR É PAR OU ÍMPAR

include emu8086.inc                      
.model small                                      
.stack 100h
.data                                               
.code 

MAIN    PROC
    
    PRINT 'DIGITE UM NÚMERO: '
    MOV AH, 01H
    INT 21H 
    PUTC 0AH
    PUTC 0DH    
    
    SUB AL, 48
    AND AL, 01H
    JE NUM_PAR
    JNE NUM_IMPAR
    
    NUM_PAR:
    PRINT 'NUMERO PAR'
    JMP END_MAIN
    
    NUM_IMPAR:
    PRINT 'NUMERO IMPAR'
    
    END_MAIN:
    MOV AH, 4CH
    INT 21H
        
END     MAIN                 




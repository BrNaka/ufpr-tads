; ESCREVA UM PROGRAMA EM ASSEMBLY PARA DETERMINAR SE UM DADO NUMERO N É POSITIVO,
; NEGATICO OU NULO

include emu8086.inc                      
.model small                                      
.stack 100h
.data     
    TAM EQU 0AH
    A DB TAM DUP(?)
    B DB TAM DUP(?)
    NUM DW ?  
    NUM2 DW ?
    CONT DW ? 
    CONT2 DW ?
                                    
.code 
MAIN PROC
    MOV DI, 00H

    PRINT 'INFORME O NUMERO A: '    
INPUT:    
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV A[DI], AL
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
    MOV AL, A[DI]
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

    MOV DI, 00H
    MOV AX, 00H  
;
    PRINT 'INFORME O NUMERO B: '      
    
INPUT_NUM2:
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV B[DI], AL
    INC DI     
    ADD AL, 48
    CMP AL, 0DH
    JNE INPUT_NUM2       
    
    SUB DI, 01H
    MOV CX, DI
    MOV DI, 00H
    MOV CONT2, CX 
    PUTC 0AH
    PUTC 0DH  
    
    MOV AH, 0  
    MOV NUM2, 0 
    
COMPUTE_NUM2:  
    MOV AX, 01H
    CMP CX, 01H
    JE MULT_NUM2       
POTENCIA2:
    MOV BX, 0AH
    MUL BX
    DEC CX     
    CMP CX, 01H
    JG POTENCIA2    
MULT_NUM2:    
    MOV CX, AX
    MOV AL, B[DI]
    MOV BX, CX
    MUL BX
    ADD NUM2, AX
    INC DI      
    MOV CX, CONT2
    SUB CX, DI
    CMP DI, CONT2
    JL COMPUTE_NUM2
    PUTC 0AH
    PUTC 0DH
    
    MOV AX, NUM
    MOV BX, NUM2
    DIV BX
    CMP AH, 0
    JE DIVISIVEL
    JNE NAO_DIVISIVEL
    
DIVISIVEL:
    PRINT 'O NÚMERO A É DIVISÍVEL PELO NUMERO B!'
    PUTC 0AH
    PUTC 0DH
    .EXIT

NAO_DIVISIVEL:
    PRINT 'O NÚMERO A NÃO É DIVISÍVEL PELO NUMERO B!'
    PUTC 0AH
    PUTC 0DH
    .EXIT 
    
END     MAIN                 




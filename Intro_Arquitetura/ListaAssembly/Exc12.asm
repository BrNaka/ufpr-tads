; ESCREVA UM PROGRAMA EM ASSEMBLY QUE IMPRIMA QUAL O MENOR E QUAL O MAIOR VALOR DE DOIS NUMEROS
; A E B, LIDOS ATRAVES DO TECLADO

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
    
    MOV BX, NUM2
    CMP NUM, BX
    JLE A_MENOR
    JG A_MAIOR
    
A_MENOR:
    PRINT 'O NUMERO A É MENOR QUE O NUMERO B!'
    PUTC 0AH
    PUTC 0DH    
    MOV AX, 00H
    MOV AX, NUM
    JMP PRINT_NUM

A_MAIOR:
    PRINT 'O NUMERO A É MAIOR QUE O NUMERO B!'
    PUTC 0AH
    PUTC 0DH
    MOV AX, 00H
    MOV AX, NUM2
    JMP PRINT_NUM
    
PRINT_NUM:
    PRINT 'MENOR NUMERO: '
    CMP AL, 100
    JGE DIV_AGAIN
        
DIV_AGAIN:
    MOV AH, 0
    MOV BL, 100
    DIV BL
    MOV BL, AH
           
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    MOV AL, BL
    JMP CONT3
 
CONT3:    
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
    PUTC 0AH
    PUTC 0DH
    
    MOV AX, 00H
    MOV AX, NUM
    CMP AX, NUM2
    JLE A_MENOR_NUM2
    JG A_MAIOR_NUM2 

A_MENOR_NUM2:
    MOV AX, 00H
    MOV AX, NUM2 
    JMP PRINT_MAIOR
    
A_MAIOR_NUM2:
    MOV AX, 00H
    MOV AX, NUM
    JMP PRINT_MAIOR    
             
PRINT_MAIOR:     
    PRINT 'MAIOR NUMERO: '
    CMP AL, 100
    JGE DIV_AGAIN4
        
DIV_AGAIN4:
    MOV AH, 0
    MOV BL, 100
    DIV BL
    MOV BL, AH
           
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 48
    INT 21H   
    MOV AL, BL
    JMP CONT4   
        
CONT4:    
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
    .Exit   
    
END     MAIN                 
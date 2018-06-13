; CONSTRUA UM PROGRAMA EM ASSEMBLY QUE LEIA DOIS VALORES NUMERICOS E EFETUE A ADIÇÃO
; CASO O RESULTADO SEJA MAIOR QUE 10, APRESENTA-LO

include emu8086.inc                      
.model small                                      
.stack 100h
.data  
    TAM EQU 10     
    A DB TAM DUP(?)
    B DB TAM DUP(?)
    NUM DW ?
    NUM2 DW ?
    cont DW ?
    cont2 DW ?
                                            
.code 
MAIN    PROC
          
    MOV DI, 00H   
    PRINT 'INFORME O PRIMEIRO NUMERO: '      
    
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
    PUTC 0AH
    PUTC 0DH     
    
    MOV DI, 00H
    MOV AX, 00H  
;
    PRINT 'INFORME O SEGUNDO NUMERO: '      
    
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
    MOV cont2, CX 
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
    MOV CX, cont2
    SUB CX, DI
    CMP DI, cont2
    JL COMPUTE_NUM2
    PUTC 0AH
    PUTC 0DH
    
    MOV AX, NUM
    MOV BX, NUM2
    ADD AX, BX
     
    CMP AX, 10
    JLE END_MAIN 
    
    PRINT 'A SOMA É: '        
    CMP AX, 100
    JGE DIV_AGAIN
    JL  CONTADOR
        
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

END_MAIN:
    PRINT 'A SOMA É MENOR OU IGUAL A 10!'
    .Exit 
   
END     MAIN                 




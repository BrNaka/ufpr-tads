; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM NÚMERO INTEIRO
; DE 0 ATÉ 98 E IMPRIMA SUA SOMA.
include emu8086.inc                      
.model small
.stack 100h
.data                                             
    num1 db ?
    num2 db ?
    
.code
main proc
     
    PRINT 'NUMERO 1 (ENTRE 0-99): '
    MOV AH, 01H
    INT 21H 
                                     
    SUB AL, 48                                  
    MOV BL, 10                                 
    MUL BL                                      
    MOV BL, AL       
    
  
    MOV AH, 01H 
    INT 21H 
    
    SUB AL, 48                                  
    ADD AL, BL                                
    MOV num1, AL      
    PUTC 0AH
    PUTC 0DH          
    
    MOV AX, 0
    MOV BX, 0
    
    PRINT 'NUMERO 2 (ENTRE 0-99): '
    MOV AH, 01H
    INT 21H
    
    SUB AL, 48
    MOV BL, 10
    MUL BL    
    MOV BL, AL
    
    MOV AH, 01H
    INT 21H
    
    ADD AL, BL
    MOV num2, AL
    PUTC 0AH
    PUTC 0DH 
    
    MOV AX, 0
    MOV BX, 0
    
    PRINT 'A SOMA É: '
    MOV AL, num1
    MOV BL, num2
    ADD AL, BL
    
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
    
    MOV AH, 4CH
    INT 21H
    main endp 
    
end main                    




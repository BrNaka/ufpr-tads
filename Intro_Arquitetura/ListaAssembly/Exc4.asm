; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM NÚMERO INTEIRO
; DE 0 ATÉ 99 E IMPRIMA SUA SOMA.  

include emu8086.inc                      
.model small
.stack 100h
.data                                             
    num1 db ?
    num2 db ?
    
.code
MAIN    PROC
     
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
    
        PRINT 'NUMERO 2 (ENTRE 0-99): '
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
        MOV num2, AL
        PUTC 0AH
        PUTC 0DH  
    
        MOV AH, 0
    
        PRINT 'A SOMA É: '
        MOV AL, num1
        MOV BL, num2
        ADD AL, BL
        
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
        JMP CONT   
        
        CONT:    
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
  
        MOV AH, 4CH
        INT 21H     
        
END     MAIN                 




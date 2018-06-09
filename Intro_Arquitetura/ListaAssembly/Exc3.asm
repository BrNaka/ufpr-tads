; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM NÚMERO INTEIRO
; DE 0 ATÉ 98 E IMPRIMA SEU SUCESSOR E ANTECESSOR.
include emu8086.inc                      
.model small
.stack 100h
.data                                             
    ante db ?
    suce db ?
    num db ?
    
.code
main proc
     
    ; Lê o número da casa das dezenas
    PRINT 'INFORME UM NUMERO ENTRE 0-99: '
    MOV AH, 01H
    INT 21H 
                                     
    SUB AL, 48                                  ; Transforma em número decimal
    MOV BL, 10                                  ;
    MUL BL                                      ; Multiplico o número em AL por 10
    MOV BL, AL                                  ; Guardo o resultado no registrador BL
    
    ; Lê o número da casa das unidades
    MOV AH, 01H 
    INT 21H 
    
    SUB AL, 48                                  ; Transformo em número decimal
    ADD AL, BL                                  ; Somo o número multiplicado por 10 com o segundo número de entrada. Resultado em AL
    MOV num, AL                                 ; numero informado no teclado
    PUTC 0AH
    PUTC 0DH   
    
    ; ANTECESSOR
    MOV AL, num
    MOV ante, AL
    MOV AX, 0
    SUB ante, 1
    MOV AL, ante
    
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV BL, AH
    
    PRINT 'ANTECESSOR = '
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
    
    ; SUCESSOR
    MOV AL, num
    MOV suce, AL
    MOV AL, 0
    ADD suce, 1
    MOV AL, suce
    
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV BL, AH
    
    PRINT 'SUCESSOR = '
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




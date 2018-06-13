; ESCREVA UM PROGRAMA ASSEMBLY QUE LEIA UM NÚMERO INTEIRO
; DE 0 ATÉ 99 E IMPRIMA SEU VALOR NA TELA.
include emu8086.inc                      
.model small
.stack 100h
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
    
    MOV AX, 0
    ; Lê o número da casa das unidades
    MOV AH, 01H 
    INT 21H 
    
    SUB AL, 48                                  ; Transformo em número decimal
    ADD AL, BL                                  ; Somo o número multiplicado por 10 com o segundo número de entrada. Resultado em AL
    PUTC 0AH
    PUTC 0DH 
    
    MOV AH, 0                                   ; O dividendo está em AL. Logo, AH não pode conter nenhum bit! Por isso, MOV AH, 0. 
    MOV BL, 10                                  ;  
    DIV BL                                      ; Divido por 10. O quociente fica em AL, e o resto em AH.
    MOV BL, AH                                  ;
    
    PRINT 'O NUMERO INFORMADO FOI: '
    MOV AH, 02H                                 
    MOV DL, AL                                  ; Imprimo primeiro o quociente. 
    ADD DL, 48                                  ; Transformo em caractere somando 48
    INT 21h
    
    MOV AH, 02H
    MOV DL, BL                                  ; Imprimo o resto por segundo.
    ADD DL, 48                                  ; Transformo em caractere somando 48
    INT 21H
    PUTC 0AH
    PUTC 0DH
    
    MOV AH, 4CH
    INT 21H
    main endp 
    
end main                    




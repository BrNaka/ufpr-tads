; PROGRAMA PARA TESTAR O INPUT (ENTRE 0-255)

include emu8086.inc                      
.model small                                      
.stack 100h
.data
    num DB 4 DUP(?)                                               
.code 

MAIN    PROC
    
    MOV BL, 0   
    PRINT 'INFORME UM NÚMERO ENTRE 0-255: '
    
LOOP1:
    MOV AH, 01H
    INT 21H      
    SUB AL, 48
    MOV num[TYPE num * BL], AL
    INC BL
    CMP AL, 0DH
    JNE LOOP1
    JE COMPUTE_NUMBER

COMPUTE_NUMBER:
    

END_MAIN:
    MOV AH, 4CH
    INT 21H
    
END     MAIN                 




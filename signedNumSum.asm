.MODEL SMALL
.STACK 100
.DATA      

SIGN_DATA DB +25, -78, -95, +22, -69, +25, -85, +47, -39, -99
SUM DW ?
.CODE  
MOV AX,@DATA
MOV DS,AX 
XOR AX,AX             
  MOV BX, 10             ; # of elements
  XOR DX, DX            ; clear dx to store sum
  LEA SI, SIGN_DATA     ; MOV SI, OFFSET SIGN_DATA  
AGAIN:
  MOV AL, [SI]          ; next byte element
  CBW                   ; extend to word-sized
  ADD DX, AX            ; add to the sum           
  MOV SUM,DX            ; store dx in SUM
         
  INC SI                ; to next element of array
  DEC BX		; decrement counter
  JNZ AGAIN 

MOV AX,4C00H  		; exit
INT 21H
END      

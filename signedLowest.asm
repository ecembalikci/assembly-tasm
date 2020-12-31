.MODEL SMALL
.STACK 100
.DATA      

SIGN_DATA DB +25, -78, -95, +22, -69, +25, -85, +47, -39
LOWEST DW ?
.CODE  
MOV AX,@DATA
MOV DS,AX 
XOR AX,AX             
  MOV BX, 9             ; # of elements
  XOR DX, DX            ; clear dx to store sum
  MOV CX, 999           ; assign a current lowest
  LEA SI, SIGN_DATA     ;MOV SI, OFFSET SIGN_DATA  
AGAIN:
  MOV AL, [SI]          ; next byte element
  CBW                  
  ADD DX, AX            ; add to the sum
  CMP DX, CX            ; compare if it's less or not
  MOV LOWEST,DX           
  JNL NotLess
  MOV CX, DX         ; replace if less than previous lowest
  MOV LOWEST,CX           
NotLess:
  INC SI                ; next element of array
  DEC BX		; acts like a counter
  JNZ AGAIN 

MOV AX,4C00H		;exit
INT 21H
END         
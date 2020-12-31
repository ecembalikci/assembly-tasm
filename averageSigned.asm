.MODEL SMALL
.STACK 100
.DATA        

SIGN_DATA DB +25, -78, -95, +22, -69, +25, -85, +47, -39
SUM DW ?
AVERAGE DB ?
.CODE  
MOV AX,@DATA
MOV DS,AX 
XOR AX,AX             
  MOV BX, 9             ; # of elements in array
  XOR DX, DX            ; clear dx to store sum
  MOV SI, OFFSET SIGN_DATA  
AGAIN:
  MOV AL, [SI]          ; next byte element
  CBW                  
  ADD DX, AX            ; add to the sum           
  MOV SUM,DX            ; store dx in SUM
         
  INC SI                ; To next element of array
  DEC BX
  JNZ AGAIN 
  MOV AX,DX
  MOV BL,9 
  IDIV BL
  MOV AVERAGE,AL
MOV AX,4C00H
INT 21H
END 

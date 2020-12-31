.MODEL SMALL
.STACK 100
.DATA        

SIGN_DATA DB +25, -78, -95, +22, -69, +25, -85, +47, -39  
SUM DW ?  ; stored in DX
AVERAGE DB ? ; stored in AL
.CODE  
MOV AX,@DATA
MOV DS,AX 
XOR AX,AX             
  MOV BX, 9             ; # of elements in array
  XOR DX, DX            ; clear dx to store sum
  MOV SI, OFFSET SIGN_DATA  ; LEA SI, SIGN_DATA
AGAIN:
  MOV AL, [SI]          ; next byte element
  CBW                  
  ADD DX, AX            ; add to the sum           
  MOV SUM,DX            ; store DX in SUM
         
  INC SI                ; to next element of array
  DEC BX                ; decrement bx since it acts like a counter
  JNZ AGAIN 
  MOV AX,DX             ; store the sum in ax to divide it afterwards
  MOV BL,9 
  IDIV BL               ; divide sum into # of elements in array
  MOV AVERAGE,AL
MOV AX,4C00H            ; exit
INT 21H
END 

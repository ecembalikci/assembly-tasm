.MODEL SMALL
.STACK 100
.DATA
X DB 3 ; THESE NUMBERS CAN CHANGE OFC
Y DB 4
K DB 6
M DB 2
RESULT DW ?
.CODE
MOV AX,@DATA
MOV DS,AX 

XOR AX,AX ;CLEARING REGISTERS
XOR CX,CX
MOV AL,K   
MOV BL,M
DIV BL ;AL=3 
MOV CL,X
MUL CL ;AL=9
MOV RESULT,AX   
MOV AL,K
MOV BL,M
AGAIN:
DIV BL
CMP AH,BL ;6%2 = 0
JA AGAIN 
MOV AL,AH 
MUL CL    ;3*0=0
ADD RESULT,AX  ;9+0=9
MOV DX,RESULT  ;RESULT=9

MOV AX,4C00H ;RETURN TO DOS
INT 21H
END  


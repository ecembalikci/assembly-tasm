INCLUDE macro.dat
.MODEL SMALL
.STACK 100
.DATA
MESSAGE1 DB 'Please input your course ID:$'
MESSAGE2 DB 'Please input your current semester: $'
COURSE_ID DB 6, ?, 6 DUP ('$')
SEMESTER_NO DB ?
NEWLINE DB 0DH,0AH,'$'
.CODE
MOV AX, @DATA
MOV DS, AX
XOR AX,AX
PRINTSTRING MESSAGE1 ;call PRINTSTRING macro to display MESSAGE1
READSTRING COURSE_ID ;call READSTRING macro for user to enter course ID
PRINTSTRING NEWLINE ;call PRINTSTRING macro to have an empty line
PRINTSTRING MESSAGE2 ;call PRINTSTRING macro to display MESSAGE2
READCHAR ;call READCHAR macro for user to enter current semester no
CLEAR ;call CLEAR macro to clear the screen
CURSORMIDDLE ;call CURSORMIDDLE macro to have the output at center
PRINTSTRING COURSE_ID+2 ;system uses the first 2, that's why I added 2
; to see the difference try without it
CURSORMIDDLE1 ;call CURSORMIDDLE1 macro to have the semester no below course ID
PRINTCHAR SEMESTER_NO 
MOV AX,4C00H ;return to dos
INT 21H
END
.MODEL SMALL
.STACK 100
.DATA
.CODE
mov ax,1234h ; ANY NUMBER YOU LIKE(DON'T FORGET TO CHANGE CL ACCORDINGLY)
mov cl,8  ; LIKE A COUNTER 
rol ax,cl ; TO SHIFT 8 TIMES
END
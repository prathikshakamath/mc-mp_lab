.model small
.data
a db 50
b db 25
res db ?

.code
mov ax,@data
mov ds,ax
mov al,a
SUB al,b
mov res,al
mov ah,4ch
int 21h
end


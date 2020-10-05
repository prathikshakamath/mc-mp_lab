.model small
.data
a dw 90
b db 10
q db ?
r db ?

.code
mov ax,@data
mov ds,ax
mov ax,a
div b
mov q,al
mov r,ah

mov ah,4ch
int 21h
end

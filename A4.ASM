.model small
.data
a dw 25
b dw 50
res dw ?

.code
mov ax,@data
mov ds,ax
mov ax,a
SUB ax,b
mov res,ax
mov ah,4ch
int 21h
end


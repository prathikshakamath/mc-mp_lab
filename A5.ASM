.model small
.data
a db 10
b db 20
res dw ?

.code
mov ax,@data
mov ds,ax
mov al,a
mul b
mov res,al
mov ah,4ch
int 21h
end


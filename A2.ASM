.model small
.data
a dw 4000
b dw 1000
c dw ?
.code
    mov ax,@data
    mov ds,ax
    mov ax,a
    add ax,b
    mov c,ax
    mov ah,4ch
    int 21h
    end

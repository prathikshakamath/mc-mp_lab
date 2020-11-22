.model small

display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm

.data 
timestr db 020h dup(?)
msg1 db "current time::$"

.code
start:mov ax,@data
      mov ds,ax       ;clear the screen
      mov ah,00h
      mov al,03h
      int 10h
  ;set a particular location.for dynamic clock
ag:mov bh,00h
   mov dh,01h
   mov dl,01h
   mov ah,02h
   int 10h

   mov si,offset timestr ;lea si,timestr
   mov ah,2ch            ;interrupt for getting system time
   int 21h

   mov al,ch           
   aam              
   add ax,3030h
   mov [si],ah      ;31 timestr[00]=1
   inc si
   mov [si],al      ;32 timestr[01]=2
   inc si
   mov [si],byte ptr ':'
   inc si

   mov al,cl
   aam
   add ax,3030h
   mov [si],ah
   inc si
   mov [si],al
   inc si
   mov [si],byte ptr ':'
   inc si

   mov al,dh
   aam
   add ax,3030h 
   mov[si],ah
   inc si
   mov [si],al
   inc si
   mov [si],byte ptr '$'

display msg1
display timestr    ;display the time...
;check for the keyboard status..
;if key is pressed, terminate the program..
   mov ah,0bh
   int 21h
   cmp al,00h
   je ag
final:mov ah,4ch
   int 21h
end start

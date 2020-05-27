BITS 16

start:
mov ax, 07C0h
add ax, 288
mov ss, ax
mov sp, 4096

mov ax, 07C0h
mov ds, ax

mov si, text_string
call inicio

jmp $

text_string db 'Kernel de ejemplo echo por Terk', 0


inicio:
mov ah, 0Eh

bucle:
lodsb
cmp al, 0
je fin
int 10h
jmp bucle

fin:
times 510-($-$$) db 0
dw 0xAA55
mov ax, 9ch
mov ss, ax
mov sp, 4096d
mov ax, 7c0h
mov ds, ax
;Todo despues de aqui, sera parte del bootloader
mov ah, 0eh ;display string
mov al, 37h
int 10h
 
; Endless Loop
 
jmp $
 
 
 
times 510-($-$$) db 0
dw 0xAA55 ; Standard Computer Signature
 

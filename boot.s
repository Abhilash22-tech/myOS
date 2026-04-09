BITS 16
ORG 0x7C00

start:
    mov si, msg1
    call print

    call newline

    mov si, msg2
    call print

    call newline

    mov si, msg3
    call print

hang:
    jmp hang

; -----------------
; print function
; -----------------
print:
    mov ah, 0x0E

next:
    lodsb
    cmp al, 0
    je done
    int 0x10
    jmp next

done:
    ret

; -----------------
; newline function
; -----------------
newline:
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret

; -----------------
; messages
; -----------------
msg1 db "Minimal Operating System", 0
msg2 db "Built by Team Harsha Sareen Abhilash", 0
msg3 db "Boot Successful created by us!", 0

times 510 - ($ - $$) db 0
dw 0xAA55

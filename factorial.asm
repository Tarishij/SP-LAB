section .data

    x dd '3'
section .bss

    res resb 1
    
section .text
   global _start
_start:
    mov eax ,[x]
    sub eax,'0'
    mov ebx,eax
    mov eax ,1
looop:
    cmp ebx ,1
    je exit
    mul ebx
    dec ebx
    jmp looop
exit:
    add eax,'0'
    mov [res],eax
    mov eax,4
    mov ebx,1
    mov ecx,res
    mov edx,1
    int 80h

    mov eax,0
    mov ebx,1
    int 80h

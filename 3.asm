;largest and smallest among 3 numbers
;nasm

section .text

global _start

_start:

    mov eax, [x]
    cmp eax,[y]
    jl L1
    cmp eax,[z]
    jl L2
    mov [largest],eax
    jmp exit
L1:
    mov eax,[y]
    cmp eax,[z]
    jl L2
    mov [largest],eax
    jmp exit
L2:
  mov eax,[z]
   mov [largest],eax
   jmp exit
exit:
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, largest
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80
    jmp small

small:
    mov eax, [x]
    cmp eax,[y]
    jg l1
    cmp eax,[z]
    jg l2
    mov [smallest],eax
    jmp exit1
l1:
    mov eax,[y]
    cmp eax,[z]
    jg L2
    mov [smallest],eax
    jmp exit1
l2:
  mov eax,[z]
   mov [smallest],eax
   jmp exit1
exit1:
    mov     ecx, msg1
    mov     edx, len1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, smallest
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80
    
    mov     eax, 1
    int     0x80

section .data
    x dd '5'
    y dd '3'
    z dd '7'
    msg db  "largest ",0,10
    len equ $ - msg
    msg1 db 10,"smallest",0,10
    len1 equ $-msg1
    

segment .bss

    largest resb 1
    smallest resb 1
	

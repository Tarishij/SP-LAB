;fibonacci
;nasm:

section .text
    global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,x
    mov edx,1
    int 80h
    
    
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80h
    
    
    mov eax,4
    mov ebx,1
    mov ecx,y
    mov edx,1
    int 80h
    
    
    
    
l1:    

    mov ecx,[count]
    
    cmp ecx,'2'
    je exit
    
    sub ecx,'0'
    dec ecx
    add ecx ,'0'
    mov [count],ecx
    
    mov eax,[x]
    sub eax,'0'
    mov ebx,[y]
    sub ebx,'0'
    
    add eax,ebx
    add eax,'0'
    add ebx,'0'
    

    mov [z],eax
    
    
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80h
    
    mov eax,4
    mov ebx,1
    mov ecx,z
    mov edx,1
    int 80h
    
    
    
    mov ebx,[y]
    mov [x],ebx
    mov ebx,[z]
    mov [y],ebx
    
    
    loop l1
    
exit:
    
    mov eax,0
    mov ebx,1
    int 80h
    
    
    
    
section .bss
    
    z resb 1
section .data

    msg db 10
    len equ $ - msg
    x dd '0'
    y dd '1'
    count dd '7'

;pi(j*j)
;where i<=j<=n
;take i and j as command line argument
;nasm:


section .bss 
n resb 32
i resb 32
s resb 32

section .data
    forD: db '%d',10,0  
section .text
    extern printf
    extern atoi
    global main
main:
    push ebp
    mov ebp,esp
    mov ebx,dword[esp+12]
    mov ecx,[ebx+4]
    mov ebx,[ebx+8]
    
    push ecx
    call atoi
    mov [i],eax
    add esp,4
    
    push ebx
    call atoi
    mov [n],eax
    add esp,4
    
    mov eax,1
    mov [s],eax
loop:
    mov ebx,[i]
    mov eax,[i]
    mul ebx
    mov ebx,eax
    mov eax,[s]
    mul ebx
    mov [s],eax
    mov eax,[i]
    inc eax
    mov [i],eax
    mov ebx,[n]
    cmp eax,ebx
    jg end
    jmp loop
    
end:
    mov eax,[s]
    push eax
    push forD
    call printf
    add esp,8
    mov esp,ebp
    pop ebp
    ret 
    
    



bits 64

global start

section .text
start:
    mov rax, 0x2000004  ; código para sys_write
    mov rdi, 1          ; código que indica para escrever na saída padrão (terminal)
    mov rsi, msg        ; endereço da mensagem
    mov rdx, msg.len    ; tamanho da mensagem)
    syscall

    call print_newline
    call read_name
    call print_newline
    call print_name

    mov rax, 0x2000001  
    xor rdi, rdi
    syscall

read_name:
    mov rax, 0x2000003  ; código para sys_read
    mov rdi, 0          ; código que indica para ler da entrada padrão (teclado)
    mov rsi, name       ; endereço da variável name
    mov rdx, name_len   ; tamanho máximo da entrada do usuário
    syscall

    ret

print_name:
    mov rax, 0x2000004  ; código para sys_write
    mov rdi, 1          ; código que indica para escrever na saída padrão (terminal)
    mov rsi, saudacao   ; endereço da mensagem
    mov rdx, saudacao.len          ; tamanho da mensagem
    syscall

    mov rax, 0x2000004  ; código para sys_write
    mov rdi, 1          ; código que indica para escrever na saída padrão (terminal)
    mov rsi, name       ; endereço da variável name
    mov rdx, name_len   ; tamanho da mensagem
    syscall

    ret

print_newline:
    mov rax, 0x2000004  ; código para sys_write
    mov rdi, 1          ; código que indica para escrever na saída padrão (terminal)
    mov rsi, newline    ; endereço da mensagem
    mov rdx, newline.len          ; tamanho da mensagem
    syscall

    ret

print:
    mov rax, rdi                     ; primeiro argumento
    

section .bss
    name: resb name_len              ; espaço para armazenar o nome == 100 bytes

section .data
    name_len:   equ 100              ; tamanho máximo da entrada do usuário

    msg: db "Qual o seu nome?"       ; mensagem de saudação
    .len equ $-msg                   ; tamanho da mensagem

    saudacao: db "Bem vindo, "       ; mensagem de saudação
    .len equ $-saudacao              ; tamanho da mensagem

    newline: db 0xA                  ; nova linha // ou 10 em decimal
    .len equ $-newline               ; tamanho da mensagem
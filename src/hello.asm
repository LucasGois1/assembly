bits 64
global start

section .text

start:
    MOV rax, 0x2000003 ; system call para ler entrada do usuário
    MOV rdi, 0 ; file descriptor para entrada padrão (stdin)
    MOV rsi, name ; endereço do buffer para armazenar a entrada do usuário
    MOV rdx, name_len ; tamanho máximo da entrada do usuário
    syscall

print_hello:
    MOV rax, 0x2000004 ; system call para escrever na saída padrão (stdout)
    MOV rdi, 1 ; file descriptor para saída padrão (stdout)
    MOV rsi, msg ; endereço da mensagem "Hello "
    MOV rdx, msg.len ; tamanho da mensagem "Hello "
    syscall

print_name:
    MOV rax, 0x2000004 ; system call para escrever na saída padrão (stdout)
    MOV rdi, 1 ; file descriptor para saída padrão (stdout)
    MOV rsi, name ; endereço do buffer que armazena a entrada do usuário
    MOV rdx, name_len ; tamanho máximo da entrada do usuário
    syscall

finish:
    MOV rax, 0x2000001 ; system call para sair do programa
    MOV rdi, 0 ; código de saída do programa
    syscall

section .bss
    name resb 10 ; buffer para armazenar a entrada do usuário
    
section .data
    name_len:   equ 10 ; tamanho máximo da entrada do usuário

    msg:        db  "Hello " ; mensagem "Hello "
    .len:       equ $-msg ; tamanho da mensagem "Hello "

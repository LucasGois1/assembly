bits 64
global start


section .text
start:
    ; Carregando os valores em registradores
    mov r8, num1
    mov r9, num2

    ; Comparando os valores
    cmp r8, r9

    ; Saltando com base na comparação
    je iguais  ; Salta para "iguais" se os valores forem iguais
    jne diferentes  ; Salta para "diferentes" se os valores forem diferentes

iguais:
    ; Código a ser executado se os valores forem iguais
    ; ...

diferentes:
    ; Código a ser executado se os valores forem diferentes
    ; ...

    ; Saindo do programa
    mov rax, 0x2000001       ; Código de saída do programa
    xor rdi, rdi
    syscall

section .data
    num1 db 10
    num2 db 20

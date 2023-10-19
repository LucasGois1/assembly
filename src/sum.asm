bits 64
global start

section .text

start:
    MOV rax, 0x2000004
    MOV rdi, 1
    MOV rsi, msg_1
    MOV rdx, msg_1.len
    syscall

    MOV rax, 0x2000003
    MOV rdi, 0
    MOV rsi, op1
    MOV rdx, 1
    syscall

    MOV rax, 0x2000004
    MOV rdi, 1
    MOV rsi, msg_2
    MOV rdx, msg_2.len
    syscall

    MOV rax, 0x2000003
    MOV rdi, 0
    MOV rsi, op2
    MOV rdx, 1
    syscall

    MOV r8, op1
    MOV r9, op2
    ADD r8, r9

    MOV rax, 0x2000004
    MOV rdi, 1
    MOV rsi, r8
    MOV rdx, 2
    syscall

    MOV rax, 0x2000001
    MOV rdi, 0
    syscall


section .bss
    op1 resb 1
    op2 resb 1
    total resb 2


section .data
    msg_1: db "Digite o primeiro operando", 10
    .len: equ $-msg_1

    msg_2: db "Digite o segundo operando", 10
    .len: equ $-msg_2
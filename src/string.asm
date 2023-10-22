bits 64
global start

section .data
    test_argument: db "Lucas Gois",0     ; <- fim de uma string é representada por 0
    NEW_LINE: db 0xA
    .len equ $-NEW_LINE

section .text

exit:
    xor rdi, rdi
    mov rax, 0x2000001
    syscall

; Vamos iterar na string procurando o valor 0/nulo que marca o fim da string

; A expressão byte[rdi+rax] é uma forma de endereçamento de memória. Ela é usada para acessar um byte de 
; memória cujo endereço é calculado pela soma dos valores nos registradores RDI e RAX.

; RDI e RAX são registradores de propósito geral.
; [ ] indica que estamos lidando com uma referência à memória.
; byte especifica o tamanho do valor que estamos acessando, neste caso, um byte.
; O que a expressão faz é o seguinte:

; O valor contido no registrador RDI é tratado como um ponteiro para uma área de memória.
; O valor contido no registrador RAX é tratado como um deslocamento (offset) em relação ao ponteiro em RDI.
; A soma do valor em RDI e RAX é calculada, resultando em um endereço de memória.
; A instrução acessa o byte de memória localizado nesse endereço calculado.
; Em resumo, byte[rdi+rax] é usado para acessar um byte de memória cujo endereço é a soma dos valores nos registradores RDI e RAX. 

string_len:
    xor rax, rax                    ; zera o registrador rax pois será nosso counter inicializado com 0

.loop:
    cmp byte[rdi+rax], 0            ; Em resumo, estamos acessando apenas o primeiro byte/caracter a partir deste endereço e comparando com 0

    je .end                         ; se byte[rdi+rax] == 0 -> execute .end
                                    ; caso o jump pro fim não aconteça...
    inc rax                         ; incremente rax pois um caractere foi contado

    jmp .loop                       ; volte para o início do loop

.end:
    ret                             ; finaliza a execução da função


print_string:
    push rdi                        ; arg recebido em rdi, mesmo registrador que string_len vai ler
    call string_len

    mov rdx, rax                    ; mov o retorno de string_len para o buffer do write
    mov rax, 0x2000004              ; codigo de write
    pop rsi                         ; remove o valor da pilha e atribui em rsi (syscall le de rsi)
    mov rdi, 1                      ; seta a saida padrao como destino (terminal)
    syscall
    ret

print_chat:
    push rdi                        
    mov rdi, rsp
    call print_string
    pop rdi
    ret

print_newline:
    mov rax, 0x2000004              ; execute uma ação de escrita
    mov rdi, 1                      ; escreva na saida padrão (terminal)
    mov rsi, NEW_LINE               ; 
    mov rdx, NEW_LINE.len
    syscall
    ret


start:
    mov rdi, test_argument

    call print_string
    call print_newline
    call print_newline
    call print_newline

    call exit

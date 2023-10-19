# Assembly x86-64 Intel NASM

## Registradores

### Registrador RFLAGS

O registrador RFLAGS é um registrador especial de 64 bits em processadores x86 que contém várias flags que indicam o estado atual do processador. As flags mais comuns são:

- CF (Carry Flag): Indica se houve um overflow ou underflow em uma operação aritmética ou lógica. Por exemplo, se uma adição resultar em um valor maior do que o tamanho do registrador, o bit CF será definido para 1.
- AF (Auxiliary Carry Flag): Indica se houve um carry ou borrow na parte inferior de um byte em uma operação aritmética ou lógica. Essa flag é usada principalmente em operações com números BCD (Binary Coded Decimal).
- ZF (Zero Flag): Indica se o resultado de uma operação aritmética ou lógica é zero. Se o resultado for zero, o bit ZF será definido para 1.
- OF (Overflow Flag): Indica se houve um overflow ou underflow com sinal em uma operação aritmética ou lógica. Por exemplo, se uma subtração resultar em um valor menor do que o menor valor representável pelo tipo de dados, o bit OF será definido para 1.
- SF (Sign Flag): Indica se o resultado de uma operação aritmética ou lógica é negativo. Se o resultado for negativo, o bit SF será definido para 1.

A diferença entre OF e CF é que OF indica um overflow ou underflow com sinal, enquanto CF indica um carry ou borrow sem sinal. Em outras palavras, OF é usado para operações com números com sinal, enquanto CF é usado para operações com números sem sinal. Por exemplo, se você adicionar dois números com sinal e o resultado for maior do que o maior valor representável pelo tipo de dados, o bit OF será definido para 1. Se você adicionar dois números sem sinal e o resultado for maior do que o maior valor representável pelo tipo de dados, o bit CF será definido para 1.

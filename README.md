# Assembly x86-64 Intel NASM

## Como funciona um processador?

## Registradores

Registradores são elementos de armazenamento de alta velocidade localizados na Unidade de Processamento Central (CPU) de um computador. Eles são usados para armazenar dados temporários e informações que estão sendo processadas ativamente pela CPU. Os registradores são componentes fundamentais da arquitetura de um computador e desempenham um papel crucial no funcionamento do processamento de dados. Aqui estão algumas características e funções dos registradores:

1. **Armazenamento de Dados Temporários:** Os registradores são usados para armazenar dados temporariamente enquanto a CPU executa operações neles. Isso permite que a CPU realize cálculos e manipulações em dados rapidamente, sem a necessidade de acessar a memória principal.

2. **Operações Aritméticas e Lógicas:** Os registradores são usados ​​para armazenar operandos e resultados de operações aritméticas, lógicas e de manipulação de dados. Por exemplo, durante uma operação de adição, os valores a serem somados são temporariamente armazenados em registradores.

3. **Registro de Endereço e Controle:** Alguns registradores são usados para armazenar endereços de memória ou apontadores para localizar dados na memória principal. Eles também podem ser usados para armazenar informações de controle, como o estado atual da CPU.

4. **Acesso Rápido:** Os registradores estão localizados diretamente na CPU e oferecem acesso muito mais rápido do que a memória principal. Isso é fundamental para o desempenho do processamento de dados, uma vez que as operações podem ser realizadas mais rapidamente quando os dados estão disponíveis nos registradores.

5. **Quantidade Limitada:** A quantidade de registradores em uma CPU é limitada. O número e a capacidade de registradores variam entre diferentes arquiteturas de CPU. Geralmente, há um conjunto de registradores de propósito geral que podem ser usados para várias finalidades.

6. **Registradores Especiais:** Além dos registradores de propósito geral, algumas CPUs também possuem registradores especiais dedicados a funções específicas, como registradores de estado (para armazenar informações sobre o estado da CPU), registradores de ponto flutuante (para operações de números em ponto flutuante) e outros.

Os registradores desempenham um papel vital na execução de programas e operações de computador, permitindo que a CPU processe dados de maneira eficiente e rápida. Eles são uma parte essencial da arquitetura do computador e contribuem para o desempenho e a capacidade de processamento de dados do sistema.

### Registrador RFLAGS

O registrador RFLAGS é um registrador especial de 64 bits em processadores x86 que contém várias flags que indicam o estado atual do processador. As flags mais comuns são:

- CF (Carry Flag): Indica se houve um overflow ou underflow em uma operação aritmética ou lógica. Por exemplo, se uma adição resultar em um valor maior do que o tamanho do registrador, o bit CF será definido para 1.
- AF (Auxiliary Carry Flag): Indica se houve um carry ou borrow na parte inferior de um byte em uma operação aritmética ou lógica. Essa flag é usada principalmente em operações com números BCD (Binary Coded Decimal).
- ZF (Zero Flag): Indica se o resultado de uma operação aritmética ou lógica é zero. Se o resultado for zero, o bit ZF será definido para 1.
- OF (Overflow Flag): Indica se houve um overflow ou underflow com sinal em uma operação aritmética ou lógica. Por exemplo, se uma subtração resultar em um valor menor do que o menor valor representável pelo tipo de dados, o bit OF será definido para 1.
- SF (Sign Flag): Indica se o resultado de uma operação aritmética ou lógica é negativo. Se o resultado for negativo, o bit SF será definido para 1.

A diferença entre OF e CF é que OF indica um overflow ou underflow com sinal, enquanto CF indica um carry ou borrow sem sinal. Em outras palavras, OF é usado para operações com números com sinal, enquanto CF é usado para operações com números sem sinal. Por exemplo, se você adicionar dois números com sinal e o resultado for maior do que o maior valor representável pelo tipo de dados, o bit OF será definido para 1. Se você adicionar dois números sem sinal e o resultado for maior do que o maior valor representável pelo tipo de dados, o bit CF será definido para 1.

### Registradores controlados pelo sistema operacional

Os registradores CR0 até CR8 são registradores de controle em processadores x86 que controlam vários aspectos do funcionamento do processador e do sistema operacional. Cada registrador tem um propósito específico:

- CR0 (Control Register 0): Controla o modo de operação do processador, incluindo o modo protegido, o modo real e o modo virtual. Também controla a habilitação de caches, a proteção de memória e outras características do processador.
- CR1 (Control Register 1): Não é usado em processadores modernos.
- CR2 (Control Register 2): Contém o endereço da última página de memória que causou uma exceção de página. É usado para implementar a paginação de memória em sistemas operacionais.
- CR3 (Control Register 3): Contém o endereço da tabela de páginas do sistema operacional. É usado para implementar a paginação de memória em sistemas operacionais.
- CR4 (Control Register 4): Controla várias características do processador, incluindo a habilitação de extensões de arquitetura, a habilitação de caches, a proteção de memória e outras características.
- CR5 até CR7: Não são usados em processadores modernos.
- CR8 (Control Register 8): Controla a prioridade de interrupções em sistemas operacionais que usam o modelo de interrupções assíncronas.

Em geral, os registradores CR0 até CR4 são os mais importantes e são usados em sistemas operacionais para controlar a proteção de memória, a paginação de memória e outras características do processador. Os registradores CR2 e CR3 são usados especificamente para implementar a paginação de memória em sistemas operacionais. O registrador CR8 é usado em sistemas operacionais que usam o modelo de interrupções assíncronas para controlar a prioridade de interrupções.

## Pilha de hardware

A pilha de hardware é uma pilha de dados localizada na memória principal que é usada para armazenar dados temporários e endereços de retorno durante a execução de sub-rotinas. A pilha de hardware é usada principalmente para armazenar endereços de retorno, mas também pode ser usada para armazenar outros dados temporários. A pilha de hardware é usada em conjunto com o registrador RSP para armazenar e recuperar dados da pilha.

**RSP** é um registrador de 64 bits que contém o endereço base da pilha de hardware. O endereço base da pilha de hardware é o endereço do primeiro elemento da pilha. O endereço base da pilha de hardware é inicializado pelo sistema operacional durante a inicialização do processo. O endereço base da pilha de hardware é atualizado automaticamente pelo processador sempre que um elemento é adicionado ou removido da pilha com as instruções PUSH e POP respectivamente

## Interrupções

Interrupções são eventos imprevisíveis que interrompem a execução normal de um programa ou tarefa. Essas interrupções são usadas para lidar com eventos externos, como dispositivos de hardware, solicitações de entrada/saída, erros de hardware, temporizadores e outras situações que requerem atenção imediata do sistema. As interrupções desempenham um papel fundamental em sistemas operacionais e na interação entre hardware e software. Aqui estão os principais pontos relacionados a interrupções:

1. **Origem das Interrupções:** As interrupções podem ser geradas por várias fontes, como dispositivos de hardware (por exemplo, teclado, mouse, disco rígido, placa de rede), temporizadores, solicitações de E/S (entrada/saída), erros de hardware, eventos de software e assim por diante.

2. **Prioridade:** As interrupções podem ter níveis de prioridade, de modo que algumas são tratadas antes de outras. Isso permite que o sistema lide primeiro com as interrupções mais críticas ou urgentes.

3. **Manuseio de Interrupções:** Quando uma interrupção ocorre, o processador suspende temporariamente a execução do programa atual e transfere o controle para um tratador de interrupção (interrupt handler) específico, que é um trecho de código responsável por lidar com a interrupção. O tratador de interrupção executa as ações necessárias para atender à interrupção.

4. **Contexto de Execução:** O tratador de interrupção deve salvar o contexto da tarefa atual, incluindo registradores, contadores de programa e outros estados relevantes, antes de começar a lidar com a interrupção. Isso permite que a tarefa original seja retomada após o tratamento da interrupção.

5. **Retorno da Interrupção:** Após o tratamento da interrupção, o processador retorna ao estado anterior, recuperando o contexto da tarefa original e continuando a execução do programa a partir do ponto em que foi interrompido.

6. **Máscara de Interrupções:** Em muitos sistemas, é possível habilitar ou desabilitar interrupções, o que é útil em situações em que você deseja evitar interrupções durante uma operação crítica.

7. **Temporizadores e Relógio de Sistema:** Os temporizadores são frequentemente usados para gerar interrupções em intervalos regulares, o que é útil para manter um relógio de sistema preciso e para agendar tarefas em sistemas operacionais.

8. **Controladores de Interrupção:** Os controladores de interrupção são dispositivos de hardware que auxiliam na gestão e distribuição de interrupções. Eles ajudam a identificar a origem da interrupção e determinar qual tratador de interrupção deve ser chamado.

Em resumo, as interrupções são mecanismos críticos para permitir que um sistema de computador lide eficazmente com eventos externos e seja capaz de executar tarefas em segundo plano, como gerenciar dispositivos de hardware, monitorar eventos de tempo e fornecer serviços multitarefa. Eles desempenham um papel fundamental na estabilidade e na capacidade de resposta de sistemas computacionais.

## Assembly

Estrutura basica de um código assembly NASM para arquitetura Intel x86_64(Existem outras sintaxes de assembly):

```assembly
global _start

section .text
_start:
    ; codigo aqui

section .data
    ; dados aqui
```

### Instruções

As instruções são os comandos que o processador executa. Cada instrução é representada por um código de operação (opcode) que indica o tipo de instrução e os operandos que a acompanham. Os operandos podem ser registradores, valores imediatos, endereços de memória ou rótulos. Aqui estão alguns exemplos de instruções:

```assembly
mov eax, 0x1234 ; move o valor 0x1234 para o registrador eax
add eax, ebx ; adiciona o valor do registrador ebx ao registrador eax
jmp 0x1234 ; salta para o endereço 0x1234
```

### Syscalls

Syscalls são chamadas de sistemas para que seja possível interagir com o sistema operacional, como existem
niveis de privilégio, nenhum programa pode acessar diretamente os recursos do sistema operacional, então
é necessário fazer uma chamada de sistema para que o sistema operacional execute a ação desejada.

Para fazer uma syscall é necessário colocar o numero da syscall no registrador rax e os argumentos nos registradores

```assembly
mov rax, 1 ; numero da syscall

; registradores de argumentos disponíveis para syscalls, todas syscalls tem limite de 6 argumentos, os registradores são:

; rdi, rsi, rdx, r10, r8, r9

mov rdi, 1 ; primeiro argumento
mov rsi, 0x1234 ; segundo argumento
mov rdx, 0x5678 ; terceiro argumento
mov r10, 0x9abc ; quarto argumento
mov r8, 0xdef0 ; quinto argumento
mov r9, 0x1234 ; sexto argumento

syscall ; executa a syscall
```

    **Dica** 
    
    push rax ; salva o valor de rax na pilha (poderia ser outro registrador)
    pop rax ; recupera o valor de rax da pilha

    Portanto a pilha também pode ser usada para salvar valores de registradores

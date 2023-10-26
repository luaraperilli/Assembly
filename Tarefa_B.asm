.text
.globl main

main:
# Ler o primeiro valor
        li $v0, 5	# Carregar o valor 5 para ler um inteiro 
        syscall   # Realizar a syscall para ler o primeiro valor digitado pelo usuário
        move $t0, $v0   # Armazenar o valor lido em $t0 (maior valor até agora)

# Ler o segundo valor
        li $v0, 5
        syscall	# Realizar a syscall para ler o segundo valor digitado pelo usuário
        move $t1, $v0	# Armazenar o valor lido em $t1

# Comparar o segundo valor com o maior valor até agora
        ble $t0, $t1, terceiro_valor	# Se $t0 <= $t1, pular para terceiro_valor
        move $t0, $t1	# Caso contrário, atualizar o maior valor para $t1

terceiro_valor:
# Ler o terceiro valor
        li $v0, 5
        syscall	# Realizar a syscall para ler o terceiro valor digitado pelo usuário
        move $t2, $v0   # Armazenar o valor lido em $t2

# Comparar o terceiro valor com o maior valor até agora
        ble $t0, $t2, quarto_valor   # Se $t0 <= $t2, pular para quarto_valor
        move $t0, $t2   # Caso contrário, atualizar o maior valor para $t2

quarto_valor:
# Ler o quarto valor
        li $v0, 5
        syscall   # Realizar a syscall para ler o quarto valor digitado pelo usuário
        move $t3, $v0   # Armazenar o valor lido em $t3

# Comparar o quarto valor com o maior valor até agora
        ble $t0, $t3, maior_valor	# Se $t0 <= $t3, pular para maior_valor
        move $t0, $t3	# Caso contrário, atualizar o maior valor para $t3

maior_valor:
# Imprimir o maior valor encontrado
	li $v0, 1	# Carregar o valor 1 em $v0 (código da syscall para impressão de inteiro)
        move $a0, $t0	# Carregar o valor do maior valor em $a0 para impressão
        syscall   # Realizar a syscall para imprimir o maior valor

        li $v0, 10	# Carregar o valor 10 em $v0 (código da syscall para encerrar o programa)
        syscall	# Realizar a syscall para encerrar o programa

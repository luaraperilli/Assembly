.data
espaco: .asciiz "\n"

.text
.globl main

main:
	li $s0, 0	# Será usado para armazenar o total
	li $t0, 0	# Contador para controlar o início loop, ou seja, i = 0
	li $t1, 5	# Contador para controlar o fim do loop, ou seja, n = 5
	
inicio:
	sub $t2, $t1, $t0	# Calcula a diferença entre n e i
	beq $t2, $zero, fim	# Se a diferença for zero o contador termina e pula para o fim
	add $s0, $s0, $t0	# Acumula o valor de i no total, ou seja, total = total + i
	addi $t0, $t0, 1	# Incrementa o contador i, ou seja, i = i + 1
	j inicio	# Salto para o início do loop
	
fim:
# Exibe o total 
	li $v0, 1	# Código de chamada do sistema para imprimir um inteiro
	move $a0, $s0	# Move o valor do total para o registrador $a0
	syscall	# Chamada do sistema para exibir o valor
	
# Pular linha
	li $v0, 4	# Código de chamada do sistema para impressão de string
	la $a0, espaco	# Carrega o endereço da string
	syscall
	
# Termina o programa
	li $v0, 10	# Código de chamada do sistema para finalizar o programa
	syscall 
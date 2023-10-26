.data
espaco: .asciiz " "

.text
.globl main

main: 
# Ler valor inserido pelo usuário (N)
	li $v0, 5	# Código que lê o valor de entrada
	syscall

# Armazenar o valor N (inserido pelo usuário) em $s2 para determinar o número de iterações do loop
	move $s2, $v0

# Inicializar o contador e o número ímpar
	li $t0, 0	# Contador (i)
	li $t1, 1	# Número ímpar 
	
inicio:
# Teste de variável (verifica se o contador (i) é menor que N
	slt $t2, $t0, $s2	# $t2 = (i < N)
	beq $t2, $zero, fim	# Se (i >= N) pular para o fim

# Imprimir número ímpar
	li $v0, 1	# Código do syscall para imprimir um valor inteiro
	move $a0, $t1
	syscall 

# Imprimir o espaço
 	li $v0, 4	# Código para imprimir um inteiro
	la $a0, espaco
	syscall

# Incrementar o contador
	addi $t1, $t1, 2	# Número = número + 2 
	addi $t0, $t0, 1	# i = i + 1
	
	j inicio
	
fim: 
	li $v0, 10
	syscall
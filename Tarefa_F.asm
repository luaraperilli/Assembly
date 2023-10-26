.data
espaco: .asciiz " "

.text
.globl main

main: 
# Ler valor inserido pelo usu�rio (N)
	li $v0, 5	# C�digo que l� o valor de entrada
	syscall

# Armazenar o valor N (inserido pelo usu�rio) em $s2 para determinar o n�mero de itera��es do loop
	move $s2, $v0

# Inicializar o contador e o n�mero �mpar
	li $t0, 0	# Contador (i)
	li $t1, 1	# N�mero �mpar 
	
inicio:
# Teste de vari�vel (verifica se o contador (i) � menor que N
	slt $t2, $t0, $s2	# $t2 = (i < N)
	beq $t2, $zero, fim	# Se (i >= N) pular para o fim

# Imprimir n�mero �mpar
	li $v0, 1	# C�digo do syscall para imprimir um valor inteiro
	move $a0, $t1
	syscall 

# Imprimir o espa�o
 	li $v0, 4	# C�digo para imprimir um inteiro
	la $a0, espaco
	syscall

# Incrementar o contador
	addi $t1, $t1, 2	# N�mero = n�mero + 2 
	addi $t0, $t0, 1	# i = i + 1
	
	j inicio
	
fim: 
	li $v0, 10
	syscall
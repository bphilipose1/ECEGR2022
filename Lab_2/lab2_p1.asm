	.data

varZ: .word 0

	.text
main:
	addi a0, x0, 15 #A=15
	addi a1, x0, 10 #B=10
	addi a2, x0, 5  #C=5
	addi a3, x0, 2  #D=2
	addi a4, x0, 18 #E=18
	addi a5, x0, -3 #F=-3
	
	sub t1, a0, a1 # A-B
	mul t2, a2, a3 # C*D
	sub t3, a4, a5 # E-F
	div t4, a0, a2 # A/C
	
	add t5, t1, t2
	add t5, t5, t3
	sub t5, t5, t4
	
	sw t5, varZ, t6
	
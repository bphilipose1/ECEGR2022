.data


.text

main:
	addi s2, zero, 1
	
	addi, a2, zero, 3 #first function call
	jal Fibonacci
	add t0, zero, a0
	
	addi, a2, zero, 10 #second function call
	jal Fibonacci
	add t1, zero, a0 #assigns return value to b
	
	addi, a2, zero, 20 #third function call
	jal Fibonacci
	add t2, zero, a0 #assigns return value to c	
	
	li a7, 10
	ecall	



	


Fibonacci:

	#a2 is n
	
	BGE zero, a2, if1 #first if statement
	BEQ s2, a2, if2 #second if statement
		

	
	#Storing version of vars to stack
	addi sp, sp, -8 #sets 2 bytes of data size for stack
  	sw ra, 0(sp) #store return ra
  	sw a2, 4(sp) #store  n
  	
	addi a2, a2, -1#pass n-1

	jal Fibonacci
	
	add a4, zero, a0 #store returned value of first recursive call to a0
	
	#Restoring previous versoin of vars
	lw ra, 0(sp) #restore return adress
	lw a2, 4(sp) #restore n
  	addi sp, sp, 8
	
	
	

	
	#Storing version of vars to stack
	addi sp, sp, -12 #sets 2 bytes of data size for stack
  	sw ra, 0(sp) #store return ra
  	sw a2, 4(sp) #store  n
  	sw a4, 8(sp) #store  first recursive result
  	
  	
  	addi a2, a2, -2 #pass n-2
  	
	jal Fibonacci
	
	add a5, zero, a0 #store returned value of second recursive call to a0
	
	#Restoring previous versoin of vars
	lw ra, 0(sp) #restore return adress
	lw a2, 4(sp) #restore n
	lw a4, 8(sp) #restore first recursive result
	addi sp, sp, 12


	

	
	add a0, a4, a5 #set return value


	jr ra #back to main calling function
	
if1:
	add a0, zero, zero
	jr ra

if2:
	addi a0, zero, 1
	jr ra
	

	
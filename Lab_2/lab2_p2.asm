.data

varA: .word 15
varB: .word 15
varC: .word 6
varZ: .word 0

.text
main:
 #load all of the variables
  lw a0, varA
  lw a1, varB
  lw a2, varC
  lw a3, varZ
  
  #for first if command 
  slt t1, a0, a1 # A<B
  addi t3, t3, 5
  slt t2, t3, a2 #t2 = C > 5
  and t3, t1, t2 #checks if statement
  bne t3, zero, zed1 #branches to if body
  
  
  addi t1, a2, 1 # C+1
  andi t2, t1, 1 #checks else if second condition
  slt t3, a1, a0 # A>B  
  or t3, t1, t3 #checks else if statement
  bne t3, zero, zed2 #branches to else if body
  
  and t4, t5, zero #checks if cond failed
  and t3, t6, zero #checks if else cond failed
  and t5, t3, t4 #checks if both if and ifelse cond failed together
  beq t5, zero, zed3#branches to else statement
  


zed1:
  addi a3, zero, 1
  j case
zed2:
  addi a3, zero, 2
  j case
zed3:
  addi a3, zero, 3
  j case
  
case:
  addi t1, zero, 1
  addi t2, zero, 2
  addi t3, zero, 3
  
  beq a3, t1, c1
  beq a3, t2, c2
  beq a3, t3, c3
  
  add a3, zero, zero
  
c1:
   addi a3, zero, -1
   j fin
c2:
   addi a3, zero, -2
   j fin
c3:
   addi a3, zero, -3
   j fin

fin:
 sw a3, varZ, s5 # assign varZ value stored in a3 
 sw a2, varC, s4 # assign varZ value stored in a2 
 sw a1, varB, s3 # assign varZ value stored in a1
 sw a0, varA, s2 # assign varZ value stored in a0 


.data
a: .word 0
b: .word 0
c: .word 0

.text
main:
  lw t3, a
  lw s4, b
  lw s5, c
  
  addi sp, sp, -8 #sets 2 bytes of data size for stack
  
  addi t0, zero, 5 #i=5
  addi t1, zero, 10 #j=10

  sw t0, 0(sp)
  sw t1, 4(sp)
  

  addi sp, sp, 0  #puts parameter to i
  jal AddItUp #  AddItUp(i)
  add t3, zero, a0 #  a=AddItUp( i )
  

  
  addi sp, sp, 4  #puts parameter to j
  jal AddItUp #  AddItUp(j)
  add t4, zero, a0 #  b=AddItUp( j )
  
  add t5, t3, t4 # c = a + b
  
  #restore i and j values into t0 and t1

  lw t0, -4(sp)
 
  lw t1, 0(sp)
  
  sw t3, a, s2 # assign varZ value stored in a0
  sw t4, b, s3 # assign varZ value stored in a1
  sw t5, c, s4 # assign varZ value stored in a1  
  
  li a7, 10 #system exit 
  ecall
  
AddItUp:
  
  add t1, zero, zero #x=0
  add t0, zero, zero #i=0
  j forLoop

forLoop:
  lw a2, 0(sp) #stores parameter into a2
  bge t0, a2, exitFunc #check exit condition for loop
  
  #for loop body
  add t1, t1, t0 #x=x+i
  addi t1, t1, 1 #x=x+i+1

  addi t0, t0, 1 #increment i
  
  j forLoop
  
exitFunc:
  add a0, t1, zero #set value of x 
  jr ra #return to adress stored in ra

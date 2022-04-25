.data
A: .space 20
   .word
B: .word 1, 2, 4, 8, 16

.text

main:
  la a0, A
  la a1, B
  add t1, zero, zero #sets increment value to 0
forLoop:
  addi t2, zero, 5
  bge t1, t2, midStep #check exit condition for loop
  
  #Loop body 
  addi t0, zero, 4
  mul t3, t1, t0
  add t4, t3, a0 #sets t4 to A elements wanted adress
  add t5, t3, a1 #sets t5 to B elements wanted adress
  lw t6, 0(t5) #loads B(i)
  addi t6, t6, -1 # B(i) - 1
  sw t6, 0(t4) #A = B(i) - 1
  
  
  addi t1, t1, 1 #increment statement
  j forLoop #start next iteration
    
midStep: 
 addi t1, t1, -1
 j while

while:
  bge zero, t1, fin# check exit condition for loop

  #body statement
  mul t3, t1, t0
  add t4, t3, a0 #sets t4 to A elements wanted adress
  add t5, t3, a1 #sets t5 to B elements wanted adress
  lw t2, 0(t4) #loads A(i)
  lw t6, 0(t5) #loads B(i)
  add t6, t2, t6 # B[i]+A[i]
  addi a3, zero, 2

  mul t6, t6, a3  #2 * (B[i]+A[i])
  
  sw t6, 0(t4) #A = 2 * (B[i]+A[i])
  
  
  addi t1, t1, -1 #deincrement statement
  j while
   
fin:
  li a7, 10
  ecall

 

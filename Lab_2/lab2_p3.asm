.data

varZ: .word 2
varI: .word 0
.text
.main
  lw a0, varZ
  lw a1, varI
  j forLoop

forLoop:
  addi t3, zero, 20
  blt t3, a1 doLoop #check exit condition for loop

  addi a0, a0, 1 #for loop body statement
  addi a1, a1, 2 #increment statement
  j forLoop #start next iteration
    
doLoop:
  addi a0, a0, 1 #do loop body statement
  
  addi t2, zero, 100
  blt a0, t2, doLoop# reiterate while Z<100
  j while #go to while loop when done
   

while:
  bge zero, a1, fin# check exit condition for loop
  addi t5, zero, 1
  sub a0, a0, t5
  sub a1, a1, t5  
  j while
  
  
fin:
 sw a0, varZ, s2 # assign varZ value stored in a0
 sw a1, varI, s3 # assign varZ value stored in a1 


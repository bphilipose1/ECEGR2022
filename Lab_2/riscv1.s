addi x6, x0, 15
addi x7, x0, 10
addi x28, x0, 5
addi x29, x0, 2
addi x30, x0, 18
addi x31, x0, 3

sub x7, x6, x7
mul x29, x28, x29
add x30, x30, x31 #since x31 supposed to be a negative two negative make a positive
div x6, x6, x28

sub x6, x30, x6
add x6, x6, x29
add x6, x6, x7


 
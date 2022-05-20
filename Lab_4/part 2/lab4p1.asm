.data
	message: .asciz "Enter Farenheit: "
 	Cel1:	.float	32.00
 	Cel2:	.float	5.00
 	Cel3:	.float	9.00
 	Keladd:	.float	273.15
 	finMess1: .asciz "Celcius Conversion: "
 	finMess2: .asciz "Kelvin Conversion: "
 	newln:	.asciz	"\r\n"
.text

main:
	li	a7,4			#system call for print string
	la	a0,message
	ecall
	li	a7,6			#system call for reading int
	ecall
	fmv.s	ft1,fa0 #store input float to ft1

	jal toCelc
	jal toKelv

	j fin

	
	
toCelc:
	flw	fa2, Cel1, t0	#store Cel1 to fa2
	flw	fa3, Cel2, t1	#store Cel2 to fa3
	flw	fa4, Cel3, t2	#store Cel3 to fa4
	fsub.s ft5, ft1, fa2
	fdiv.s ft6, fa3, fa4
	fmul.s fa0, ft5, ft6 #final part of celcius conversion
	jr ra
toKelv:
	flw    fa5, Keladd, t3	#store Keladd to memory
	fadd.s fa1, fa0, fa5 #final Kelv computation
	jr ra
	
fin: 
	li	a7,4			#system call for print string
	la	a0,finMess1
	ecall
	li	a7,2			#system call for printing float fa0 in ascii
	ecall
	
	li	a7,4			#system call for print string
	la	a0,newln
	ecall
	
	li	a7,4			#system call for print string
	la	a0,finMess2
	ecall
	fmv.s fa0, fa1
	li	a7,2			#system call for printing float fa0 in ascii
	ecall


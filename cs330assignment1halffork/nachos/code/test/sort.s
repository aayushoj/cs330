	.file	1 "sort.c"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, extra= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	subu	$sp,$sp,40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	jal	__main
	sw	$0,16($fp)
$L2:
	lw	$2,16($fp)
	slt	$2,$2,1024
	bne	$2,$0,$L5
	j	$L3
$L5:
	lw	$2,16($fp)
	sll	$3,$2,2
	la	$2,A
	addu	$4,$3,$2
	li	$3,1024			# 0x400
	lw	$2,16($fp)
	subu	$2,$3,$2
	sw	$2,0($4)
	lw	$2,16($fp)
	addu	$2,$2,1
	sw	$2,16($fp)
	j	$L2
$L3:
	sw	$0,16($fp)
$L6:
	lw	$2,16($fp)
	slt	$2,$2,1023
	bne	$2,$0,$L9
	j	$L7
$L9:
	lw	$2,16($fp)
	sw	$2,20($fp)
$L10:
	li	$3,1023			# 0x3ff
	lw	$2,16($fp)
	subu	$3,$3,$2
	lw	$2,20($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L13
	j	$L8
$L13:
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A
	addu	$4,$3,$2
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A+4
	addu	$2,$3,$2
	lw	$3,0($4)
	lw	$2,0($2)
	slt	$2,$2,$3
	beq	$2,$0,$L12
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,24($fp)
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A
	addu	$4,$3,$2
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A+4
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$2,20($fp)
	sll	$3,$2,2
	la	$2,A+4
	addu	$3,$3,$2
	lw	$2,24($fp)
	sw	$2,0($3)
$L12:
	lw	$2,20($fp)
	addu	$2,$2,1
	sw	$2,20($fp)
	j	$L10
$L8:
	lw	$2,16($fp)
	addu	$2,$2,1
	sw	$2,16($fp)
	j	$L6
$L7:
	lw	$4,A
	jal	system_Exit
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$31
	.end	main

	.comm	A,4096

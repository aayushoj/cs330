	.file	1 "vectorsum.c"
	.rdata
	.align	2
$LC0:
	.ascii	"Vectorsum started\n\000"
	.align	2
$LC1:
	.ascii	"../test/printtest\000"
	.align	2
$LC2:
	.ascii	"Total sum: \000"
	.align	2
$LC3:
	.ascii	"Executed instruction count: \000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,432,$31		# vars= 408, regs= 2/0, args= 16, extra= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	subu	$sp,$sp,432
	sw	$31,428($sp)
	sw	$fp,424($sp)
	move	$fp,$sp
	jal	__main
	sw	$0,420($fp)
	la	$4,$LC0
	jal	system_PrintString
	la	$4,$LC1
	jal	system_Exec
	sw	$0,416($fp)
$L2:
	lw	$2,416($fp)
	slt	$2,$2,100
	bne	$2,$0,$L5
	j	$L3
$L5:
	lw	$2,416($fp)
	sll	$3,$2,2
	addu	$2,$fp,16
	addu	$3,$3,$2
	lw	$2,416($fp)
	sw	$2,0($3)
	lw	$2,416($fp)
	addu	$2,$2,1
	sw	$2,416($fp)
	j	$L2
$L3:
	sw	$0,416($fp)
$L6:
	lw	$2,416($fp)
	slt	$2,$2,100
	bne	$2,$0,$L9
	j	$L7
$L9:
	lw	$2,416($fp)
	sll	$3,$2,2
	addu	$2,$fp,16
	addu	$2,$3,$2
	lw	$3,420($fp)
	lw	$2,0($2)
	addu	$2,$3,$2
	sw	$2,420($fp)
	lw	$2,416($fp)
	addu	$2,$2,1
	sw	$2,416($fp)
	j	$L6
$L7:
	la	$4,$LC2
	jal	system_PrintString
	lw	$4,420($fp)
	jal	system_PrintInt
	li	$4,10			# 0xa
	jal	system_PrintChar
	la	$4,$LC3
	jal	system_PrintString
	jal	system_GetNumInstr
	move	$4,$2
	jal	system_PrintInt
	li	$4,10			# 0xa
	jal	system_PrintChar
	move	$4,$0
	jal	system_Exit
	move	$2,$0
	move	$sp,$fp
	lw	$31,428($sp)
	lw	$fp,424($sp)
	addu	$sp,$sp,432
	j	$31
	.end	main

f1:
	beq	$4,$0,$L61
	nop

	li	$2,65536			# 0x10000
	sltu	$2,$4,$2
	beq	$2,$0,$L62
	li	$7,-65536			# 0xffffffffffff0000

	move	$3,$4
	move	$2,$0
	li	$6,65536			# 0x10000
$L6:
	sll	$3,$3,1
	sltu	$5,$3,$6
	bne	$5,$0,$L6
	addu	$2,$2,$7

$L5:
	li	$5,131072			# 0x20000
	sltu	$5,$3,$5
	bne	$5,$0,$L7
	li	$7,65536			# 0x10000

	li	$6,131072			# 0x20000
$L57:
	srl	$3,$3,1
	sltu	$5,$3,$6
	beq	$5,$0,$L57
	addu	$2,$2,$7

$L7:
	multu	$4,$4
	mfhi	$6
	sll	$4,$6,16
	srl	$5,$6,16
	mflo	$7
	srl	$3,$7,16
	beq	$5,$0,$L63
	or	$3,$4,$3

	sll	$4,$5,31
$L64:
	srl	$3,$3,1
	or	$3,$4,$3
	li	$4,32768			# 0x8000
	addu	$2,$2,$4
	srl	$5,$5,1
	mult	$5,$3
$L79:
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L42
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L65
	sll	$4,$6,31

$L11:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L43
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L66
	sll	$4,$6,31

$L13:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L44
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L67
	sll	$4,$6,31

$L15:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L45
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L68
	sll	$4,$6,31

$L17:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L46
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L69
	sll	$4,$6,31

$L19:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L47
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L70
	sll	$4,$6,31

$L21:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L48
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L71
	sll	$4,$6,31

$L23:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L49
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L72
	sll	$4,$6,31

$L25:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L50
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L73
	sll	$4,$6,31

$L27:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L51
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L74
	sll	$4,$6,31

$L29:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L52
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L75
	sll	$4,$6,31

$L31:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L53
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L76
	sll	$4,$6,31

$L33:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L54
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L77
	sll	$4,$6,31

$L35:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L55
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	beq	$4,$0,$L78
	sll	$4,$6,31

$L37:
	mult	$6,$3
	mflo	$6
	sll	$6,$6,1
	nop
	multu	$3,$3
	mfhi	$4
	addu	$4,$6,$4
	sll	$7,$4,16
	mflo	$5
	srl	$6,$4,16
	srl	$3,$5,16
	bne	$6,$0,$L56
	or	$3,$7,$3

	li	$4,131072			# 0x20000
	sltu	$3,$3,$4
	bne	$3,$0,$L80
	nop

$L56:
	addiu	$2,$2,1
$L80:
	j	$31
	nop

$L55:
	sll	$4,$6,31
$L78:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L37
	addiu	$2,$2,2

$L54:
	sll	$4,$6,31
$L77:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L35
	addiu	$2,$2,4

$L53:
	sll	$4,$6,31
$L76:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L33
	addiu	$2,$2,8

$L52:
	sll	$4,$6,31
$L75:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L31
	addiu	$2,$2,16

$L51:
	sll	$4,$6,31
$L74:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L29
	addiu	$2,$2,32

$L50:
	sll	$4,$6,31
$L73:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L27
	addiu	$2,$2,64

$L49:
	sll	$4,$6,31
$L72:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L25
	addiu	$2,$2,128

$L48:
	sll	$4,$6,31
$L71:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L23
	addiu	$2,$2,256

$L47:
	sll	$4,$6,31
$L70:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L21
	addiu	$2,$2,512

$L46:
	sll	$4,$6,31
$L69:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L19
	addiu	$2,$2,1024

$L45:
	sll	$4,$6,31
$L68:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L17
	addiu	$2,$2,2048

$L44:
	sll	$4,$6,31
$L67:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L15
	addiu	$2,$2,4096

$L43:
	sll	$4,$6,31
$L66:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L13
	addiu	$2,$2,8192

$L42:
	sll	$4,$6,31
$L65:
	srl	$3,$3,1
	or	$3,$4,$3
	srl	$6,$6,1
	b	$L11
	addiu	$2,$2,16384

$L61:
	j	$31
	li	$2,-2147483648			# 0xffffffff80000000

$L63:
	li	$4,131072			# 0x20000
	sltu	$4,$3,$4
	bne	$4,$0,$L79
	mult	$5,$3

	b	$L64
	sll	$4,$5,31

$L62:
	b	$L5
	move	$3,$4

f2:
	mult	$5,$4
	mfhi	$4
	mflo	$3
	bltz	$4,$L85
	move	$2,$4

	srl	$3,$3,16
	sll	$2,$2,16
	j	$31
	or	$2,$2,$3

$L85:
	li	$5,65535			# 0xffff
	addu	$4,$3,$5
	sltu	$3,$4,$3
	addu	$2,$3,$2
	move	$3,$4
	srl	$3,$3,16
	sll	$2,$2,16
	j	$31
	or	$2,$2,$3

f3:
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
	move	$2,$4
	sra	$4,$4,31
	move	$6,$5
	lw	$25,%call16(__divdi3)($28)
	srl	$3,$2,16
	sll	$4,$4,16
	move	$7,$6
	or	$4,$3,$4
	sll	$5,$2,16
	jalr	$25
	sra	$6,$6,31

	lw	$31,28($sp)
	move	$2,$3
	j	$31
	addiu	$sp,$sp,32


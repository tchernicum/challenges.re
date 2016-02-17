f2:
	addiu	$sp,$sp,-112
	addiu	$2,$5,1
	sw	$18,80($sp)
	sw	$17,76($sp)
	sw	$16,72($sp)
	sw	$31,108($sp)
	sw	$fp,104($sp)
	sw	$23,100($sp)
	sw	$22,96($sp)
	sw	$21,92($sp)
	sw	$20,88($sp)
	sw	$19,84($sp)
	sw	$5,116($sp)
	sw	$4,112($sp)
	sw	$6,120($sp)
	sw	$2,56($sp)
	li	$17,42			# 0x2a
	li	$18,36			# 0x24
	li	$16,46			# 0x2e
$L68:
	lw	$3,116($sp)
	nop
	lb	$3,0($3)
	nop
	beq	$3,$0,$L2
	sw	$3,44($sp)

	lw	$3,56($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$17,$L89
	move	$4,$3

	lw	$3,44($sp)
	lw	$9,120($sp)
	sw	$2,44($sp)
	beq	$3,$18,$L90
	move	$6,$2

$L47:
	lb	$5,0($9)
	nop
	beq	$5,$0,$L2
	addiu	$9,$9,1

	beq	$3,$16,$L48
	nop

	bne	$3,$5,$L2
	nop

$L48:
	beq	$2,$0,$L2
	move	$3,$6

	lb	$2,1($4)
	nop
	beq	$2,$17,$L75
	addiu	$5,$4,1

	move	$4,$5
	bne	$3,$18,$L47
	move	$6,$2

$L90:
	bne	$2,$0,$L47
	nop

	lb	$2,0($9)
	nop
	beq	$2,$0,$L50
	li	$2,1			# 0x1

$L2:
	lw	$3,120($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$0,$L51
	nop

	addiu	$3,$3,1
	sw	$3,120($sp)
	lw	$3,112($sp)
	nop
	beq	$2,$3,$L68
	nop

	beq	$3,$16,$L68
	nop

$L51:
	b	$L50
	move	$2,$0

$L75:
	sw	$6,44($sp)
	addiu	$2,$4,3
$L99:
	addiu	$4,$4,2
	sw	$2,48($sp)
	sw	$4,52($sp)
	sw	$9,36($sp)
$L67:
	lw	$3,52($sp)
	nop
	lb	$7,0($3)
	nop
	beq	$7,$0,$L6
	nop

	lw	$3,48($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$17,$L91
	move	$4,$3

	move	$3,$7
	lw	$fp,36($sp)
	beq	$3,$18,$L92
	move	$7,$2

$L41:
	lb	$5,0($fp)
	nop
	beq	$5,$0,$L6
	addiu	$fp,$fp,1

	beq	$3,$16,$L42
	nop

	bne	$3,$5,$L6
	nop

$L42:
	beq	$2,$0,$L6
	move	$3,$7

	lb	$2,1($4)
	nop
	beq	$2,$17,$L8
	addiu	$5,$4,1

	move	$4,$5
	bne	$3,$18,$L41
	move	$7,$2

$L92:
	bne	$2,$0,$L41
	nop

	lb	$2,0($fp)
	nop
	beq	$2,$0,$L50
	li	$2,1			# 0x1

$L6:
	lw	$3,36($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$0,$L2
	addiu	$3,$3,1

	sw	$3,36($sp)
	lw	$3,44($sp)
	nop
	beq	$3,$2,$L67
	nop

	beq	$3,$16,$L67
	nop

	b	$L2
	nop

$L91:
	lw	$fp,36($sp)
	lw	$4,52($sp)
	nop
$L8:
	addiu	$2,$4,3
	addiu	$4,$4,2
	sw	$2,32($sp)
	sw	$4,40($sp)
	sw	$fp,24($sp)
$L66:
	lw	$3,40($sp)
	nop
	lb	$22,0($3)
	nop
	beq	$22,$0,$L10
	nop

	lw	$3,32($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$17,$L93
	move	$4,$3

	move	$3,$22
	lw	$21,24($sp)
	beq	$3,$18,$L94
	move	$22,$2

$L35:
	lb	$5,0($21)
	nop
	beq	$5,$0,$L10
	addiu	$21,$21,1

	beq	$3,$16,$L36
	nop

	bne	$3,$5,$L10
	nop

$L36:
	beq	$2,$0,$L10
	move	$3,$22

	lb	$2,1($4)
	nop
	beq	$2,$17,$L12
	addiu	$5,$4,1

	move	$4,$5
	bne	$3,$18,$L35
	move	$22,$2

$L94:
	bne	$2,$0,$L35
	nop

	lb	$2,0($21)
	nop
	beq	$2,$0,$L50
	li	$2,1			# 0x1

$L10:
	lw	$3,24($sp)
	nop
	lb	$2,0($3)
	nop
	beq	$2,$0,$L6
	addiu	$3,$3,1

	beq	$7,$2,$L66
	sw	$3,24($sp)

	beq	$7,$16,$L66
	nop

	b	$L6
	nop

$L93:
	lw	$21,24($sp)
	lw	$4,40($sp)
	nop
$L12:
	addiu	$3,$4,3
	addiu	$4,$4,2
	sw	$4,28($sp)
$L65:
	lw	$2,28($sp)
	nop
	lb	$20,0($2)
	nop
	beq	$20,$0,$L14
	nop

	lb	$2,0($3)
	nop
	beq	$2,$17,$L95
	move	$fp,$3

	move	$4,$20
	move	$19,$21
	beq	$4,$18,$L96
	move	$20,$2

$L29:
	lb	$5,0($19)
	nop
	beq	$5,$0,$L14
	addiu	$19,$19,1

	beq	$4,$16,$L30
	nop

	bne	$4,$5,$L14
	nop

$L30:
	beq	$2,$0,$L14
	nop

	lb	$2,1($fp)
	move	$4,$20
	beq	$2,$17,$L16
	addiu	$5,$fp,1

	move	$fp,$5
	bne	$4,$18,$L29
	move	$20,$2

$L96:
	bne	$2,$0,$L29
	nop

	lb	$2,0($19)
	nop
	beq	$2,$0,$L50
	li	$2,1			# 0x1

$L14:
	lb	$2,0($21)
	nop
	beq	$2,$0,$L10
	nop

	beq	$22,$2,$L65
	addiu	$21,$21,1

	beq	$22,$16,$L65
	nop

	b	$L10
	nop

$L97:
	move	$6,$19
	move	$5,$fp
$L20:
	addiu	$5,$5,2
	sw	$3,64($sp)
	.option	pic0
	jal	f2
	.option	pic2
	sw	$7,60($sp)

	lw	$3,64($sp)
	lw	$7,60($sp)
	beq	$2,$0,$L18
	li	$2,1			# 0x1

$L50:
	lw	$31,108($sp)
	lw	$fp,104($sp)
	lw	$23,100($sp)
	lw	$22,96($sp)
	lw	$21,92($sp)
	lw	$20,88($sp)
	lw	$19,84($sp)
	lw	$18,80($sp)
	lw	$17,76($sp)
	lw	$16,72($sp)
	j	$31
	addiu	$sp,$sp,112

$L95:
	lw	$fp,28($sp)
	move	$19,$21
$L16:
	addiu	$23,$fp,3
	addiu	$fp,$fp,2
$L64:
	lb	$4,0($fp)
	nop
	beq	$4,$0,$L18
	nop

	lb	$2,0($23)
	nop
	beq	$2,$17,$L97
	move	$5,$23

	move	$8,$4
	move	$6,$19
	beq	$8,$18,$L98
	move	$4,$2

$L23:
	lb	$9,0($6)
	nop
	beq	$9,$0,$L18
	addiu	$6,$6,1

	beq	$8,$16,$L24
	nop

	bne	$8,$9,$L18
	nop

$L24:
	beq	$2,$0,$L18
	nop

	lb	$2,1($5)
	move	$8,$4
	beq	$2,$17,$L20
	addiu	$9,$5,1

	move	$5,$9
	bne	$8,$18,$L23
	move	$4,$2

$L98:
	bne	$2,$0,$L23
	nop

	lb	$2,0($6)
	nop
	sltu	$2,$2,1
	bne	$2,$0,$L50
	li	$2,1			# 0x1

$L18:
	lb	$2,0($19)
	nop
	beq	$2,$0,$L14
	nop

	beq	$20,$2,$L64
	addiu	$19,$19,1

	beq	$20,$16,$L64
	nop

	b	$L14
	nop

$L89:
	lw	$9,120($sp)
	lw	$4,116($sp)
	b	$L99
	addiu	$2,$4,3

	.set	macro
	.set	reorder
	.end	f2
	.size	f2, .-f2
	.align	2
	.globl	f1
	.set	nomips16
	.ent	f1
	.type	f1, @function
f1:
	move	$2,$4
	lb	$4,0($4)
	nop
	beq	$4,$0,$L101
	move	$6,$5

	lb	$3,1($2)
	li	$5,42			# 0x2a
	beq	$3,$5,$L102
	addiu	$7,$2,1

	move	$5,$4
	li	$8,36			# 0x24
	move	$2,$7
	move	$4,$3
	li	$9,46			# 0x2e
	beq	$5,$8,$L111
	li	$10,42			# 0x2a

$L105:
	lb	$7,0($6)
	nop
	beq	$7,$0,$L101
	addiu	$6,$6,1

	beq	$5,$9,$L107
	nop

	bne	$5,$7,$L101
	nop

$L107:
	beq	$3,$0,$L101
	move	$5,$4

	lb	$3,1($2)
	nop
	beq	$3,$10,$L102
	addiu	$7,$2,1

	move	$2,$7
	bne	$5,$8,$L105
	move	$4,$3

$L111:
	bne	$3,$0,$L105
	nop

	lb	$2,0($6)
	j	$31
	sltu	$2,$2,1

$L101:
	j	$31
	move	$2,$0

$L102:
	j	f2
	addiu	$5,$2,2

f_main:
	
	addiu	$sp,$sp,-64
	sw	$fp,56($sp)
	sw	$21,44($sp)
	sw	$31,60($sp)
	sw	$23,52($sp)
	sw	$22,48($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	lb	$17,0($4)
	li	$2,94			# 0x5e
	move	$fp,$4
	beq	$17,$2,$L135
	move	$21,$5

	addiu	$23,$4,1
	li	$18,42			# 0x2a
	li	$19,36			# 0x24
	li	$20,46			# 0x2e
$L134:
	beq	$17,$0,$L114
	nop

	lb	$2,0($23)
	nop
	beq	$2,$18,$L136
	move	$22,$23

	move	$3,$17
	move	$16,$21
	beq	$3,$19,$L137
	move	$17,$2

$L123:
	lb	$4,0($16)
	nop
	beq	$4,$0,$L114
	addiu	$16,$16,1

	beq	$3,$20,$L124
	nop

	bne	$3,$4,$L114
	nop

$L124:
	beq	$2,$0,$L114
	nop

	lb	$2,1($22)
	move	$3,$17
	beq	$2,$18,$L116
	addiu	$4,$22,1

	move	$22,$4
	bne	$3,$19,$L123
	move	$17,$2

$L137:
	bne	$2,$0,$L123
	nop

	lb	$2,0($16)
	nop
	beq	$2,$0,$L128
	li	$2,1			# 0x1

$L114:
	lb	$2,0($21)
	nop
	beq	$2,$0,$L128
	addiu	$21,$21,1

	lb	$17,0($fp)
	b	$L134
	nop

$L136:
	move	$16,$21
	move	$22,$fp
$L116:
	beq	$17,$20,$L132
	addiu	$22,$22,2

	b	$L139
	move	$5,$16

$L138:
	lb	$2,0($16)
	nop
	beq	$2,$0,$L114
	addiu	$16,$16,1

$L132:
	move	$5,$16
	.option	pic0
	jal	f1
	.option	pic2
	move	$4,$22

	beq	$2,$0,$L138
	li	$2,1			# 0x1

$L128:
	lw	$31,60($sp)
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,64

$L130:
$L139:
	jal	f1
	move	$4,$22

	bne	$2,$0,$L128
	li	$2,1			# 0x1

	lb	$2,0($16)
	nop
	beq	$2,$0,$L114
	addiu	$16,$16,1

	bne	$17,$2,$L114
	nop

	b	$L130
	move	$5,$16

$L135:
	lw	$31,60($sp)
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	addiu	$4,$4,1
	j	f1
	addiu	$sp,$sp,64


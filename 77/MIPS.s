f:
	sltu	$8,$6,$7
	move	$2,$7
	move	$10,$4
	beq	$8,$0,$L2
	move	$7,$5

	addu	$6,$4,$6
	sltu	$4,$4,$6
	beq	$4,$0,$L3
	addu	$11,$5,$2

	sltu	$2,$5,$11
	beq	$2,$0,$L33
	subu	$2,$7,$5

	move	$2,$5
	li	$13,128			# 0x80
	li	$14,256			# 0x100
$L17:
	sll	$13,$13,1
	beq	$13,$14,$L28
	nop

$L11:
	and	$4,$3,$13
	beq	$4,$0,$L12
	nop

	lbu	$12,0($10)
	lbu	$7,1($10)
	sll	$4,$12,8
	or	$4,$7,$4
	andi	$4,$4,0x3ff
	subu	$4,$2,$4
	sltu	$7,$4,$5
	bne	$7,$0,$L13
	addiu	$10,$10,2

	sltu	$7,$2,$11
	beq	$7,$0,$L14
	srl	$12,$12,2

	addiu	$12,$12,1
	b	$L15
	move	$7,$0

$L29:
	beq	$9,$0,$L14
	addiu	$7,$7,1

$L15:
	lbu	$9,0($4)
	subu	$8,$12,$7
	sb	$9,0($2)
	addiu	$2,$2,1
	addiu	$4,$4,1
	bgez	$8,$L29
	sltu	$9,$2,$11

$L14:
	sltu	$4,$10,$6
	beq	$4,$0,$L16
	sltu	$4,$2,$11

	bne	$4,$0,$L17
	nop

$L16:
	move	$7,$2
$L3:
	j	$31
	subu	$2,$7,$5

$L2:
	beq	$2,$0,$L33
	sltu	$6,$2,4

	bne	$6,$0,$L6
	addiu	$3,$2,-1

	or	$6,$5,$4
	andi	$6,$6,0x3
	bne	$6,$0,$L6
	addiu	$6,$4,4

	sltu	$6,$6,$5
	beq	$6,$0,$L30
	addiu	$6,$5,4

	srl	$11,$2,2
$L32:
	sll	$12,$11,2
	beq	$12,$0,$L8
	nop

	move	$8,$4
	move	$7,$5
	move	$6,$0
$L9:
	lw	$10,0($8)
	addiu	$6,$6,1
	sltu	$9,$6,$11
	sw	$10,0($7)
	addiu	$8,$8,4
	bne	$9,$0,$L9
	addiu	$7,$7,4

	addu	$10,$4,$12
	addu	$7,$5,$12
	beq	$2,$12,$L33
	subu	$3,$3,$12

$L8:
	li	$5,-1			# 0xffffffffffffffff
$L20:
	lbu	$4,0($10)
	addiu	$3,$3,-1
	sb	$4,0($7)
	addiu	$10,$10,1
	bne	$3,$5,$L20
	addiu	$7,$7,1

$L33:
	j	$31
	nop

$L12:
	lbu	$4,0($10)
	addiu	$10,$10,1
	sb	$4,0($2)
	b	$L14
	addiu	$2,$2,1

$L28:
	lbu	$3,0($10)
	li	$13,1			# 0x1
	b	$L11
	addiu	$10,$10,1

$L13:
	j	$31
	subu	$2,$2,$5

$L30:
	sltu	$6,$6,$4
	bne	$6,$0,$L32
	srl	$11,$2,2

$L6:
	move	$3,$0
$L10:
	addu	$6,$4,$3
	lbu	$7,0($6)
	addu	$6,$5,$3
	addiu	$3,$3,1
	bne	$2,$3,$L10
	sb	$7,0($6)

	j	$31
	nop

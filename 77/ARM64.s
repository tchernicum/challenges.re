f:
	cmp	x2, x3
	bcs	.L2
	add	x8, x1, x3
	mov	x4, x1
	mov	w9, 128
	add	x2, x0, x2
.L3:
	cmp	x4, x8
	bcs	.L25
.L123:
	cmp	x0, x2
	bcs	.L25
	add	w9, w9, w9
	cmp	w9, 256
	beq	.L122
.L14:
	tst	w10, w9
	beq	.L15
	ldrb	w5, [x0]
	add	x0, x0, 2
	ldrb	w6, [x0, -1]
	orr	w6, w6, w5, lsl 8
	lsr	w5, w5, 2
	and	x6, x6, 1023
	sub	x6, x4, x6
	cmp	x1, x6
	bhi	.L25
	add	w5, w5, 2
.L17:
	ldrb	w7, [x6], 1
	sub	w5, w5, #1
	strb	w7, [x4], 1
	cmp	x8, x4
	bls	.L3
	tbz	w5, #31, .L17
	cmp	x4, x8
	bcc	.L123
.L25:
	sub	x0, x4, x1
	ret
.L15:
	add	x4, x4, 1
	ldrb	w3, [x0]
	add	x0, x0, 1
	strb	w3, [x4, -1]
	b	.L3
.L122:
	ldrb	w10, [x0]
	mov	w9, 1
	add	x0, x0, 1
	b	.L14
.L2:
	sub	x8, x3, #1
	cbz	x3, .L22
	add	x2, x0, 16
	add	x4, x1, 16
	cmp	x1, x2
	cset	w5, cs
	cmp	x0, x4
	cset	w2, cs
	orr	w2, w5, w2
	cbz	w2, .L23
	cmp	x3, 21
	bls	.L23
	neg	x4, x0
	and	x4, x4, 15
	cmp	x4, x3
	csel	x4, x4, x3, ls
	cbz	x4, .L24
	ldrb	w2, [x0]
	cmp	x4, 1
	strb	w2, [x1]
	add	x5, x1, 1
	add	x6, x0, 1
	sub	x7, x3, #2
	beq	.L6
	ldrb	w2, [x0, 1]
	cmp	x4, 2
	strb	w2, [x1, 1]
	add	x5, x1, 2
	add	x6, x0, 2
	sub	x7, x3, #3
	beq	.L6
	ldrb	w2, [x0, 2]
	cmp	x4, 3
	strb	w2, [x1, 2]
	add	x5, x1, 3
	add	x6, x0, 3
	sub	x7, x3, #4
	beq	.L6
	ldrb	w2, [x0, 3]
	cmp	x4, 4
	strb	w2, [x1, 3]
	add	x5, x1, 4
	add	x6, x0, 4
	sub	x7, x3, #5
	beq	.L6
	ldrb	w2, [x0, 4]
	cmp	x4, 5
	strb	w2, [x1, 4]
	add	x5, x1, 5
	add	x6, x0, 5
	sub	x7, x3, #6
	beq	.L6
	ldrb	w2, [x0, 5]
	cmp	x4, 6
	strb	w2, [x1, 5]
	add	x5, x1, 6
	add	x6, x0, 6
	sub	x7, x3, #7
	beq	.L6
	ldrb	w2, [x0, 6]
	cmp	x4, 7
	strb	w2, [x1, 6]
	add	x5, x1, 7
	add	x6, x0, 7
	sub	x7, x3, #8
	beq	.L6
	ldrb	w2, [x0, 7]
	cmp	x4, 8
	strb	w2, [x1, 7]
	add	x5, x1, 8
	add	x6, x0, 8
	sub	x7, x3, #9
	beq	.L6
	ldrb	w2, [x0, 8]
	cmp	x4, 9
	strb	w2, [x1, 8]
	add	x5, x1, 9
	add	x6, x0, 9
	sub	x7, x3, #10
	beq	.L6
	ldrb	w2, [x0, 9]
	cmp	x4, 10
	strb	w2, [x1, 9]
	add	x5, x1, 10
	add	x6, x0, 10
	sub	x7, x3, #11
	beq	.L6
	ldrb	w2, [x0, 10]
	cmp	x4, 11
	strb	w2, [x1, 10]
	add	x5, x1, 11
	add	x6, x0, 11
	sub	x7, x3, #12
	beq	.L6
	ldrb	w2, [x0, 11]
	cmp	x4, 12
	strb	w2, [x1, 11]
	add	x5, x1, 12
	add	x6, x0, 12
	sub	x7, x3, #13
	beq	.L6
	ldrb	w2, [x0, 12]
	cmp	x4, 13
	strb	w2, [x1, 12]
	add	x5, x1, 13
	add	x6, x0, 13
	sub	x7, x3, #14
	beq	.L6
	ldrb	w2, [x0, 13]
	cmp	x4, 15
	strb	w2, [x1, 13]
	add	x5, x1, 14
	add	x6, x0, 14
	sub	x7, x3, #15
	bne	.L6
	ldrb	w2, [x0, 14]
	add	x5, x1, 15
	add	x6, x0, 15
	strb	w2, [x1, 14]
	sub	x7, x3, #16
.L6:
	sub	x10, x3, x4
	sub	x2, x8, x4
	sub	x8, x10, #16
	cmp	x2, 14
	lsr	x8, x8, 4
	add	x8, x8, 1
	lsl	x9, x8, 4
	bls	.L8
	add	x2, x0, x4
	add	x0, x1, x4
	mov	x1, 0
	mov	x4, 0
.L9:
	ldr	q0, [x2, x1]
	add	x4, x4, 1
	cmp	x8, x4
	str	q0, [x0, x1]
	add	x1, x1, 16
	bhi	.L9
	cmp	x9, x10
	add	x6, x6, x9
	add	x5, x5, x9
	sub	x7, x7, x9
	beq	.L13
.L8:
	ldrb	w0, [x6]
	strb	w0, [x5]
	cbz	x7, .L13
	ldrb	w0, [x6, 1]
	cmp	x7, 1
	strb	w0, [x5, 1]
	beq	.L13
	ldrb	w0, [x6, 2]
	cmp	x7, 2
	strb	w0, [x5, 2]
	beq	.L13
	ldrb	w0, [x6, 3]
	cmp	x7, 3
	strb	w0, [x5, 3]
	beq	.L13
	ldrb	w0, [x6, 4]
	cmp	x7, 4
	strb	w0, [x5, 4]
	beq	.L13
	ldrb	w0, [x6, 5]
	cmp	x7, 5
	strb	w0, [x5, 5]
	beq	.L13
	ldrb	w0, [x6, 6]
	cmp	x7, 6
	strb	w0, [x5, 6]
	beq	.L13
	ldrb	w0, [x6, 7]
	cmp	x7, 7
	strb	w0, [x5, 7]
	beq	.L13
	ldrb	w0, [x6, 8]
	cmp	x7, 8
	strb	w0, [x5, 8]
	beq	.L13
	ldrb	w0, [x6, 9]
	cmp	x7, 9
	strb	w0, [x5, 9]
	beq	.L13
	ldrb	w0, [x6, 10]
	cmp	x7, 10
	strb	w0, [x5, 10]
	beq	.L13
	ldrb	w0, [x6, 11]
	cmp	x7, 11
	strb	w0, [x5, 11]
	beq	.L13
	ldrb	w0, [x6, 12]
	cmp	x7, 12
	strb	w0, [x5, 12]
	beq	.L13
	ldrb	w0, [x6, 13]
	cmp	x7, 13
	strb	w0, [x5, 13]
	beq	.L13
	ldrb	w0, [x6, 14]
	strb	w0, [x5, 14]
.L13:
	mov	x0, x3
.L124:
	ret
.L22:
	mov	x0, 0
	ret
.L24:
	mov	x7, x8
	mov	x5, x1
	mov	x6, x0
	b	.L6
.L23:
	mov	x2, 0
.L5:
	ldrb	w4, [x0, x2]
	strb	w4, [x1, x2]
	add	x2, x2, 1
	cmp	x2, x3
	bne	.L5
	mov	x0, x3
	b	.L124

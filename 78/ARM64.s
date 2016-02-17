f1:
	stp	x29, x30, [sp, -192]!
	mov	x2, x0
	add	x29, sp, 0
	stp	d12, d13, [sp, 128]
	stp	x19, x20, [sp, 16]
	stp	d8, d9, [sp, 96]
	stp	x21, x22, [sp, 32]
	stp	d10, d11, [sp, 112]
	stp	x23, x24, [sp, 48]
	stp	d14, d15, [sp, 144]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 184]
	fmov	d13, x1
	ldrb	w0, [x0]
	str	w0, [x29, 180]
	mov	w1, w0
	cbz	w0, .L78
	ldrb	w0, [x2, 1]
	cmp	w0, 42
	beq	.L3
	cmp	w1, 36
	bne	.L81
	cbz	w0, .L4
.L81:
	fmov	x0, d13
	ldrb	w0, [x0]
	cbz	w0, .L78
	ldr	w1, [x29, 180]
	cmp	w1, w0
	beq	.L148
	cmp	w1, 46
	bne	.L78
.L148:
	ldr	x0, [x29, 184]
	ldrb	w1, [x0, 1]!
	str	x0, [x29, 184]
	fmov	x0, d13
	str	w1, [x29, 180]
	add	x0, x0, 1
	fmov	d13, x0
	cbz	w1, .L78
	ldr	x0, [x29, 184]
	ldrb	w0, [x0, 1]
	cmp	w0, 42
	beq	.L3
	ldr	w1, [x29, 180]
	cmp	w1, 36
	bne	.L59
	cbz	w0, .L4
.L59:
	fmov	x0, d13
	ldr	w1, [x29, 180]
	ldrb	w0, [x0]
	cmp	w1, 46
	cbz	w0, .L78
	beq	.L148
	cmp	w1, w0
	beq	.L148
.L78:
	mov	w0, 0
.L189:
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 96]
	ldp	x21, x22, [sp, 32]
	ldp	d10, d11, [sp, 112]
	ldp	x23, x24, [sp, 48]
	ldp	d12, d13, [sp, 128]
	ldp	x25, x26, [sp, 64]
	ldp	d14, d15, [sp, 144]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
.L3:
	ldr	x0, [x29, 184]
	add	x0, x0, 2
	ldrb	w1, [x0]
	str	w1, [x29, 164]
	str	x0, [x29, 168]
.L157:
	ldr	w1, [x29, 164]
	cbz	w1, .L8
.L208:
	ldr	x0, [x29, 184]
	ldrb	w0, [x0, 3]
	cmp	w0, 42
	beq	.L65
	cmp	w1, 36
	bne	.L82
	cbz	w0, .L66
.L82:
	fmov	x0, d13
	ldrb	w1, [x0]
	cbz	w1, .L78
	ldr	w0, [x29, 164]
	cmp	w1, w0
	beq	.L12
	cmp	w0, 46
	bne	.L13
.L12:
	ldr	x0, [x29, 168]
	fmov	d8, d13
	fmov	d10, x0
.L156:
	fmov	x0, d10
	ldrb	w2, [x0, 1]!
	fmov	d10, x0
	fmov	x0, d8
	fmov	s12, w2
	add	x0, x0, 1
	fmov	d8, x0
	cbz	w2, .L13
	fmov	x0, d10
	ldrb	w0, [x0, 1]
	cmp	w0, 42
	beq	.L9
	fmov	w2, s12
	cmp	w2, 36
	bne	.L55
	cbz	w0, .L10
.L55:
	fmov	x0, d8
	fmov	w2, s12
	ldrb	w0, [x0]
	cmp	w2, 46
	cbz	w0, .L13
	beq	.L156
	cmp	w2, w0
	beq	.L156
.L13:
	ldr	w0, [x29, 180]
	cmp	w0, w1
	fmov	x1, d13
	add	x1, x1, 1
	fmov	d13, x1
	beq	.L157
	cmp	w0, 46
	bne	.L78
	ldr	w1, [x29, 164]
	cbnz	w1, .L208
.L8:
	fmov	x0, d13
	ldrb	w1, [x0]
	cbnz	w1, .L13
	b	.L78
.L65:
	ldr	w0, [x29, 164]
	fmov	d8, d13
	fmov	s12, w0
	ldr	x0, [x29, 168]
	fmov	d10, x0
.L9:
	fmov	x0, d10
	ldrb	w1, [x0, 2]
	add	x0, x0, 2
	str	w1, [x29, 176]
	fmov	d15, x0
.L155:
	ldr	w1, [x29, 176]
	cbz	w1, .L15
.L209:
	fmov	x0, d10
	ldrb	w0, [x0, 3]
	cmp	w0, 42
	beq	.L68
	cmp	w1, 36
	bne	.L83
	cbz	w0, .L69
.L83:
	fmov	x0, d8
	ldrb	w1, [x0]
	cbz	w1, .L8
	ldr	w0, [x29, 176]
	cmp	w1, w0
	beq	.L19
	cmp	w0, 46
	bne	.L20
.L19:
	fmov	x20, d8
	fmov	x22, d15
.L154:
	ldrb	w21, [x22, 1]!
	add	x20, x20, 1
	cbz	w21, .L20
	ldrb	w0, [x22, 1]
	cmp	w0, 42
	beq	.L16
	cmp	w21, 36
	bne	.L51
	cbz	w0, .L17
.L51:
	ldrb	w0, [x20]
	cmp	w21, 46
	cbz	w0, .L20
	beq	.L154
	cmp	w21, w0
	beq	.L154
.L20:
	fmov	w0, s12
	cmp	w0, w1
	fmov	x1, d8
	add	x1, x1, 1
	fmov	d8, x1
	beq	.L155
	cmp	w0, 46
	bne	.L8
	ldr	w1, [x29, 176]
	cbnz	w1, .L209
.L15:
	fmov	x0, d8
	ldrb	w1, [x0]
	cbnz	w1, .L20
.L200:
	fmov	x0, d13
	ldrb	w1, [x0]
	cbnz	w1, .L13
	b	.L78
.L68:
	ldr	w21, [x29, 176]
	fmov	x20, d8
	fmov	x22, d15
.L16:
	ldrb	w0, [x22, 2]
	fmov	s14, w0
	add	x0, x22, 2
	fmov	d11, x0
.L153:
	fmov	w1, s14
	cbz	w1, .L22
.L211:
	ldrb	w0, [x22, 3]
	cmp	w0, 42
	beq	.L70
	cmp	w1, 36
	bne	.L84
	cbz	w0, .L24
.L84:
	ldrb	w1, [x20]
	mov	w2, w1
	cbz	w1, .L15
	fmov	w0, s14
	cmp	w1, w0
	beq	.L26
	cmp	w0, 46
	bne	.L27
.L26:
	mov	x28, x20
	fmov	x27, d11
.L152:
	ldrb	w26, [x27, 1]!
	add	x28, x28, 1
	cbz	w26, .L27
	ldrb	w0, [x27, 1]
	cmp	w0, 42
	beq	.L23
	cmp	w26, 36
	bne	.L47
	cbz	w0, .L210
.L47:
	ldrb	w0, [x28]
	cmp	w26, 46
	cbz	w0, .L27
	beq	.L152
	cmp	w26, w0
	beq	.L152
.L27:
	cmp	w21, w2
	add	x20, x20, 1
	beq	.L153
	cmp	w21, 46
	bne	.L15
	fmov	w1, s14
	cbnz	w1, .L211
.L22:
	ldrb	w2, [x20]
	cbnz	w2, .L27
.L202:
	fmov	x0, d8
	ldrb	w1, [x0]
	cbnz	w1, .L20
	b	.L200
.L70:
	mov	x28, x20
	fmov	w26, s14
	fmov	x27, d11
.L23:
	ldrb	w0, [x27, 2]
	add	x23, x27, 2
	fmov	s9, w0
.L151:
	fmov	w1, s9
	cbz	w1, .L29
.L213:
	ldrb	w0, [x27, 3]
	cmp	w0, 42
	beq	.L71
	cmp	w1, 36
	ldrb	w1, [x28]
	bne	.L85
	cbz	w0, .L31
.L85:
	cbz	w1, .L22
	fmov	w0, s9
	cmp	w1, w0
	beq	.L33
	cmp	w0, 46
	bne	.L34
.L33:
	mov	x25, x28
	mov	x19, x23
.L150:
	ldrb	w24, [x19, 1]!
	add	x25, x25, 1
	cbz	w24, .L34
	ldrb	w0, [x19, 1]
	cmp	w0, 42
	beq	.L30
	cmp	w24, 36
	bne	.L41
	cbz	w0, .L212
.L41:
	ldrb	w0, [x25]
	cmp	w24, 46
	cbz	w0, .L34
	beq	.L150
	cmp	w24, w0
	beq	.L150
.L34:
	cmp	w26, w1
	add	x28, x28, 1
	beq	.L151
	cmp	w26, 46
	bne	.L22
	fmov	w1, s9
	cbnz	w1, .L213
.L29:
	ldrb	w1, [x28]
	cbnz	w1, .L34
.L204:
	ldrb	w2, [x20]
	cbnz	w2, .L27
	b	.L202
.L31:
	cbnz	w1, .L34
.L80:
	mov	w0, 1
	b	.L189
.L71:
	mov	x25, x28
	mov	x19, x23
	fmov	w24, s9
.L30:
	add	x19, x19, 2
.L149:
	mov	x1, x25
	mov	x0, x19
	bl	f1
	cbnz	w0, .L80
	ldrb	w0, [x25]
	add	x25, x25, 1
	cmp	w24, w0
	cbz	w0, .L29
	beq	.L149
	cmp	w24, 46
	beq	.L149
	ldrb	w1, [x28]
	cbnz	w1, .L34
	b	.L204
.L212:
	ldrb	w0, [x25]
	cbnz	w0, .L34
	mov	w0, 1
	b	.L189
.L24:
	ldrb	w0, [x20]
	cbz	w0, .L80
	ldrb	w2, [x20]
	cbnz	w2, .L27
	b	.L202
.L210:
	ldrb	w0, [x28]
	cbz	w0, .L80
	mov	w2, w1
	b	.L27
.L69:
	fmov	x20, d8
.L17:
	ldrb	w0, [x20]
	cbz	w0, .L80
	fmov	x0, d8
	ldrb	w1, [x0]
	cbnz	w1, .L20
	b	.L200
.L66:
	fmov	d8, d13
.L10:
	fmov	x0, d8
	ldrb	w0, [x0]
	cbz	w0, .L80
	fmov	x0, d13
	ldrb	w1, [x0]
	cbnz	w1, .L13
	b	.L78
.L4:
	fmov	x0, d13
	ldrb	w0, [x0]
	cmp	w0, wzr
	cset	w0, eq
	b	.L189
f2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x21, x1
	mov	x19, x2
.L220:
	mov	x1, x19
	mov	x0, x21
	bl	f1
	cbnz	w0, .L217
	ldrb	w2, [x19]
	add	x19, x19, 1
	cmp	w2, w20
	cbz	w2, .L215
	beq	.L220
	cmp	w20, 46
	beq	.L220
.L215:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L217:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
f_main:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x19, x20, [sp, 16]
	mov	x22, x0
	add	x23, x1, 1
	ldrb	w24, [x0]
	cmp	w24, 94
	beq	.L268
	sub	x19, x23, #1
	cbz	w24, .L225
.L270:
	ldrb	w0, [x22, 1]
	cmp	w0, 42
	beq	.L241
	cmp	w24, 36
	bne	.L246
	cbz	w0, .L227
.L246:
	ldrb	w0, [x23, -1]
	cbz	w0, .L242
	cmp	w24, w0
	beq	.L230
	cmp	w24, 46
	bne	.L231
.L230:
	mov	x1, x22
.L257:
	ldrb	w20, [x1, 1]!
	add	x19, x19, 1
	cbz	w20, .L231
	ldrb	w2, [x1, 1]
	cmp	w2, 42
	beq	.L226
	cmp	w20, 36
	bne	.L238
	cbz	w2, .L269
.L238:
	ldrb	w2, [x19]
	cmp	w20, 46
	cbz	w2, .L231
	beq	.L257
	cmp	w20, w2
	beq	.L257
.L231:
	add	x23, x23, 1
.L272:
	sub	x19, x23, #1
	cbnz	w24, .L270
.L225:
	ldrb	w0, [x23, -1]
	cbnz	w0, .L231
.L263:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L241:
	mov	w20, w24
	mov	x1, x22
.L226:
	add	x21, x1, 2
.L256:
	mov	x1, x19
	mov	x0, x21
	bl	f1
	cbnz	w0, .L245
.L271:
	ldrb	w1, [x19]
	add	x19, x19, 1
	cmp	w20, w1
	cbz	w1, .L225
	beq	.L256
	cmp	w20, 46
	bne	.L225
	mov	x1, x19
	mov	x0, x21
	bl	f1
	cbz	w0, .L271
.L245:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L227:
	ldrb	w0, [x23, -1]
	cbz	w0, .L245
	add	x23, x23, 1
	b	.L272
.L269:
	ldrb	w0, [x19]
	cbz	w0, .L245
	add	x23, x23, 1
	b	.L272
.L242:
	mov	w0, 0
	b	.L263
.L268:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	x0, x0, 1
	b	f1

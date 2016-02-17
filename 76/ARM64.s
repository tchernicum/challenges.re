f1:
	cbz	w0, .L8
	mov	w3, 65535
	cmp	w0, w3
	bhi	.L3
	mov	w2, w0
	mov	w1, 0
.L4:
	add	w2, w2, w2
	sub	w1, w1, #65536
	cmp	w2, w3
	bls	.L4
.L6:
	umull	x0, w0, w0
	mov	x4, 131071
	add	w3, w1, 32768
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x0, x0, x2, hi
	csel	w1, w1, w3, ls
	add	w3, w1, 16384
	mul	x0, x0, x0
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x2, x0, x2, hi
	csel	w3, w1, w3, ls
	add	w0, w3, 8192
	mul	x2, x2, x2
	lsr	x1, x2, 16
	lsr	x2, x2, 17
	cmp	x1, x4
	csel	x1, x2, x1, hi
	csel	w3, w3, w0, ls
	add	w2, w3, 4096
	mul	x1, x1, x1
	lsr	x0, x1, 16
	lsr	x1, x1, 17
	cmp	x0, x4
	csel	x0, x1, x0, hi
	csel	w3, w3, w2, ls
	add	w1, w3, 2048
	mul	x0, x0, x0
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x2, x0, x2, hi
	csel	w3, w3, w1, ls
	add	w0, w3, 1024
	mul	x2, x2, x2
	lsr	x1, x2, 16
	lsr	x2, x2, 17
	cmp	x1, x4
	csel	x1, x2, x1, hi
	csel	w3, w3, w0, ls
	add	w2, w3, 512
	mul	x1, x1, x1
	lsr	x0, x1, 16
	lsr	x1, x1, 17
	cmp	x0, x4
	csel	x0, x1, x0, hi
	csel	w3, w3, w2, ls
	add	w1, w3, 256
	mul	x0, x0, x0
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x2, x0, x2, hi
	csel	w3, w3, w1, ls
	add	w0, w3, 128
	mul	x2, x2, x2
	lsr	x1, x2, 16
	lsr	x2, x2, 17
	cmp	x1, x4
	csel	x1, x2, x1, hi
	csel	w3, w3, w0, ls
	add	w2, w3, 64
	mul	x1, x1, x1
	lsr	x0, x1, 16
	lsr	x1, x1, 17
	cmp	x0, x4
	csel	x0, x1, x0, hi
	csel	w3, w3, w2, ls
	add	w1, w3, 32
	mul	x0, x0, x0
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x2, x0, x2, hi
	csel	w3, w3, w1, ls
	add	w0, w3, 16
	mul	x2, x2, x2
	lsr	x1, x2, 16
	lsr	x2, x2, 17
	cmp	x1, x4
	csel	x1, x2, x1, hi
	csel	w3, w3, w0, ls
	add	w2, w3, 8
	mul	x1, x1, x1
	lsr	x0, x1, 16
	lsr	x1, x1, 17
	cmp	x0, x4
	csel	x0, x1, x0, hi
	csel	w3, w3, w2, ls
	add	w1, w3, 4
	mul	x0, x0, x0
	lsr	x2, x0, 16
	lsr	x0, x0, 17
	cmp	x2, x4
	csel	x2, x0, x2, hi
	csel	w3, w3, w1, ls
	add	w0, w3, 2
	mul	x2, x2, x2
	lsr	x1, x2, 16
	lsr	x2, x2, 17
	cmp	x1, x4
	csel	x1, x2, x1, hi
	csel	w0, w3, w0, ls
	mul	x1, x1, x1
	cmp	x4, x1, lsr 16
	csinc	w0, w0, w0, cs
	ret
.L3:
	mov	w3, 131071
	mov	w2, w0
	cmp	w0, w3
	mov	w1, 0
	bls	.L6
.L7:
	lsr	w2, w2, 1
	add	w1, w1, 65536
	cmp	w2, w3
	bhi	.L7
	b	.L6
.L8:
	mov	w0, -2147483648
	ret
f2:
	smull	x0, w0, w1
	add	x2, x0, 61440
	cmp	x0, xzr
	add	x2, x2, 4095
	csel	x0, x2, x0, lt
	lsr	x0, x0, 16
	ret
f3:
	sxtw	x1, w1
	sbfiz	x0, x0, 16, 32
	sdiv	x0, x0, x1
	ret

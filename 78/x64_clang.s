f_main:
	push	r14
	push	rbx
	push	rax
	mov	rbx, rsi
	mov	r14, rdi
	cmp	byte ptr [r14], 94
	jne	.LBB0_1
	inc	r14
	mov	rdi, r14
	mov	rsi, rbx
	add	rsp, 8
	pop	rbx
	pop	r14
	jmp	f1
.LBB0_1:
	mov	rdi, r14
	mov	rsi, rbx
	call	f1
	test	eax, eax
	mov	eax, 1
	jne	.LBB0_3
	xor	eax, eax
	cmp	byte ptr [rbx], 0
	lea	rbx, qword ptr [rbx + 1]
	jne	.LBB0_1
.LBB0_3:
	add	rsp, 8
	pop	rbx
	pop	r14
	ret

f1:
	push	rbp
	push	r14
	push	rbx
	mov	rbx, rsi
	mov	r14, rdi
	mov	al, byte ptr [r14]
	test	al, al
	je	.LBB1_17
	add	r14, 2
.LBB1_3:
	mov	bpl, al
	mov	al, byte ptr [r14 - 1]
	cmp	al, 42
	je	.LBB1_4
	cmp	bpl, 36
	mov	cl, byte ptr [rbx]
	je	.LBB1_12
.LBB1_14:
	test	cl, cl
	je	.LBB1_17
	cmp	bpl, 46
	jne	.LBB1_16
.LBB1_2:
	inc	rbx
	inc	r14
	test	al, al
	jne	.LBB1_3
	jmp	.LBB1_17
.LBB1_12:
	test	al, al
	jne	.LBB1_14
	jmp	.LBB1_13
.LBB1_16:
	cmp	bpl, cl
	je	.LBB1_2
	jmp	.LBB1_17
.LBB1_4:
	cmp	bpl, 46
	je	.LBB1_5
.LBB1_8:
	mov	rdi, r14
	mov	rsi, rbx
	call	f1
	test	eax, eax
	mov	eax, 1
	jne	.LBB1_18
	mov	al, byte ptr [rbx]
	test	al, al
	je	.LBB1_17
	inc	rbx
	cmp	al, bpl
	je	.LBB1_8
	jmp	.LBB1_17
.LBB1_7:
	inc	rbx
.LBB1_5:
	mov	rdi, r14
	mov	rsi, rbx
	call	f1
	test	eax, eax
	mov	eax, 1
	jne	.LBB1_18
	cmp	byte ptr [rbx], 0
	jne	.LBB1_7
.LBB1_17:
	xor	eax, eax
.LBB1_18:
	pop	rbx
	pop	r14
	pop	rbp
	ret
.LBB1_13:
	test	cl, cl
	sete	al
	movzx	eax, al
	jmp	.LBB1_18

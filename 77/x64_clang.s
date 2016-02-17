f:
	push	rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	cmp	rdx, rcx
	jae	.LBB0_1
	test	rdx, rdx
	mov	r14, rsi
	jle	.LBB0_34
	test	rcx, rcx
	mov	r14, rsi
	jle	.LBB0_34
	add	rdx, rdi
	lea	r8, qword ptr [rsi + rcx]
	mov	qword ptr [rsp - 24], r8
	mov	rax, rsi
	neg	rax
	sub	rax, rcx
	mov	qword ptr [rsp - 16], rax
	mov	r12d, 128
	mov	r14, rsi
.LBB0_13:
	add	r12d, r12d
	cmp	r12d, 256
	jne	.LBB0_15
	mov	bl, byte ptr [rdi]
	inc	rdi
	mov	r12d, 1
	movzx	eax, bl
	test	eax, r12d
	jne	.LBB0_16
	mov	al, byte ptr [rdi]
	inc	rdi
	mov	byte ptr [r14], al
	inc	r14
	jmp	.LBB0_32
.LBB0_16:
	movzx	eax, byte ptr [rdi]
	movzx	ecx, byte ptr [rdi + 1]
	mov	r13d, eax
	and	r13d, 3
	shl	r13d, 8
	or	r13d, ecx
	mov	rbp, r14
	sub	rbp, r13
	cmp	rbp, rsi
	jb	.LBB0_34
	add	rdi, 2
	cmp	r14, r8
	jae	.LBB0_32
	mov	byte ptr [rsp - 1], bl
	mov	rcx, qword ptr [rsp - 16]
	lea	rbx, qword ptr [r14 + rcx]
	mov	qword ptr [rsp - 32], rbx
	mov	r10d, eax
	shr	r10d, 2
	mov	r11d, r10d
	neg	r11d
	mov	ecx, -3
	sub	ecx, r10d
	mov	qword ptr [rsp - 40], rcx
	mov	r9d, 2
	cmovs	r11d, r9d
	add	r11d, r10d
	not	r11
	cmp	rbx, r11
	cmova	r11, rbx
	shr	eax, 2
	mov	r8d, eax
	neg	r8d
	mov	ecx, -3
	cmp	ecx, eax
	cmovs	r8d, r9d
	add	r8d, eax
	not	r8
	cmp	rbx, r8
	cmova	r8, rbx
	mov	r15, r8
	neg	r15
	mov	r9, r15
	and	r9, -32
	mov	eax, r13d
	jne	.LBB0_22
	mov	rax, r14
	xor	ecx, ecx
	jmp	.LBB0_27
.LBB0_22:
	mov	rcx, r15
	sub	rcx, rax
	lea	rcx, qword ptr [rcx + r14 - 1]
	cmp	r14, rcx
	ja	.LBB0_24
	not	r8
	mov	rcx, r14
	sub	rcx, rax
	add	r8, r14
	cmp	rcx, r8
	mov	rax, r14
	mov	ecx, 0
	jbe	.LBB0_27
.LBB0_24:
	mov	rbp, r9
	sub	rbp, r13
	add	rbp, r14
	lea	rax, qword ptr [r14 + r9]
	lea	r8, qword ptr [r14 + 16]
	mov	ebx, r13d
	mov	rcx, r8
	sub	rcx, rbx
	xor	ebx, ebx
.LBB0_25:
	movups	xmm0, xmmword ptr [rcx + rbx - 16]
	movups	xmm1, xmmword ptr [rcx + rbx]
	movups	xmmword ptr [r8 + rbx - 16], xmm0
	movups	xmmword ptr [r8 + rbx], xmm1
	add	rbx, 32
	cmp	r9, rbx
	jne	.LBB0_25
	mov	rcx, r9
.LBB0_27:
	cmp	rcx, r15
	je	.LBB0_30
	mov	rbx, qword ptr [rsp - 40]
	cmp	ebx, -2
	mov	ecx, -1
	cmovle	ebx, ecx
	lea	ecx, dword ptr [rbx + r10 + 3]
	not	rcx
	mov	rbx, qword ptr [rsp - 32]
	cmp	rbx, rcx
	cmova	rcx, rbx
	neg	rcx
	mov	ebx, r13d
	sub	rcx, rbx
	add	rcx, r14
.LBB0_29:
	mov	bl, byte ptr [rbp]
	inc	rbp
	mov	byte ptr [rax], bl
	inc	rax
	cmp	rcx, rbp
	jne	.LBB0_29
.LBB0_30:
	neg	r11
	add	r14, r11
	mov	r8, qword ptr [rsp - 24]
	mov	bl, byte ptr [rsp - 1]
.LBB0_32:
	cmp	rdi, rdx
	jae	.LBB0_34
	cmp	r14, r8
	jb	.LBB0_13
.LBB0_34:
	sub	r14, rsi
	jmp	.LBB0_35
.LBB0_1:
	xor	r14d, r14d
	test	rcx, rcx
	je	.LBB0_35
	mov	r8, rcx
	and	r8, -32
	je	.LBB0_3
	lea	rax, qword ptr [rcx - 1]
	lea	rdx, qword ptr [rdi + rax]
	cmp	rdx, rsi
	jb	.LBB0_6
	add	rax, rsi
	cmp	rax, rdi
	jb	.LBB0_6
.LBB0_3:
	mov	rax, rcx
	mov	rdx, rdi
	mov	rbp, rsi
	xor	r8d, r8d
	jmp	.LBB0_8
.LBB0_6:
	mov	rax, rcx
	sub	rax, r8
	lea	rdx, qword ptr [rdi + r8]
	lea	rbp, qword ptr [rsi + r8]
	xor	ebx, ebx
.LBB0_7:
	movups	xmm0, xmmword ptr [rdi + rbx]
	movups	xmm1, xmmword ptr [rdi + rbx + 16]
	movups	xmmword ptr [rsi + rbx], xmm0
	movups	xmmword ptr [rsi + rbx + 16], xmm1
	add	rbx, 32
	cmp	r8, rbx
	jne	.LBB0_7
.LBB0_8:
	cmp	r8, rcx
	jne	.LBB0_20
	mov	r14, rcx
	jmp	.LBB0_35
.LBB0_20:
	dec	rax
	mov	bl, byte ptr [rdx]
	lea	rdx, qword ptr [rdx + 1]
	mov	byte ptr [rbp], bl
	lea	rbp, qword ptr [rbp + 1]
	jne	.LBB0_20
	mov	r14, rcx
.LBB0_35:
	mov	rax, r14
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret

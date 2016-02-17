f1: 
	mov	eax, -2147483648
	test	edi, edi
	je	.LBB0_12
	xor	eax, eax
	jmp	.LBB0_2
.LBB0_5:
	add	edi, edi
	add	eax, -65536
.LBB0_2:
	cmp	edi, 65536
	jb	.LBB0_5
	cmp	edi, 131071
	jbe	.LBB0_4
.LBB0_6:
	mov	ecx, edi
	shr	ecx
	add	eax, 65536
	cmp	edi, 262143
	mov	edi, ecx
	ja	.LBB0_6
	jmp	.LBB0_7
.LBB0_4:
	mov	ecx, edi
.LBB0_7:
	mov	ecx, ecx
	mov	edx, 32768
	mov	esi, 16
.LBB0_8:
	imul	rcx, rcx
	mov	rdi, rcx
	shr	rdi, 33
	je	.LBB0_9
	shr	rcx, 17
	add	eax, edx
	jmp	.LBB0_11
.LBB0_9:
	shr	rcx, 16
.LBB0_11
	sar	edx
	dec	rsi
	jne	.LBB0_8
.LBB0_12:
	ret

f2:
	movsxd	rax, edi
	movsxd	rcx, esi
	imul	rcx, rax
	mov	rax, rcx
	sar	rax, 63
	shr	rax, 48
	add	rax, rcx
	shr	rax, 16
	ret

f3:
	movsxd	rax, edi
	shl	rax, 16
	movsxd	rcx, esi
	cqo
	idiv	rcx
	ret

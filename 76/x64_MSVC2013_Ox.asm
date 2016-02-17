f3	PROC
	movsxd	rax, ecx
	movsxd	rcx, edx
	shl	rax, 16
	cdq
	idiv	rcx
	ret	0
f3	ENDP

f2	PROC
	movsxd	rax, ecx
	movsxd	rcx, edx
	imul	rax, rcx
	cdq
	movzx	edx, dx
	add	rax, rdx
	sar	rax, 16
	ret	0
f2	ENDP

f1	PROC
	xor	edx, edx
	mov	r9d, 32768
	mov	r8d, ecx
	test	ecx, ecx
	jne	SHORT $LN13@f1
	mov	eax, -2147483648 ; ffffffff80000000H
	ret	0
$LN13@f1:
	cmp	ecx, 65536
	jae	SHORT $LN14@f1
	npad	3
$LL8@f1:
	add	ecx, ecx
	sub	edx, 65536
	cmp	ecx, 65536
	jb	SHORT $LL8@f1
$LN14@f1:
	cmp	ecx, 131072
	jb	SHORT $LN5@f1
	npad	8
$LL6@f1:
	shr	ecx, 1
	add	edx, 65536
	cmp	ecx, 131072
	jae	SHORT $LL6@f1
$LN5@f1:
	mov	ecx, 16
	npad	11
$LL4@f1:
	imul	r8, r8
	shr	r8, 16
	cmp	r8, 131072
	jb	SHORT $LN1@f1
	shr	r8, 1
	add	edx, r9d
$LN1@f1:
	sar	r9d, 1
	dec	rcx
	jne	SHORT $LL4@f1
	mov	eax, edx
	ret	0
f1	ENDP

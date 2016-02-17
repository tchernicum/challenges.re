var1$ = 8
f PROC
$LN29:
	mov	QWORD PTR [rsp+16], rbx
	mov	QWORD PTR [rsp+24], rsi
	mov	QWORD PTR [rsp+32], rdi
	mov	rdi, rdx
	mov	r10, rcx
	mov	rax, rdx
	lea	rsi, QWORD PTR [rcx+r8]
	lea	rbx, QWORD PTR [rdx+r9]
	mov	r11d, 128				; 00000080H
	cmp	r8, r9
	jb	SHORT $LN16@f
	mov	rcx, r9
	test	r9, r9
	je	SHORT $LN18@f
	sub	rdi, r10
	npad	10
$LL11@f:
	movzx	eax, BYTE PTR [r10]
	lea	r10, QWORD PTR [r10+1]
	mov	BYTE PTR [rdi+r10-1], al
	dec	rcx
	jne	SHORT $LL11@f
$LN18@f:
	mov	rax, r9
	mov	rbx, QWORD PTR [rsp+16]
	mov	rsi, QWORD PTR [rsp+24]
	mov	rdi, QWORD PTR [rsp+32]
	ret	0
$LN16@f:
	cmp	rcx, rsi
	jae	$LN27@f
	movzx	r9d, BYTE PTR var1$[rsp]
$LL9@f:
	cmp	rax, rbx
	jae	$LN27@f
	add	r11d, r11d
	cmp	r11d, 256
	jne	SHORT $LN7@f
	movzx	r9d, BYTE PTR [r10]
	inc	r10
	mov	r11d, 1
$LN7@f:
	test	r9b, r11b
	je	SHORT $LN6@f
	movzx	edx, BYTE PTR [r10]
	movzx	ecx, BYTE PTR [r10+1]
	add	r10, 2
	mov	r8d, edx
	shl	edx, 8
	or	ecx, edx
	shr	r8d, 2
	mov	rdx, rax
	and	ecx, 1023
	add	r8d, 3
	movsxd	rcx, ecx
	sub	rdx, rcx
	cmp	rdx, rdi
	jb	SHORT $LN27@f
	dec	r8d
	js	SHORT $LN1@f
$LL4@f:
	cmp	rax, rbx
	jae	SHORT $LN1@f
	movzx	ecx, BYTE PTR [rdx]
	inc	rax
	inc	rdx
	dec	r8d
	mov	BYTE PTR [rax-1], cl
	jns	SHORT $LL4@f
	jmp	SHORT $LN1@f
$LN6@f:
	movzx	ecx, BYTE PTR [r10]
	inc	rax
	inc	r10
	mov	BYTE PTR [rax-1], cl
$LN1@f:
	cmp	r10, rsi
	jb	$LL9@f
$LN27@f:
	mov	rbx, QWORD PTR [rsp+16]
	mov	rsi, QWORD PTR [rsp+24]
	sub	rax, rdi
	mov	rdi, QWORD PTR [rsp+32]
	ret	0
f ENDP

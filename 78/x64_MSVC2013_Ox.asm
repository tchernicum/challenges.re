f_main	PROC
$LN55:
	push	rsi
	push	rdi
	push	r15
	sub	rsp, 32
	cmp	BYTE PTR [rcx], 94
	mov	rdi, rdx
	mov	r15, rcx
	jne	SHORT $LN48@f_main
	movzx	eax, BYTE PTR [rcx+1]
	test	al, al
	je	SHORT $LN9@f_main
	movzx	ecx, BYTE PTR [rcx+2]
	cmp	cl, 42
	jne	SHORT $LN11@f_main
	lea	rdx, QWORD PTR [r15+3]
	movsx	ecx, al
	mov	r8, rdi
	call	f2
	mov	esi, eax
	add	rsp, 32
	pop	r15
	pop	rdi
	pop	rsi
	ret	0
$LN11@f_main:
	cmp	al, 36
	jne	SHORT $LN10@f_main
	test	cl, cl
	jne	SHORT $LN10@f_main
	xor	esi, esi
	cmp	BYTE PTR [rdx], sil
	sete	sil
	mov	eax, esi
	add	rsp, 32
	pop	r15
	pop	rdi
	pop	rsi
	ret	0
$LN10@f_main:
	movzx	edx, BYTE PTR [rdx]
	test	dl, dl
	je	SHORT $LN9@f_main
	cmp	al, 46
	je	SHORT $LN8@f_main
	cmp	al, dl
	jne	SHORT $LN9@f_main
$LN8@f_main:
	lea	rdx, QWORD PTR [rdi+1]
	lea	rcx, QWORD PTR [r15+2]
	call	f1
	mov	esi, eax
	add	rsp, 32
	pop	r15
	pop	rdi
	pop	rsi
	ret	0
$LN9@f_main:
	xor	esi, esi
	mov	eax, esi
	add	rsp, 32
	pop	r15
	pop	rdi
	pop	rsi
	ret	0
$LN48@f_main:
	mov	QWORD PTR [rsp+64], rbx
	mov	QWORD PTR [rsp+72], rbp
	mov	QWORD PTR [rsp+80], r12
	mov	QWORD PTR [rsp+88], r14
	xor	esi, esi
$LL4@f_main:
	movzx	eax, BYTE PTR [r15]
	test	al, al
	je	SHORT $LN43@f_main
	movzx	ecx, BYTE PTR [r15+1]
	cmp	cl, 42
	jne	SHORT $LN18@f_main
	mov	rbx, rdi
	movsx	r14, al
	npad	2
$LL26@f_main:
	lea	rcx, QWORD PTR [r15+2]
	mov	rdx, rbx
	call	f1
	test	eax, eax
	jne	SHORT $LN32@f_main
	movzx	eax, BYTE PTR [rbx]
	test	al, al
	je	SHORT $LN22@f_main
	movsx	eax, al
	inc	rbx
	cmp	eax, r14d
	je	SHORT $LL26@f_main
	cmp	r14, 46
	je	SHORT $LL26@f_main
$LN22@f_main:
	mov	eax, esi
	jmp	SHORT $LN20@f_main
$LN32@f_main:
	mov	eax, 1
	jmp	SHORT $LN20@f_main
$LN18@f_main:
	cmp	al, 36
	jne	SHORT $LN17@f_main
	test	cl, cl
	jne	SHORT $LN17@f_main
	mov	eax, esi
	cmp	BYTE PTR [rdi], al
	sete	al
	jmp	SHORT $LN20@f_main
$LN17@f_main:
	movzx	edx, BYTE PTR [rdi]
	test	dl, dl
	je	SHORT $LN43@f_main
	cmp	al, 46
	je	SHORT $LN15@f_main
	cmp	al, dl
	jne	SHORT $LN43@f_main
$LN15@f_main:
	lea	rdx, QWORD PTR [rdi+1]
	lea	rcx, QWORD PTR [r15+1]
	call	f1
$LN20@f_main:
	test	eax, eax
	jne	SHORT $LN33@f_main
$LN43@f_main:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	test	al, al
	jne	$LL4@f_main
	xor	eax, eax
$LN53@f_main:
	mov	r12, QWORD PTR [rsp+80]
	mov	rbp, QWORD PTR [rsp+72]
	mov	rbx, QWORD PTR [rsp+64]
	mov	r14, QWORD PTR [rsp+88]
	add	rsp, 32
	pop	r15
	pop	rdi
	pop	rsi
	ret	0
$LN33@f_main:
	mov	eax, 1
	jmp	SHORT $LN53@f_main
f_main	ENDP

f2	PROC
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rsi
	push	rdi
	sub	rsp, 32
	mov	rbx, r8
	mov	rsi, rdx
	mov	edi, ecx
	npad	9
$LL5@f2:
	mov	rdx, rbx
	mov	rcx, rsi
	call	f1
	test	eax, eax
	jne	SHORT $LN17@f2
	movzx	eax, BYTE PTR [rbx]
	test	al, al
	je	SHORT $LN1@f2
	movsx	eax, al
	inc	rbx
	cmp	eax, edi
	je	SHORT $LL5@f2
	cmp	edi, 46
	je	SHORT $LL5@f2
$LN1@f2:
	xor	eax, eax
	mov	rbx, QWORD PTR [rsp+48]
	mov	rsi, QWORD PTR [rsp+56]
	add	rsp, 32
	pop	rdi
	ret	0
$LN17@f2:
	mov	rbx, QWORD PTR [rsp+48]
	mov	rsi, QWORD PTR [rsp+56]
	mov	eax, 1
	add	rsp, 32
	pop	rdi
	ret	0
f2	ENDP

f1	PROC
	movzx	eax, BYTE PTR [rcx]
	mov	r8, rdx
$LN18@f1:
	test	al, al
	je	SHORT $LN10@f1
	movzx	edx, BYTE PTR [rcx+1]
	lea	r9, QWORD PTR [rcx+1]
	cmp	dl, 42
	je	SHORT $LN11@f1
	cmp	al, 36
	jne	SHORT $LN3@f1
	test	dl, dl
	je	SHORT $LN12@f1
$LN3@f1:
	movzx	ecx, BYTE PTR [r8]
	test	cl, cl
	je	SHORT $LN10@f1
	cmp	al, 46
	je	SHORT $LN1@f1
	cmp	al, cl
	jne	SHORT $LN10@f1
$LN1@f1:
	movzx	eax, BYTE PTR [r9]
	inc	r8
	mov	rcx, r9
	jmp	SHORT $LN18@f1
$LN12@f1:
	xor	eax, eax
	cmp	BYTE PTR [r8], al
	sete	al
	ret	0
$LN11@f1:
	lea	rdx, QWORD PTR [rcx+2]
	movsx	ecx, BYTE PTR [rcx]
	jmp	f2
$LN10@f1:
	xor	eax, eax
	ret	0
f1	ENDP

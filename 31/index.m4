m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #31.')

<p>What this code does?</p>

_HL2(`Optimizing MSVC 2010 x86')

_PRE_BEGIN
__real@3fe0000000000000 DQ 03fe0000000000000r
__real@3f50624dd2f1a9fc DQ 03f50624dd2f1a9fcr

_g$ = 8
tv132 = 16
_x$ = 16
f1 PROC
	fld	QWORD PTR _x$[esp-4]
	fld	QWORD PTR __real@3f50624dd2f1a9fc
	fld	QWORD PTR __real@3fe0000000000000
	fld	QWORD PTR _g$[esp-4]
$LN2@f1:
	fld	ST(0)
	fmul	ST(0), ST(1)
	fsub	ST(0), ST(4)
	call	__ftol2_sse
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR tv132[esp-4], eax
	fild	DWORD PTR tv132[esp-4]
	fcomp	ST(3)
	fnstsw	ax
	test	ah, 5
	jnp	SHORT $LN19@f1
	fld	ST(3)
	fdiv	ST(0), ST(1)
	faddp	ST(1), ST(0)
	fmul	ST(0), ST(1)
	jmp	SHORT $LN2@f1
$LN19@f1:
	fstp	ST(3)
	fstp	ST(1)
	fstp	ST(0)
	ret	0
f1 ENDP

__real@3ff0000000000000 DQ 03ff0000000000000r

_x$ = 8
f2 PROC
	fld	QWORD PTR _x$[esp-4]
	sub	esp, 16
	fstp	QWORD PTR [esp+8]
	fld1
	fstp	QWORD PTR [esp]
	call	f1
	add	esp, 16
	ret	0
f2 ENDP
_PRE_END

_HL2(`Optimizing MSVC 2012 x64')

_PRE_BEGIN
__real@3fe0000000000000 DQ 03fe0000000000000r
__real@3f50624dd2f1a9fc DQ 03f50624dd2f1a9fcr
__real@3ff0000000000000 DQ 03ff0000000000000r

x$ = 8
f	PROC
	movsdx	xmm2, QWORD PTR __real@3ff0000000000000
	movsdx	xmm5, QWORD PTR __real@3f50624dd2f1a9fc
	movsdx	xmm4, QWORD PTR __real@3fe0000000000000
	movapd	xmm3, xmm0
	npad	4
$LL4@f:
	movapd	xmm1, xmm2
	mulsd	xmm1, xmm2
	subsd	xmm1, xmm3
	cvttsd2si eax, xmm1
	cdq
	xor	eax, edx
	sub	eax, edx
	movd	xmm0, eax
	cvtdq2pd xmm0, xmm0
	comisd	xmm5, xmm0
	ja	SHORT $LN18@f
	movapd	xmm0, xmm3
	divsd	xmm0, xmm2
	addsd	xmm0, xmm2
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm4
	jmp	SHORT $LL4@f
$LN18@f:
	movapd	xmm0, xmm2
	ret	0
f	ENDP
_PRE_END

_CHALLENGE_FOOTER()


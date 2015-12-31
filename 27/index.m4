m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #27.')

<p>What does this code do?</p>

<p>Optimizing MSVC 2010:</p>

_PRE_BEGIN
_a$ = 8
_f	PROC
	mov	ecx, DWORD PTR _a$[esp-4]
	mov	eax, -968154503	; c64b2279H
	imul	ecx
	add	edx, ecx
	sar	edx, 9
	mov	eax, edx
	shr	eax, 31		; 0000001fH
	add	eax, edx
	ret	0
_f	ENDP
_PRE_END

<p>Optimizing GCC 4.9 (ARM64):</p>

_PRE_BEGIN
f:
	mov	w1, 8825
	movk	w1, 0xc64b, lsl 16
	smull	x1, w0, w1
	lsr	x1, x1, 32
	add	w1, w0, w1
	asr	w1, w1, 9
	sub	w0, w1, w0, asr 31
	ret
_PRE_END

_CHALLENGE_FOOTER()


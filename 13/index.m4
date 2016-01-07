m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #13.')

<p>What does this SSE code do?</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
f:
	xor	rax, rax
.L4:
	movdqu	xmm0, XMMWORD PTR [rsi+rax]
	movdqu	xmm1, XMMWORD PTR [rdx+rax]
	pmaxub	xmm0, xmm1
	movdqu	XMMWORD PTR [rdi+rax], xmm0
	add	rax, 16
	cmp	rax, 1024
	jne	.L4
	rep ret
_PRE_END

_CHALLENGE_FOOTER()


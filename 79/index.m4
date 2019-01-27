m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #79.')
_TAGS(`79')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4:</p>

_PRE_BEGIN
f:
	mov	eax, edi
	shr	eax, 16
	xor	eax, edi
	mov	edx, eax
	shr	edx, 8
	xor	edx, eax
	mov	eax, edx
	shr	eax, 4
	xor	eax, edx
	mov	edx, eax
	shr	edx, 2
	xor	edx, eax
	mov	eax, edx
	shr	eax
	xor	eax, edx
	and	eax, 1
	xor	eax, 1
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        eor     w0, w0, w0, lsr 16
        eor     w0, w0, w0, lsr 8
        eor     w0, w0, w0, lsr 4
        eor     w0, w0, w0, lsr 2
        eor     w0, w0, w0, lsr 1
        and     w0, w0, 1
        eor     w0, w0, 1
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        EOR      r0,r0,r0,LSR #16
        EOR      r0,r0,r0,LSR #8
        EOR      r0,r0,r0,LSR #4
        EOR      r0,r0,r0,LSR #2
        EOR      r0,r0,r0,LSR #1
        MOV      r1,#1
        BIC      r0,r1,r0
        BX       lr
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        LSRS     r1,r0,#16
        EORS     r1,r1,r0
        LSRS     r0,r1,#8
        EORS     r0,r0,r1
        LSRS     r1,r0,#4
        EORS     r1,r1,r0
        LSRS     r0,r1,#2
        EORS     r0,r0,r1
        LSRS     r1,r0,#1
        EORS     r1,r1,r0
        MOVS     r0,#1
        BICS     r0,r0,r1
        BX       lr
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        srl     $2,$4,16
        xor     $2,$2,$4
        srl     $3,$2,8
        xor     $2,$3,$2
        srl     $3,$2,4
        xor     $2,$3,$2
        srl     $3,$2,2
        xor     $2,$3,$2
        srl     $3,$2,1
        xor     $2,$3,$2
        andi    $2,$2,0x1
        j       $31
        xori    $2,$2,0x1
_PRE_END

_CHALLENGE_FOOTER()


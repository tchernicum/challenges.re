m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #34.')
_TAGS(`34')

<!--
\RU{Это довольно известный криптоалгоритм прошлого}
\RU{Как он называется}
-->

<p>This is a well-known cryptographic algorithm from the past. How is it called?</p>

_HL2(`Optimizing MSVC 2012')

_PRE_BEGIN
_in$ = 8						; size = 2
_f	PROC
	movzx	ecx, WORD PTR _in$[esp-4]
	lea	eax, DWORD PTR [ecx*4]
	xor	eax, ecx
	add	eax, eax
	xor	eax, ecx
	shl	eax, 2
	xor	eax, ecx
	and	eax, 32					; 00000020H
	shl	eax, 10					; 0000000aH
	shr	ecx, 1
	or	eax, ecx
	ret	0
_f	ENDP
_PRE_END

_HL2(`Keil (ARM Mode)')

_PRE_BEGIN
f PROC
        EOR      r1,r0,r0,LSR #2
        EOR      r1,r1,r0,LSR #3
        EOR      r1,r1,r0,LSR #5
        AND      r1,r1,#1
        LSR      r0,r0,#1
        ORR      r0,r0,r1,LSL #15
        BX       lr
        ENDP
_PRE_END

_HL2(`Keil (Thumb Mode)')

_PRE_BEGIN
f PROC
        LSRS     r1,r0,#2
        EORS     r1,r1,r0
        LSRS     r2,r0,#3
        EORS     r1,r1,r2
        LSRS     r2,r0,#5
        EORS     r1,r1,r2
        LSLS     r1,r1,#31
        LSRS     r0,r0,#1
        LSRS     r1,r1,#16
        ORRS     r0,r0,r1
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
f:
	uxth	w1, w0
	lsr	w2, w1, 3
	lsr	w0, w1, 1
	eor	w2, w2, w1, lsr 2
	eor	w2, w1, w2
	eor	w1, w2, w1, lsr 5
	and	w1, w1, 1
	orr	w0, w0, w1, lsl 15
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:
                andi    $a0, 0xFFFF
                srl     $v1, $a0, 2
                srl     $v0, $a0, 3
                xor     $v0, $v1, $v0
                xor     $v0, $a0, $v0
                srl     $v1, $a0, 5
                xor     $v0, $v1
                andi    $v0, 1
                srl     $a0, 1
                sll     $v0, 15
                jr      $ra
                or      $v0, $a0
_PRE_END

_CHALLENGE_FOOTER()


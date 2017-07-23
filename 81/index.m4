m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #81.')
_TAGS(`81')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4:</p>

_PRE_BEGIN
f:
	lea	eax, [rdi-1]
	or	edi, -2147483648
	test	eax, edi
	sete	al
	movzx	eax, al
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        sub     w1, w0, #1
        orr     w0, w0, -2147483648
        tst     w1, w0
        cset    w0, eq
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        ORR      r1,r0,#0x80000000
        SUB      r0,r0,#1
        TST      r1,r0
        MOVEQ    r0,#1
        MOVNE    r0,#0
        BX       lr
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        MOVS     r1,#1
        LSLS     r1,r1,#31
        ORRS     r1,r1,r0
        SUBS     r0,r0,#1
        TST      r1,r0
        BNE      |L0.16|
        MOVS     r0,#1
        BX       lr
|L0.16|
        MOVS     r0,#0
        BX       lr
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        li      $2,-2147483648                  # 0xffffffff80000000
        or      $2,$4,$2
        addiu   $4,$4,-1
        and     $2,$4,$2
        j       $31
        sltu    $2,$2,1
_PRE_END

_CHALLENGE_FOOTER()


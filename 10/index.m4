m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #10.')

<p>This code snippet is short, but tricky.
What does it do?
It's used heavily in low-level programming and is well-known to many low-level programmers.
There are several ways to calculate it, and this is the one of them.</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
f:
        lea     eax, [rdi-1+rsi]
        neg     esi
        and     eax, esi
        ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        add     w0, w0, w1
        neg     w1, w1
        sub     w0, w0, #1
        and     w0, w0, w1
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        ADDS     r0,r0,r1
        SUBS     r0,r0,#1
        SUBS     r1,r1,#1
        BICS     r0,r0,r1
        BX       lr
        ENDP
_PRE_END

<p>Optimizing Keil 5.05 for ARM mode generates nearly the same code, so it's omitted here.</p>

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        addiu   $4,$4,-1
        addu    $4,$4,$5
        subu    $2,$0,$5
        j       $31
        and     $2,$2,$4
_PRE_END

_CHALLENGE_FOOTER()


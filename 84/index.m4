m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #84.')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4 (x64, SSE enabled):</p>

_PRE_BEGIN
f:
.LFB0:
	mulsd	xmm0, QWORD PTR .LC0[rip]
	divsd	xmm0, QWORD PTR .LC1[rip]
	ret
.LC0:
	.long	1413754136
	.long	1074340347
.LC1:
	.long	0
	.long	1080459264
_PRE_END

<p>Optimizing GCC 4.8.4 (FPU code (<i>-mfpmath=387</i> key)):</p>

_PRE_BEGIN
f:
	movsd	QWORD PTR [rsp-24], xmm0
	fldpi
	fld	QWORD PTR [rsp-24]
	fmulp	st(1), st
	fdiv	DWORD PTR .LC1[rip]
	fstp	QWORD PTR [rsp-16]
	movsd	xmm0, QWORD PTR [rsp-16]
	ret
.LC1:
	.long	1127481344
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        ldr     d1, .LC0
        fmul    d0, d0, d1
        ldr     d1, .LC1
        fdiv    d0, d0, d1
        ret
.LC0:
        .word   1413754136
        .word   1074340347
.LC1:
        .word   0
        .word   1080459264
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        LDR      r2,|L0.32|
        LDR      r3,|L0.36|
        BL       __aeabi_dmul
        POP      {r4,lr}
        LDR      r3,|L0.40|
        MOV      r2,#0
        B        __aeabi_ddiv
        ENDP

|L0.32|
        DCD      0x54442d18
|L0.36|
        DCD      0x400921fb
|L0.40|
        DCD      0x40668000

        DCD      0x00000000
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

<p>... the code is almost the same as for ARM mode.</p>

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        lui     $2,%hi($LC0)
        lwc1    $f0,%lo($LC0+4)($2)
        nop
        lwc1    $f1,%lo($LC0)($2)
        lui     $2,%hi($LC1)
        mul.d   $f0,$f12,$f0
        lwc1    $f2,%lo($LC1+4)($2)
        nop
        lwc1    $f3,%lo($LC1)($2)
        j       $31
        div.d   $f0,$f0,$f2
$LC0:
        .word   1074340347
        .word   1413754136
$LC1:
        .word   1080459264
        .word   0
_PRE_END

_CHALLENGE_FOOTER()


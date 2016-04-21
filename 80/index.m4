m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #80.')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4 (SSE enabled):</p>

_PRE_BEGIN
f:
	test	edi, edi
	movapd	xmm1, xmm0
	je	.L7
	js	.L15
	xorpd	xmm0, xmm0
	ucomisd	xmm1, xmm0
	jnp	.L16
.L10:
	movsd	xmm0, QWORD PTR .LC0[rip]
.L6:
	test	dil, 1
	je	.L5
	mulsd	xmm0, xmm1
.L5:
	mov	eax, edi
	mulsd	xmm1, xmm1
	shr	eax, 31
	add	edi, eax
	sar	edi
	jne	.L6
	rep ret
.L16:
	jne	.L10
	rep ret
.L7:
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
.L15:
	movsd	xmm0, QWORD PTR .LC0[rip]
	neg	edi
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	xorpd	xmm0, xmm0
	ucomisd	xmm1, xmm0
	jp	.L10
	jmp	.L16
.LC0:
	.long	0
	.long	1072693248
_PRE_END

<p>Optimizing GCC 4.8.4 (FPU code (<i>-mfpmath=387</i> key)):</p>

_PRE_BEGIN
f:
	movsd	QWORD PTR [rsp-24], xmm0
	test	edi, edi
	fld	QWORD PTR [rsp-24]
	je	.L8
	js	.L13
	fldz
	fld	st(0)
	fxch	st(2)
	fucomi	st, st(2)
	fstp	st(2)
	jnp	.L14
	fstp	st(0)
	jmp	.L11
.L17:
	fstp	st(0)
.L11:
	fld1
	jmp	.L7
.L16:
	fxch	st(1)
.L7:
	test	dil, 1
	je	.L15
	fmul	st, st(1)
	fstp	QWORD PTR [rsp-16]
	fld	QWORD PTR [rsp-16]
	fxch	st(1)
	jmp	.L6
.L15:
	fxch	st(1)
.L6:
	fmul	st, st(0)
	mov	eax, edi
	shr	eax, 31
	add	edi, eax
	sar	edi
	fstp	QWORD PTR [rsp-16]
	fld	QWORD PTR [rsp-16]
	jne	.L16
	fstp	st(0)
	fstp	QWORD PTR [rsp-24]
.L2:
	movsd	xmm0, QWORD PTR [rsp-24]
	ret
.L14:
	fstp	QWORD PTR [rsp-24]
	jne	.L11
	fstp	st(0)
	jmp	.L2
.L8:
	fstp	st(0)
	fld1
	fstp	QWORD PTR [rsp-24]
	movsd	xmm0, QWORD PTR [rsp-24]
	ret
.L13:
	fld1
	neg	edi
	fdivrp	st(1), st
	fstp	QWORD PTR [rsp-16]
	fld	QWORD PTR [rsp-16]
	fldz
	fld	st(0)
	fxch	st(2)
	fucomi	st, st(2)
	fstp	st(2)
	jp	.L17
	jmp	.L14
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        cmp     w0, wzr
        fmov    d1, d0
        beq     .L6
        blt     .L13
        fcmp    d1, #0.0
        fmov    d0, xzr
        beq     .L2
.L14:
        fmov    d0, 1.0e+0
.L5:
        add     w1, w0, w0, lsr 31
        tbz     x0, 0, .L4
        fmul    d0, d0, d1
.L4:
        asr     w0, w1, 1
        fmul    d1, d1, d1
        cbnz    w0, .L5
.L2:
        ret
.L6:
        fmov    d0, 1.0e+0
        ret
.L13:
        fmov    d0, 1.0e+0
        neg     w0, w0
        fdiv    d1, d0, d1
        fmov    d0, xzr
        fcmp    d1, #0.0
        bne     .L14
        b       .L2
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r8,lr}
        LDR      r8,|L0.188|
        SUBS     r4,r2,#0
        MOV      r6,r1
        MOV      r5,r0
        MOV      r7,#0
        MOV      r1,r8
        MOVEQ    r0,#0
        POPEQ    {r4-r8,pc}
        BGE      |L0.68|
        RSB      r4,r2,#0
        MOV      r2,r0
        MOV      r3,r6
        MOV      r0,#0
        BL       __aeabi_ddiv
        MOV      r5,r0
        MOV      r6,r1
|L0.68|
        MOV      r2,#0
        MOV      r3,r2
        MOV      r1,r6
        BL       __aeabi_cdcmpeq
        MOVEQ    r0,#0
        MOVEQ    r1,r0
        POPEQ    {r4-r8,pc}
|L0.96|
        TST      r4,#1
        BEQ      |L0.132|
        MOV      r2,r7
        MOV      r3,r8
        MOV      r0,r5
        MOV      r1,r6
        BL       __aeabi_dmul
        MOV      r7,r0
        MOV      r8,r1
|L0.132|
        ADD      r0,r4,r4,LSR #31
        ASR      r4,r0,#1
        MOV      r2,r5
        MOV      r3,r6
        MOV      r0,r2
        MOV      r1,r3
        BL       __aeabi_dmul
        CMP      r4,#0
        MOV      r5,r0
        MOV      r6,r1
        MOVEQ    r0,r7
        MOVEQ    r1,r8
        BNE      |L0.96|
        POP      {r4-r8,pc}
        ENDP

|L0.188|
        DCD      0x3ff00000
        DCD      0x00000000
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r3-r7,lr}
        MOVS     r5,r0
        LDR      r0,|L0.116|
        MOVS     r6,r1
        MOVS     r4,r2
        MOVS     r7,#0
        MOVS     r1,r0
        CMP      r2,#0
        STR      r0,[sp,#0]
        BEQ      |L0.60|
        CMP      r4,#0
        BGE      |L0.40|
        RSBS     r4,r2,#0
        MOVS     r2,r5
        MOVS     r3,r6
        MOVS     r0,#0
        BL       __aeabi_ddiv
        MOVS     r5,r0
        MOVS     r6,r1
|L0.40|
        MOVS     r2,#0
        MOVS     r3,r2
        MOVS     r0,r5
        MOVS     r1,r6
        BL       __aeabi_cdcmpeq
        BNE      |L0.64|
        MOVS     r0,#0
        MOVS     r1,r0
        POP      {r3-r7,pc}
|L0.60|
        MOVS     r0,#0
        POP      {r3-r7,pc}
|L0.64|
        LSLS     r0,r4,#31
        BEQ      |L0.84|
        LDR      r3,[sp,#0]
        MOVS     r2,r7
        MOVS     r0,r5
        MOVS     r1,r6
        BL       __aeabi_dmul
        MOVS     r7,r0
        STR      r1,[sp,#0]
|L0.84|
        LSRS     r0,r4,#31
        ADDS     r0,r0,r4
        ASRS     r4,r0,#1
        MOVS     r2,r5
        MOVS     r3,r6
        MOVS     r0,r2
        MOVS     r1,r3
        BL       __aeabi_dmul
        MOVS     r5,r0
        MOVS     r6,r1
        CMP      r4,#0
        BNE      |L0.64|
        LDR      r1,[sp,#0]
        MOVS     r0,r7
        POP      {r3-r7,pc}
        ENDP

|L0.116|
        DCD      0x3ff00000
        DCD      0x00000000
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        beq     $6,$0,$L2
        lui     $2,%hi($LC0)
        bltz    $6,$L13
        nop
        mtc1    $0,$f0
        nop
        mtc1    $0,$f1
        nop
        c.eq.d  $f12,$f0
        nop
        bc1t    $L15
        nop
$L14:
        lui     $2,%hi($LC0)
        lwc1    $f0,%lo($LC0+4)($2)
        nop
        lwc1    $f1,%lo($LC0)($2)
$L8:
        srl     $3,$6,31
        addu    $3,$3,$6
        andi    $2,$6,0x1
        beq     $2,$0,$L7
        sra     $6,$3,1
        mul.d   $f0,$f0,$f12
$L7:
        beq     $6,$0,$L15
        nop
        b       $L8
        mul.d   $f12,$f12,$f12
$L2:
        lwc1    $f0,%lo($LC0+4)($2)
        nop
        lwc1    $f1,%lo($LC0)($2)
$L15:
        j       $31
        nop
$L13:
        lwc1    $f0,%lo($LC0+4)($2)
        nop
        lwc1    $f1,%lo($LC0)($2)
        nop
        div.d   $f12,$f0,$f12
        mtc1    $0,$f0
        nop
        mtc1    $0,$f1
        nop
        c.eq.d  $f12,$f0
        nop
        bc1f    $L14
        subu    $6,$0,$6
        b       $L15
        nop
$LC0:
        .word   1072693248
        .word   0

_PRE_END

_CHALLENGE_FOOTER()


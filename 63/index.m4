m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #63.')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4 (SSE enabled):</p>

_PRE_BEGIN
m:
	xorpd	xmm2, xmm2
	xor	r10d, r10d
.L2:
	lea	r9, [rdi+r10]
	xor	r8d, r8d
.L7:
	lea	rcx, [rsi+r8]
	movapd	xmm1, xmm2
	mov	QWORD PTR [rdx+r8], 0
	xor	eax, eax
.L4:
	movsd	xmm0, QWORD PTR [r9+rax]
	add	rax, 8
	add	rcx, 2400
	mulsd	xmm0, QWORD PTR [rcx-2400]
	cmp	rax, 800
	addsd	xmm1, xmm0
	movsd	QWORD PTR [rdx+r8], xmm1
	jne	.L4
	add	r8, 8
	cmp	r8, 2400
	jne	.L7
	add	r10, 800
	add	rdx, 2400
	cmp	r10, 160000
	jne	.L2
	rep ret
_PRE_END

<p>Optimizing GCC 4.8.4 (FPU code (<i>-mfpmath=387</i> key)):</p>

_PRE_BEGIN
m:
	fldz
	xor	r10d, r10d
.L2:
	lea	r9, [rdi+r10]
	xor	r8d, r8d
.L7:
	lea	rcx, [rsi+r8]
	fld	st(0)
	mov	QWORD PTR [rdx+r8], 0
	xor	eax, eax
.L4:
	fld	QWORD PTR [rcx]
	add	rcx, 2400
	fmul	QWORD PTR [r9+rax]
	add	rax, 8
	cmp	rax, 800
	faddp	st(1), st
	fstp	QWORD PTR [rsp-16]
	fld	QWORD PTR [rsp-16]
	fst	QWORD PTR [rdx+r8]
	jne	.L4
	fstp	st(0)
	add	r8, 8
	cmp	r8, 2400
	jne	.L7
	add	r10, 800
	add	rdx, 2400
	cmp	r10, 160000
	jne	.L2
	fstp	st(0)
	ret
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
m PROC
        PUSH     {r0-r2,r4-r11,lr}
        MOV      r11,r2
        MOV      r10,r1
        MOV      r6,#0
|L0.16|
        LDR      r1,[sp,#0]
        ADD      r0,r6,r6,LSL #3
        ADD      r0,r0,r6,LSL #4
        ADD      r8,r1,r0,LSL #5
        RSB      r0,r6,r6,LSL #4
        ADD      r0,r0,r0,LSL #2
        MOV      r5,#0
        ADD      r9,r11,r0,LSL #5
|L0.48|
        MOV      r0,#0
        MOV      r1,r0
        ADD      r7,r9,r5,LSL #3
        STM      r7,{r0,r1}
        MOV      r4,r0
|L0.68|
        RSB      r0,r4,r4,LSL #4
        ADD      r0,r0,r0,LSL #2
        ADD      r0,r10,r0,LSL #5
        ADD      r0,r0,r5,LSL #3
        LDM      r0,{r2,r3}
        ADD      r1,r8,r4,LSL #3
        LDM      r1,{r0,r1}
        BL       __aeabi_dmul
        LDM      r7,{r2,r3}
        BL       __aeabi_dadd
        ADD      r4,r4,#1
        STM      r7,{r0,r1}
        CMP      r4,#0x64
        BLT      |L0.68|
        ADD      r5,r5,#1
        CMP      r5,#0x12c
        BLT      |L0.48|
        ADD      r6,r6,#1
        CMP      r6,#0xc8
        BLT      |L0.16|
        POP      {r1-r11,pc}
        ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
m PROC
        PUSH     {r0-r2,r4-r7,lr}
        MOVS     r0,#0
        SUB      sp,sp,#8
        STR      r0,[sp,#0]
|L0.8|
        MOVS     r1,#0x19
        LSLS     r1,r1,#5
        MULS     r0,r1,r0
        LDR      r1,[sp,#8]
        MOVS     r5,#0
        ADDS     r0,r0,r1
        STR      r0,[sp,#4]
        LDR      r0,[sp,#0]
        MOVS     r1,#0x4b
        LSLS     r1,r1,#5
        MULS     r0,r1,r0
        LDR      r1,[sp,#0x10]
        ADDS     r7,r0,r1
|L0.34|
        MOVS     r0,#0
        LSLS     r6,r5,#3
        MOVS     r1,r0
        ADDS     r2,r7,r6
        STM      r2!,{r0,r1}
        MOVS     r4,r0
|L0.46|
        MOVS     r0,#0x4b
        LSLS     r0,r0,#5
        MULS     r0,r4,r0
        LDR      r1,[sp,#0xc]
        ADDS     r0,r0,r1
        ADDS     r0,r0,r6
        LDM      r0!,{r2,r3}
        LDR      r0,[sp,#4]
        LSLS     r1,r4,#3
        ADDS     r1,r0,r1
        LDM      r1,{r0,r1}
        BL       __aeabi_dmul
        ADDS     r3,r7,r6
        LDM      r3,{r2,r3}
        BL       __aeabi_dadd
        ADDS     r2,r7,r6
        ADDS     r4,r4,#1
        STM      r2!,{r0,r1}
        CMP      r4,#0x64
        BLT      |L0.46|
        MOVS     r0,#0xff
        ADDS     r0,r0,#0x2d
        ADDS     r5,r5,#1
        CMP      r5,r0
        BLT      |L0.34|
        LDR      r0,[sp,#0]
        ADDS     r0,r0,#1
        CMP      r0,#0xc8
        STR      r0,[sp,#0]
        BLT      |L0.8|
        ADD      sp,sp,#0x14
        POP      {r4-r7,pc}
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
m:
        fmov    d3, xzr
        add     x3, x2, 479232
        add     x7, x3, 768
.L2:
        mov     x6, 0
.L4:
        add     x5, x6, 237568
        add     x3, x1, x6
        fmov    d1, xzr
        add     x5, x5, 2432
        add     x5, x1, x5
        mov     x4, x0
        str     d3, [x2, x6]
.L3:
        ldr     d2, [x3]
        add     x3, x3, 2400
        ldr     d0, [x4], 8
        cmp     x5, x3
        fmul    d0, d0, d2
        fadd    d1, d1, d0
        str     d1, [x2, x6]
        bne     .L3
        add     x6, x6, 8
        cmp     x6, 2400
        bne     .L4
        add     x2, x2, 2400
        add     x0, x0, 800
        cmp     x2, x7
        bne     .L2
        ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
m:
        li      $13,458752
        ori     $13,$13,0x5300
        move    $12,$0
        li      $9,100
        li      $11,2400
$L2:
        addu    $8,$6,$12
        move    $10,$0
$L4:
        mtc1    $0,$f0
        addu    $7,$5,$10
        mtc1    $0,$f1
        move    $3,$4
        swc1    $f0,4($8)
        swc1    $f1,0($8)
        move    $2,$0
$L3:
        lwc1    $f4,4($3)
        lwc1    $f2,4($7)
        lwc1    $f5,0($3)
        lwc1    $f3,0($7)
        addiu   $2,$2,1
        mul.d   $f2,$f4,$f2
        addiu   $3,$3,8
        addiu   $7,$7,2400
        add.d   $f0,$f0,$f2
        swc1    $f0,4($8)
        bne     $2,$9,$L3
        swc1    $f1,0($8)
        addiu   $10,$10,8
        bne     $10,$11,$L4
        addiu   $8,$8,8
        addiu   $12,$12,2400
        bne     $12,$13,$L2
        addiu   $4,$4,800
        j       $31
        nop
_PRE_END

<p>It had a bug which was fixed 21-Apr-2016, thanks to Diego Boy.</p>

_CHALLENGE_FOOTER()


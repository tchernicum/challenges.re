m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #5.')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4 (x64):</p>

_PRE_BEGIN
f:
	cmp	rcx, rsi
	ja	.L10
	sub	rsi, rcx
	add	rsi, 1
	mov	r11, rsi
	je	.L10
	test	rcx, rcx
	jne	.L16
	mov	rax, rdi
	ret
.L10:
	xor	eax, eax
	ret
.L16:
	push	rbx
	xor	r10d, r10d
	mov	r9d, 1
.L4:
	lea	rax, [rdi+r10]
	xor	esi, esi
	xor	r8d, r8d
.L8:
	movzx	ebx, BYTE PTR [rdx+rsi]
	cmp	BYTE PTR [rax+rsi], bl
	cmovne	r8d, r9d
	add	rsi, 1
	cmp	rsi, rcx
	jne	.L8
	test	r8d, r8d
	je	.L12
	add	r10, 1
	cmp	r10, r11
	jne	.L4
	xor	eax, eax
.L12:
	pop	rbx
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        cmp     x3, x1
        bhi     .L9
        sub     x1, x1, x3
        mov     x8, 0
        adds    x9, x1, 1
        beq     .L9
.L12:
        cbz     x3, .L14
        mov     x1, 0
        mov     w4, 0
        add     x7, x0, x8
.L4:
        ldrb    w6, [x7, x1]
        ldrb    w5, [x2, x1]
        add     x1, x1, 1
        cmp     w6, w5
        csinc   w4, w4, wzr, eq
        cmp     x1, x3
        bne     .L4
        cbz     w4, .L6
        add     x8, x8, 1
        cmp     x8, x9
        bne     .L12
.L9:
        mov     x0, 0
        ret
.L14:
        add     x7, x0, x8
.L6:
        mov     x0, x7
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r7,lr}
        CMP      r3,r1
        SUBLS    r1,r1,r3
        MOVLS    r12,#0
        ADDLS    r5,r1,#1
        BHI      |L0.96|
|L0.24|
        CMP      r12,r5
        MOVCC    r4,#0
        MOVCC    r1,r4
        BCS      |L0.96|
|L0.40|
        CMP      r1,r3
        BCS      |L0.76|
        ADD      r6,r12,r1
        LDRB     r6,[r0,r6]
        LDRB     r7,[r2,r1]
        ADD      r1,r1,#1
        CMP      r6,r7
        MOVNE    r4,#1
        B        |L0.40|
|L0.76|
        CMP      r4,#0
        ADDNE    r12,r12,#1
        ADDEQ    r0,r0,r12
        BNE      |L0.24|
        POP      {r4-r7,pc}
|L0.96|
        MOV      r0,#0
        POP      {r4-r7,pc}
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r7,lr}
        CMP      r3,r1
        MOV      r12,r2
        BHI      |L0.52|
        MOVS     r4,#0
        SUBS     r5,r1,r3
        ADDS     r5,r5,#1
        B        |L0.48|
|L0.16|
        MOVS     r6,#0
        MOVS     r1,r6
        B        |L0.38|
|L0.22|
        ADDS     r2,r4,r1
        LDRB     r7,[r0,r2]
        MOV      r2,r12
        LDRB     r2,[r2,r1]
        CMP      r7,r2
        BEQ      |L0.36|
        MOVS     r6,#1
|L0.36|
        ADDS     r1,r1,#1
|L0.38|
        CMP      r1,r3
        BCC      |L0.22|
        CMP      r6,#0
        BEQ      |L0.56|
        ADDS     r4,r4,#1
|L0.48|
        CMP      r5,r4
        BHI      |L0.16|
|L0.52|
        MOVS     r0,#0
        POP      {r4-r7,pc}
|L0.56|
        ADDS     r0,r0,r4
        POP      {r4-r7,pc}
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        sltu    $2,$5,$7
        beq     $2,$0,$L16
        move    $2,$0
$L17:
        j       $31
        nop
$L16:
        addiu   $5,$5,1
        subu    $5,$5,$7
        beq     $5,$0,$L17
        nop
        beq     $7,$0,$L17
        move    $2,$4
        move    $13,$0
$L9:
        addu    $2,$4,$13
        move    $8,$2
        move    $3,$0
        move    $12,$0
$L6:
        addu    $9,$6,$3
        lbu     $10,0($9)
        lbu     $11,0($8)
        addiu   $3,$3,1
        beq     $11,$10,$L5
        sltu    $9,$3,$7
        li      $12,1                   # 0x1
$L5:
        bne     $9,$0,$L6
        addiu   $8,$8,1
        beq     $12,$0,$L17
        addiu   $13,$13,1
        sltu    $2,$13,$5
        bne     $2,$0,$L9
        move    $2,$0
        b       $L17
        nop
_PRE_END

<p>It had a bug which was fixed 21-Apr-2016, thanks to Diego Boy and Niklas.</p>

_CHALLENGE_FOOTER()


m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #83.')
_TAGS(`83')

<p>What does these two functions do?</p>

<p>Optimizing GCC 4.8.4 (x64):</p>

_PRE_BEGIN
f1:
	lea	rax, [rdi-1+rsi]
	cmp	rdi, rax
	jnb	.L1
.L5:
	movzx	edx, BYTE PTR [rax]
	sub	rax, 1
	xor	dl, BYTE PTR [rdi]
	mov	BYTE PTR [rdi], dl
	xor	dl, BYTE PTR [rax+1]
	mov	BYTE PTR [rax+1], dl
	xor	BYTE PTR [rdi], dl
	add	rdi, 1
	cmp	rdi, rax
	jb	.L5
.L1:
	rep ret

f2:
	push	r12
	mov	r12, rdx
	push	rbp
	mov	rbp, rsi
	push	rbx
	mov	rbx, rdi
	call	f1
	lea	rdi, [rbx+rbp]
	mov	rsi, r12
	call	f1
	mov	rdi, rbx
	lea	rsi, [rbp+0+r12]
	pop	rbx
	pop	rbp
	pop	r12
	jmp	f1
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f1:
        sub     x1, x1, #1
        add     x1, x0, x1
        cmp     x0, x1
        bcs     .L1
.L5:
        ldrb    w3, [x1]
        ldrb    w2, [x0]
        eor     w2, w3, w2
        uxtb    w2, w2
        strb    w2, [x0]
        ldrb    w3, [x1]
        eor     w2, w3, w2
        strb    w2, [x1], -1
        ldrb    w3, [x0]
        eor     w2, w2, w3
        strb    w2, [x0], 1
        cmp     x0, x1
        bcc     .L5
.L1:
        ret

f2:
        stp     x29, x30, [sp, -48]!
        add     x29, sp, 0
        stp     x19, x20, [sp, 16]
        str     x21, [sp, 32]
        mov     x20, x2
        mov     x21, x1
        mov     x19, x0
        bl      f1
        add     x0, x19, x21
        mov     x1, x20
        bl      f1
        add     x1, x21, x20
        mov     x0, x19
        ldr     x21, [sp, 32]
        ldp     x19, x20, [sp, 16]
        ldp     x29, x30, [sp], 48
        b       f1

_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
||f1|| PROC
        ADD      r1,r1,r0
        SUB      r1,r1,#1
        B        |L0.60|
|L0.12|
        LDRB     r2,[r0,#0]
        LDRB     r3,[r1,#0]
        EOR      r2,r2,r3
        STRB     r2,[r0,#0]
        LDRB     r3,[r1,#0]
        EOR      r2,r2,r3
        STRB     r2,[r1],#-1
        LDRB     r12,[r0,#0]
        MOV      r3,r0
        ADD      r0,r0,#1
        EOR      r2,r2,r12
        STRB     r2,[r3,#0]
|L0.60|
        CMP      r0,r1
        BCC      |L0.12|
        BX       lr
        ENDP

||f2|| PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r2
        MOV      r4,r1
        MOV      r6,r0
        BL       ||f1||
        ADD      r0,r6,r4
        MOV      r1,r5
        BL       ||f1||
        ADD      r1,r4,r5
        MOV      r0,r6
        POP      {r4-r6,lr}
        B        ||f1||
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
||f1|| PROC
        PUSH     {r4,lr}
        ADDS     r1,r0,r1
|L0.4|
        SUBS     r1,r1,#1
        CMP      r0,r1
        BCS      |L0.36|
        LDRB     r3,[r0,#0]
        LDRB     r2,[r1,#0]
        MOVS     r4,r0
        EORS     r3,r3,r2
        STRB     r3,[r0,#0]
        LDRB     r2,[r1,#0]
        EORS     r2,r2,r3
        STRB     r2,[r1,#0]
        LDRB     r3,[r0,#0]
        ADDS     r0,r0,#1
        EORS     r3,r3,r2
        STRB     r3,[r4,#0]
        B        |L0.4|
|L0.36|
        POP      {r4,pc}
        ENDP

||f2|| PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r2
        MOVS     r4,r1
        MOVS     r6,r0
        BL       ||f1||
        ADDS     r0,r6,r4
        MOVS     r1,r5
        BL       ||f1||
        ADDS     r1,r4,r5
        MOVS     r0,r6
        BL       ||f1||
        POP      {r4-r6,pc}
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f1:
        addiu   $5,$5,-1
        addu    $5,$4,$5
        sltu    $2,$4,$5
        beq     $2,$0,$L8
        nop
$L5:
        lbu     $3,0($5)
        lbu     $2,0($4)
        nop
        xor     $2,$3,$2
        sll     $2,$2,24
        sra     $2,$2,24
        sb      $2,0($4)
        lbu     $3,0($5)
        nop
        xor     $2,$2,$3
        sll     $2,$2,24
        sra     $2,$2,24
        sb      $2,0($5)
        lbu     $3,0($4)
        addiu   $5,$5,-1
        xor     $2,$2,$3
        sb      $2,0($4)
        addiu   $4,$4,1
        sltu    $2,$4,$5
        bne     $2,$0,$L5
        nop
$L8:
        j       $31
        nop

f2:
        addiu   $sp,$sp,-40
        sw      $18,32($sp)
        sw      $17,28($sp)
        move    $18,$6
        move    $17,$5
        sw      $16,24($sp)
        sw      $31,36($sp)
        jal     f1
        move    $16,$4

        addu    $4,$16,$17
        jal     f1
        move    $5,$18
        addu    $5,$18,$17
        move    $4,$16
        lw      $31,36($sp)
        lw      $18,32($sp)
        lw      $17,28($sp)
        lw      $16,24($sp)
        j       f1
        addiu   $sp,$sp,40
_PRE_END

_CHALLENGE_FOOTER()


m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #82.')
_TAGS(`82')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4:</p>

_PRE_BEGIN
f:
	push	rbp
	xor	ebp, ebp
	push	rbx
	mov	rbx, rdi
	sub	rsp, 8
	mov	rdi, QWORD PTR [rdi]
	test	rdi, rdi
	je	.L2
.L3:
	call	strlen
	cmp	ebp, eax
	cmovb	ebp, eax
	add	rbx, 8
	mov	rdi, QWORD PTR [rbx]
	test	rdi, rdi
	jne	.L3
.L2:
	add	rsp, 8
	mov	eax, ebp
	pop	rbx
	pop	rbp
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        stp     x29, x30, [sp, -32]!
        add     x29, sp, 0
        ldr     x1, [x0]
        stp     x19, x20, [sp, 16]
        mov     x20, x0
        mov     w19, 0
        cbz     x1, .L2
.L3:
        mov     x0, x1
        bl      strlen
        cmp     w19, w0
        ldr     x1, [x20, 8]!
        csel    w19, w19, w0, cs
        cbnz    x1, .L3
.L2:
        mov     w0, w19
        ldp     x19, x20, [sp, 16]
        ldp     x29, x30, [sp], 32
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOV      r4,#0
        B        |L0.32|
|L0.16|
        BL       strlen
        CMP      r0,r4
        MOVHI    r4,r0
        ADD      r5,r5,#4
|L0.32|
        LDR      r0,[r5,#0]
        CMP      r0,#0
        MOVEQ    r0,r4
        BNE      |L0.16|
        POP      {r4-r6,pc}
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        MOVS     r4,#0
        B        |L0.20|
|L0.8|
        BL       strlen
        CMP      r0,r4
        BLS      |L0.18|
        MOVS     r4,r0
|L0.18|
        ADDS     r5,r5,#4
|L0.20|
        LDR      r0,[r5,#0]
        CMP      r0,#0
        BNE      |L0.8|
        MOVS     r0,r4
        POP      {r4-r6,pc}
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-40
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,36($sp)
        sw      $17,32($sp)
        sw      $16,28($sp)
        move    $16,$4
        lw      $4,0($4)
        nop
        beq     $4,$0,$L3
        move    $17,$0
$L5:
        lw      $25,%call16(strlen)($28)
        nop
        jalr    $25
        addiu   $16,$16,4
        sltu    $3,$17,$2
        lw      $28,16($sp)
        beq     $3,$0,$L4
        nop
        move    $17,$2
$L4:
        lw      $4,0($16)
        nop
        bne     $4,$0,$L5
        nop
$L3:
        lw      $31,36($sp)
        move    $2,$17
        lw      $17,32($sp)
        lw      $16,28($sp)
        j       $31
        addiu   $sp,$sp,40
_PRE_END

_CHALLENGE_FOOTER()


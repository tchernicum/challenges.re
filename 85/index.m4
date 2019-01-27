m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #85.')
_TAGS(`85')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.4 (x64):</p>

_PRE_BEGIN
f:
	push	r13
	mov	r13, rdi
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 8
	test	rdi, rdi
	je	.L2
	call	strlen
	test	eax, eax
	movsx	rbx, eax
	je	.L2
	cdqe
	lea	rbp, [r13-1+rax]
	jmp	.L3
.L5:
	call	__ctype_b_loc
	movsx	rcx, BYTE PTR [rbp+0]
	mov	rdx, QWORD PTR [rax]
	sub	rbp, 1
	test	BYTE PTR [rdx+1+rcx*2], 32
	je	.L6
	movsx	rbx, r12d
.L3:
	mov	r12d, ebx
	sub	r12d, 1
	jns	.L5
.L6:
	mov	BYTE PTR [r13+0+rbx], 0
.L2:
	add	rsp, 8
	mov	rax, r13
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
f:
        stp     x29, x30, [sp, -48]!
        add     x29, sp, 0
        stp     x21, x22, [sp, 32]
        stp     x19, x20, [sp, 16]
        mov     x22, x0
        cbz     x0, .L2
        bl      strlen
        mov     w19, w0
        cbz     w0, .L2
        sxtw    x20, w0
        sub     x20, x20, #1
        add     x20, x22, x20
        b       .L3
.L4:
        bl      __ctype_b_loc
        ldr     x2, [x0]
        ldrb    w1, [x20], -1
        add     x1, x1, x1
        ldrh    w1, [x2, x1]
        tbz     x1, 13, .L5
        mov     w19, w21
.L3:
        subs    w21, w19, #1
        bpl     .L4
.L5:
        strb    wzr, [x22, w19, sxtw]
.L2:
        mov     x0, x22
        ldp     x19, x20, [sp, 16]
        ldp     x21, x22, [sp, 32]
        ldp     x29, x30, [sp], 48
        ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        BEQ      |L0.72|
        BL       strlen
        MOVS     r4,r0
        BEQ      |L0.72|
        B        |L0.52|
|L0.28|
        BL       __rt_ctype_table
        LDRB     r1,[r5,r4]
        LDR      r0,[r0,#0]
        LDRB     r0,[r0,r1]
        TST      r0,#1
        BEQ      |L0.60|
|L0.52|
        SUBS     r4,r4,#1
        BPL      |L0.28|
|L0.60|
        MOV      r0,#0
        ADD      r1,r4,#1
        STRB     r0,[r5,r1]
|L0.72|
        MOV      r0,r5
        POP      {r4-r6,pc}
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        BEQ      |L0.40|
        BL       strlen
        MOVS     r4,r0
        BNE      |L0.30|
        B        |L0.40|
|L0.16|
        BL       __rt_ctype_table
        LDRB     r1,[r5,r4]
        LDR      r0,[r0,#0]
        LDRB     r0,[r0,r1]
        LSLS     r0,r0,#31
        BEQ      |L0.34|
|L0.30|
        SUBS     r4,r4,#1
        BPL      |L0.16|
|L0.34|
        MOVS     r0,#0
        ADDS     r4,r4,#1
        STRB     r0,[r5,r4]
|L0.40|
        MOVS     r0,r5
        POP      {r4-r6,pc}
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-48
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,44($sp)
        sw      $19,40($sp)
        sw      $18,36($sp)
        sw      $17,32($sp)
        sw      $16,28($sp)
        beq     $4,$0,$L2
        move    $16,$4
        lw      $25,%call16(strlen)($28)
        nop
        jalr    $25
        nop
        lw      $28,16($sp)
        beq     $2,$0,$L2
        move    $19,$2
        b       $L3
        addu    $17,$16,$2
$L8:
        move    $19,$18
$L3:
        addiu   $18,$19,-1
        lw      $25,%call16(__ctype_b_loc)($28)
        bltz    $18,$L4
        nop
        jalr    $25
        nop
        lb      $3,-1($17)
        lw      $2,0($2)
        sll     $3,$3,1
        addu    $3,$2,$3
        lhu     $2,0($3)
        lw      $28,16($sp)
        andi    $2,$2,0x20
        bne     $2,$0,$L8
        addiu   $17,$17,-1
$L4:
        addu    $19,$16,$19
        sb      $0,0($19)
$L2:
        lw      $31,44($sp)
        move    $2,$16
        lw      $19,40($sp)
        lw      $18,36($sp)
        lw      $17,32($sp)
        lw      $16,28($sp)
        j       $31
        addiu   $sp,$sp,48
_PRE_END

_CHALLENGE_FOOTER()


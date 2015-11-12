m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #28.')

<p> What the following code does?  </p>

_HL2(`Optimizing GCC 4.8.2 for x64')

_PRE_BEGIN
f1:
	mov	eax, DWORD PTR [rsi]
	xor	edx, edx
	cmp	DWORD PTR [rdi], eax
	mov	eax, -1
	setg	dl
	cmovge	eax, edx
	ret
my_memdup:
	push	rbp
	mov	rbp, rdi
	mov	rdi, rsi
	push	rbx
	mov	rbx, rsi
	sub	rsp, 8
	call	malloc
	add	rsp, 8
	mov	rdx, rbx
	mov	rsi, rbp
	pop	rbx
	pop	rbp
	mov	rdi, rax
	jmp	memcpy
f2:
	add	esi, edi
	mov	eax, esi
	shr	eax, 31
	add	eax, esi
	sar	eax
	ret
f_main:
	push	r12
	mov	r12, rdi
	push	rbp
	lea	rbp, [0+rsi*4]
	push	rbx
	mov	rdi, rbp
	mov	rbx, rsi
	call	malloc
	mov	rdx, rbp
	mov	rsi, r12
	mov	rdi, rax
	call	memcpy
	mov	ecx, OFFSET FLAT:f1
	mov	edx, 4
	mov	rsi, rbx
	mov	rdi, rax
	mov	rbp, rax
	call	qsort
	test	bl, 1
	jne	.L12
	shr	rbx
	mov	eax, DWORD PTR [rbp+0+rbx*4]
	add	eax, DWORD PTR [rbp-4+rbx*4]
	pop	rbx
	pop	rbp
	pop	r12
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	ret
.L12:
	shr	rbx
	mov	eax, DWORD PTR [rbp+0+rbx*4]
	pop	rbx
	pop	rbp
	pop	r12
	ret
_PRE_END

_HL2(`Optimizing Keil 5.05 (ARM mode)')

_PRE_BEGIN
||f1|| PROC
        LDR      r0,[r0,#0]
        LDR      r1,[r1,#0]
        CMP      r0,r1
        MOVEQ    r0,#0
        MOVGT    r0,#1
        MVNLT    r0,#0
        BX       lr
        ENDP

my_memdup PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOV      r4,r1
        MOV      r0,r1
        BL       malloc
        MOV      r2,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        memcpy
        ENDP

||f2|| PROC
        ADD      r0,r0,r1
        ADD      r0,r0,r0,LSR #31
        ASR      r0,r0,#1
        BX       lr
        ENDP

f_main PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r1
        LSL      r1,r1,#2
        BL       my_memdup
        MOV      r4,r0
        ADR      r3,|L0.0|
        MOV      r2,#4
        MOV      r1,r5
        BL       qsort
        TST      r5,#1
        LSR      r0,r5,#1
        LDRNE    r0,[r4,r0,LSL #2]
        POPNE    {r4-r6,pc}
        ADD      r1,r4,r0,LSL #2
        LDR      r1,[r1,#-4]
        LDR      r0,[r4,r0,LSL #2]
        ADD      r0,r0,r1
        ADD      r0,r0,r0,LSR #31
        ASR      r0,r0,#1
        POP      {r4-r6,pc}
        ENDP
_PRE_END

_HL2(`Optimizing Keil 5.05 (Thumb mode)')

_PRE_BEGIN
||f1|| PROC
        LDR      r2,[r0,#0]
        LDR      r0,[r1,#0]
        CMP      r2,r0
        BGE      |L0.14|
        MOVS     r0,#0
        MVNS     r0,r0
        BX       lr
|L0.14|
        CMP      r2,r0
        BLE      |L0.22|
        MOVS     r0,#1
        BX       lr
|L0.22|
        MOVS     r0,#0
        BX       lr
        ENDP

my_memdup PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        MOVS     r4,r1
        MOVS     r0,r1
        BL       malloc
        MOVS     r2,r4
        MOVS     r1,r5
        BL       memcpy
        POP      {r4-r6,pc}
        ENDP

||f2|| PROC
        ADDS     r0,r0,r1
        LSRS     r1,r0,#31
        ADDS     r0,r1,r0
        ASRS     r0,r0,#1
        BX       lr
        ENDP

f_main PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r1
        LSLS     r1,r1,#2
        BL       my_memdup
        LDR      r3,|L0.188|
        MOVS     r4,r0
        MOVS     r2,#4
        MOVS     r1,r5
        BL       qsort
        LSRS     r0,r5,#1
        LSLS     r1,r5,#31
        LSLS     r0,r0,#2
        CMP      r1,#0
        BEQ      |L0.94|
        LDR      r0,[r4,r0]
        POP      {r4-r6,pc}
|L0.94|
        ADDS     r1,r0,r4
        SUBS     r1,r1,#0x80
        LDR      r1,[r1,#0x7c]
        LDR      r0,[r4,r0]
        ADDS     r0,r1,r0
        LSRS     r1,r0,#31
        ADDS     r0,r1,r0
        ASRS     r0,r0,#1
        POP      {r4-r6,pc}
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9.3 for ARM64')

_PRE_BEGIN
f1:
        ldr     w2, [x0]
        ldr     w1, [x1]
        cmp     w2, w1
        cset    w0, gt
        csinv   w0, w0, wzr, ge
        ret
my_memdup:
        stp     x29, x30, [sp, -32]!
        mov     x2, x1
        add     x29, sp, 0
        str     x0, [x29, 16]
        mov     x0, x2
        str     x2, [x29, 24]
        bl      malloc
        ldr     x2, [x29, 24]
        ldr     x1, [x29, 16]
        ldp     x29, x30, [sp], 32
        b       memcpy
f2:
        add     w0, w0, w1
        add     w0, w0, w0, lsr 31
        asr     w0, w0, 1
        ret
f_main:
        stp     x29, x30, [sp, -48]!
        add     x29, sp, 0
        stp     x19, x20, [sp, 16]
        mov     x19, x1
        lsl     x2, x19, 2
        str     x0, [x29, 32]
        mov     x0, x2
        str     x2, [x29, 40]
        bl      malloc
        ldr     x2, [x29, 40]
        ldr     x1, [x29, 32]
        bl      memcpy
        mov     x20, x0
        adrp    x3, f1
        mov     x2, 4
        add     x3, x3, :lo12:f1
        mov     x1, x19
        bl      qsort
        tbnz    x19, 0, .L10
        lsr     x19, x19, 1
        add     x1, x20, x19, lsl 2
        ldr     w0, [x20, x19, lsl 2]
        ldp     x19, x20, [sp, 16]
        ldr     w1, [x1, -4]
        ldp     x29, x30, [sp], 48
        add     w0, w1, w0
        add     w1, w0, w0, lsr 31
        asr     w0, w1, 1
        ret
.L10:
        lsr     x19, x19, 1
        ldr     w0, [x20, x19, lsl 2]
        ldp     x19, x20, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 for MIPS')

_PRE_BEGIN
f1:
        lw      $2,0($4)
        lw      $3,0($5)
        nop
        slt     $4,$2,$3
        bne     $4,$0,$L6
        nop
        j       $31
        slt     $2,$3,$2
$L6:
        j       $31
        li      $2,-1                   # 0xffffffffffffffff

f2:
        addu    $4,$5,$4
        srl     $2,$4,31
        addu    $4,$2,$4
        j       $31
        sra     $2,$4,1

my_memdup:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-40
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,36($sp)
        move    $6,$5
        lw      $25,%call16(malloc)($28)
        move    $5,$4
        sw      $5,24($sp)
        move    $4,$6
        jalr    $25
        sw      $6,28($sp)

        lw      $28,16($sp)
        lw      $5,24($sp)
        lw      $6,28($sp)
        lw      $25,%call16(memcpy)($28)
        lw      $31,36($sp)
        move    $4,$2
        jr      $25
        addiu   $sp,$sp,40

f_main:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-40
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,36($sp)
        sw      $16,32($sp)
        sll     $6,$5,2
        lw      $25,%call16(malloc)($28)
        move    $16,$5
        move    $5,$4
        sw      $5,28($sp)
        move    $4,$6
        jalr    $25
        sw      $6,24($sp)
        lw      $28,16($sp)
        lw      $5,28($sp)
        lw      $25,%call16(memcpy)($28)
        lw      $6,24($sp)
        jalr    $25
        move    $4,$2

        lw      $28,16($sp)
        lui     $7,%hi(f1)
        lw      $25,%call16(qsort)($28)
        move    $4,$2
        sw      $2,24($sp)
        addiu   $7,$7,%lo(f1)
        move    $5,$16
        jalr    $25
        li      $6,4                    # 0x4

        andi    $3,$16,0x1
        lw      $2,24($sp)
        bne     $3,$0,$L15
        nop
        srl     $16,$16,1
        addiu   $4,$16,-1
        sll     $4,$4,2
        sll     $16,$16,2
        addu    $4,$2,$4
        addu    $2,$2,$16
        lw      $3,0($2)
        lw      $2,0($4)
        lw      $31,36($sp)
        addu    $2,$3,$2
        srl     $3,$2,31
        addu    $2,$3,$2
        sra     $2,$2,1
        lw      $16,32($sp)
        j       $31
        addiu   $sp,$sp,40
$L15:
        srl     $16,$16,1
        sll     $16,$16,2
        lw      $31,36($sp)
        addu    $2,$2,$16
        lw      $2,0($2)
        lw      $16,32($sp)
        j       $31
        addiu   $sp,$sp,40
_PRE_END

_CHALLENGE_FOOTER()


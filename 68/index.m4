m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #68.')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_a$ = 8							; size = 4
_f	PROC
	push	esi
	mov	esi, DWORD PTR _a$[esp]
	xor	ecx, ecx
	push	edi
	lea	edx, DWORD PTR [ecx+1]
	xor	eax, eax
	npad	3 ; align next label
$LL3@f:
	mov	edi, esi
	shr	edi, cl
	add	ecx, 4
	and	edi, 15
	imul	edi, edx
	lea	edx, DWORD PTR [edx+edx*4]
	add	eax, edi
	add	edx, edx
	cmp	ecx, 28
	jle	SHORT $LL3@f
	pop	edi
	pop	esi
	ret	0
_f	ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        MOV      r3,r0
        MOV      r1,#0
        MOV      r2,#1
        MOV      r0,r1
|L0.16|
        LSR      r12,r3,r1
        AND      r12,r12,#0xf
        MLA      r0,r12,r2,r0
        ADD      r1,r1,#4
        ADD      r2,r2,r2,LSL #2
        CMP      r1,#0x1c
        LSL      r2,r2,#1
        BLE      |L0.16|
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        MOVS     r3,r0
        MOVS     r1,#0
        MOVS     r2,#1
        MOVS     r0,r1
|L0.10|
        MOVS     r4,r3
        LSRS     r4,r4,r1
        LSLS     r4,r4,#28
        LSRS     r4,r4,#28
        MULS     r4,r2,r4
        ADDS     r0,r4,r0
        MOVS     r4,#0xa
        MULS     r2,r4,r2
        ADDS     r1,r1,#4
        CMP      r1,#0x1c
        BLE      |L0.10|
        POP      {r4,pc}
        ENDP
_PRE_END

_HL2(`Non-Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	sub	sp, sp, #32
	str	w0, [sp,12]
	str	wzr, [sp,28]
	mov	w0, 1
	str	w0, [sp,24]
	str	wzr, [sp,20]
	b	.L2
.L3:
	ldr	w0, [sp,28]
	ldr	w1, [sp,12]
	lsr	w0, w1, w0
	and	w1, w0, 15
	ldr	w0, [sp,24]
	mul	w0, w1, w0
	ldr	w1, [sp,20]
	add	w0, w1, w0
	str	w0, [sp,20]
	ldr	w0, [sp,28]
	add	w0, w0, 4
	str	w0, [sp,28]
	ldr	w1, [sp,24]
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	str	w0, [sp,24]
.L2:
	ldr	w0, [sp,28]
	cmp	w0, 28
	ble	.L3
	ldr	w0, [sp,20]
	add	sp, sp, 32
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                srl     $v0, $a0, 8
                srl     $a3, $a0, 20
                andi    $a3, 0xF
                andi    $v0, 0xF
                srl     $a1, $a0, 12
                srl     $a2, $a0, 16
                andi    $a1, 0xF
                andi    $a2, 0xF
                sll     $t2, $v0, 4
                sll     $v1, $a3, 2
                sll     $t0, $v0, 2
                srl     $t1, $a0, 4
                sll     $t5, $a3, 7
                addu    $t0, $t2
                subu    $t5, $v1
                andi    $t1, 0xF
                srl     $v1, $a0, 28
                sll     $t4, $a1, 7
                sll     $t2, $a2, 2
                sll     $t3, $a1, 2
                sll     $t7, $a2, 7
                srl     $v0, $a0, 24
                addu    $a3, $t5, $a3
                subu    $t3, $t4, $t3
                subu    $t7, $t2
                andi    $v0, 0xF
                sll     $t5, $t1, 3
                sll     $t6, $v1, 8
                sll     $t2, $t0, 2
                sll     $t4, $t1, 1
                sll     $t1, $v1, 3
                addu    $a2, $t7, $a2
                subu    $t1, $t6, $t1
                addu    $t2, $t0, $t2
                addu    $t4, $t5
                addu    $a1, $t3, $a1
                sll     $t5, $a3, 2
                sll     $t3, $v0, 8
                sll     $t0, $v0, 3
                addu    $a3, $t5
                subu    $t0, $t3, $t0
                addu    $t4, $t2, $t4
                sll     $t3, $a2, 2
                sll     $t2, $t1, 6
                sll     $a1, 3
                addu    $a1, $t4, $a1
                subu    $t1, $t2, $t1
                addu    $a2, $t3
                sll     $t2, $t0, 6
                sll     $t3, $a3, 2
                andi    $a0, 0xF
                addu    $v1, $t1, $v1
                addu    $a0, $a1
                addu    $a3, $t3
                subu    $t0, $t2, $t0
                sll     $a2, 4
                addu    $a2, $a0, $a2
                addu    $v0, $t0, $v0
                sll     $a1, $v1, 2
                sll     $a3, 5
                addu    $a3, $a2, $a3
                addu    $v1, $a1
                sll     $v0, 6
                addu    $v0, $a3, $v0
                sll     $v1, 7
                jr      $ra
                addu    $v0, $v1, $v0
_PRE_END

_CHALLENGE_FOOTER()


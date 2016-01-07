m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #62.')

<p>What does this code do?</p>

_HL2(`MSVC 2010 + /O1')

<p>(/O1: minimize space).</p>

_PRE_BEGIN
_a$ = 8        ; size = 4
_b$ = 12       ; size = 4
_c$ = 16       ; size = 4
?s@@YAXPAN00@Z PROC     ; s, COMDAT
    mov    eax, DWORD PTR _b$[esp-4]
    mov    ecx, DWORD PTR _a$[esp-4]
    mov    edx, DWORD PTR _c$[esp-4]
    push   esi
    push   edi
    sub    ecx, eax
    sub    edx, eax
    mov    edi, 200     ; 000000c8H
$LL6@s:
    push   100          ; 00000064H
    pop    esi
$LL3@s:
    fld    QWORD PTR [ecx+eax]
    fadd   QWORD PTR [eax]
    fstp   QWORD PTR [edx+eax]
    add    eax, 8
    dec    esi
    jne    SHORT $LL3@s
    dec    edi
    jne    SHORT $LL6@s
    pop    edi
    pop    esi
    ret    0
?s@@YAXPAN00@Z ENDP     ; s
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
        PUSH     {r4-r12,lr}
        MOV      r9,r2
        MOV      r10,r1
        MOV      r11,r0
        MOV      r5,#0
|L0.20|
        ADD      r0,r5,r5,LSL #3
        ADD      r0,r0,r5,LSL #4
        MOV      r4,#0
        ADD      r8,r10,r0,LSL #5
        ADD      r7,r11,r0,LSL #5
        ADD      r6,r9,r0,LSL #5
|L0.44|
        ADD      r0,r8,r4,LSL #3
        LDM      r0,{r2,r3}
        ADD      r1,r7,r4,LSL #3
        LDM      r1,{r0,r1}
        BL       __aeabi_dadd
        ADD      r2,r6,r4,LSL #3
        ADD      r4,r4,#1
        STM      r2,{r0,r1}
        CMP      r4,#0x64
        BLT      |L0.44|
        ADD      r5,r5,#1
        CMP      r5,#0xc8
        BLT      |L0.20|
        POP      {r4-r12,pc}
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
        PUSH     {r0-r2,r4-r7,lr}
        MOVS     r4,#0
        SUB      sp,sp,#8
|L0.6|
        MOVS     r1,#0x19
        MOVS     r0,r4
        LSLS     r1,r1,#5
        MULS     r0,r1,r0
        LDR      r2,[sp,#8]
        LDR      r1,[sp,#0xc]
        ADDS     r2,r0,r2
        STR      r2,[sp,#0]
        LDR      r2,[sp,#0x10]
        MOVS     r5,#0
        ADDS     r7,r0,r2
        ADDS     r0,r0,r1
        STR      r0,[sp,#4]
|L0.32|
        LSLS     r6,r5,#3
        ADDS     r0,r0,r6
        LDM      r0!,{r2,r3}
        LDR      r0,[sp,#0]
        ADDS     r1,r0,r6
        LDM      r1,{r0,r1}
        BL       __aeabi_dadd
        ADDS     r2,r7,r6
        ADDS     r5,r5,#1
        STM      r2!,{r0,r1}
        CMP      r5,#0x64
        BGE      |L0.62|
        LDR      r0,[sp,#4]
        B        |L0.32|
|L0.62|
        ADDS     r4,r4,#1
        CMP      r4,#0xc8
        BLT      |L0.6|
        ADD      sp,sp,#0x14
        POP      {r4-r7,pc}
_PRE_END

_HL2(`Non-Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
s:
	sub	sp, sp, #48
	str	x0, [sp,24]
	str	x1, [sp,16]
	str	x2, [sp,8]
	str	wzr, [sp,44]
	b	.L2
.L5:
	str	wzr, [sp,40]
	b	.L3
.L4:
	ldr	w1, [sp,44]
	mov	w0, 100
	mul	w0, w1, w0
	sxtw	x1, w0
	ldrsw	x0, [sp,40]
	add	x0, x1, x0
	lsl	x0, x0, 3
	ldr	x1, [sp,8]
	add	x0, x1, x0
	ldr	w2, [sp,44]
	mov	w1, 100
	mul	w1, w2, w1
	sxtw	x2, w1
	ldrsw	x1, [sp,40]
	add	x1, x2, x1
	lsl	x1, x1, 3
	ldr	x2, [sp,24]
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	w3, [sp,44]
	mov	w1, 100
	mul	w1, w3, w1
	sxtw	x3, w1
	ldrsw	x1, [sp,40]
	add	x1, x3, x1
	lsl	x1, x1, 3
	ldr	x3, [sp,16]
	add	x1, x3, x1
	ldr	x1, [x1]
	fmov	d0, x2
	fmov	d1, x1
	fadd	d0, d0, d1
	fmov	x1, d0
	str	x1, [x0]
	ldr	w0, [sp,40]
	add	w0, w0, 1
	str	w0, [sp,40]
.L3:
	ldr	w0, [sp,40]
	cmp	w0, 99
	ble	.L4
	ldr	w0, [sp,44]
	add	w0, w0, 1
	str	w0, [sp,44]
.L2:
	ldr	w0, [sp,44]
	cmp	w0, 199
	ble	.L5
	add	sp, sp, 48
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
sub_0:
                li      $t3, 0x27100
                move    $t2, $zero
                li      $t1, 0x64  # 'd'

loc_10:                                  # CODE XREF: sub_0+54
                addu    $t0, $a1, $t2
                addu    $a3, $a2, $t2
                move    $v1, $a0
                move    $v0, $zero

loc_20:                                  # CODE XREF: sub_0+48
                lwc1    $f2, 4($v1)
                lwc1    $f0, 4($t0)
                lwc1    $f3, 0($v1)
                lwc1    $f1, 0($t0)
                addiu   $v0, 1
                add.d   $f0, $f2, $f0
                addiu   $v1, 8
                swc1    $f0, 4($a3)
                swc1    $f1, 0($a3)
                addiu   $t0, 8
                bne     $v0, $t1, loc_20
                addiu   $a3, 8
                addiu   $t2, 0x320
                bne     $t2, $t3, loc_10
                addiu   $a0, 0x320
                jr      $ra
                or      $at, $zero
_PRE_END

_CHALLENGE_FOOTER()


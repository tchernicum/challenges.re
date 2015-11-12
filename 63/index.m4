m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #63.')

<p>What this code does?</p>

_HL2(`MSVC 2010 + /O1')

<p>(/O1: minimize space).</p>

_PRE_BEGIN
tv315 = -8             ; size = 4
tv291 = -4             ; size = 4
_a$ = 8                ; size = 4
_b$ = 12               ; size = 4
_c$ = 16               ; size = 4
?m@@YAXPAN00@Z PROC    ; m, COMDAT
    push   ebp
    mov    ebp, esp
    push   ecx
    push   ecx
    mov    edx, DWORD PTR _a$[ebp]
    push   ebx
    mov    ebx, DWORD PTR _c$[ebp]
    push   esi
    mov    esi, DWORD PTR _b$[ebp]
    sub    edx, esi
    push   edi
    sub    esi, ebx
    mov    DWORD PTR tv315[ebp], 100  ; 00000064H
$LL9@m:
    mov    eax, ebx
    mov    DWORD PTR tv291[ebp], 300  ; 0000012cH
$LL6@m:
    fldz
    lea    ecx, DWORD PTR [esi+eax]
    fstp   QWORD PTR [eax]
    mov    edi, 200                  ; 000000c8H
$LL3@m:
    dec    edi
    fld    QWORD PTR [ecx+edx]
    fmul   QWORD PTR [ecx]
    fadd   QWORD PTR [eax]
    fstp   QWORD PTR [eax]
    jne    HORT $LL3@m
    add    eax, 8
    dec    DWORD PTR tv291[ebp]
    jne    SHORT $LL6@m
    add    ebx, 800                 ; 00000320H
    dec    DWORD PTR tv315[ebp]
    jne    SHORT $LL9@m
    pop    edi
    pop    esi
    pop    ebx
    leave
    ret    0
?m@@YAXPAN00@Z ENDP                 ; m
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
        PUSH     {r0-r2,r4-r11,lr}
        SUB      sp,sp,#8
        MOV      r5,#0
|L0.12|
        LDR      r1,[sp,#0xc]
        ADD      r0,r5,r5,LSL #3
        ADD      r0,r0,r5,LSL #4
        ADD      r1,r1,r0,LSL #5
        STR      r1,[sp,#0]
        LDR      r1,[sp,#8]
        MOV      r4,#0
        ADD      r11,r1,r0,LSL #5
        LDR      r1,[sp,#0x10]
        ADD      r10,r1,r0,LSL #5
|L0.52|
        MOV      r0,#0
        MOV      r1,r0
        ADD      r7,r10,r4,LSL #3
        STM      r7,{r0,r1}
        MOV      r6,r0
        LDR      r0,[sp,#0]
        ADD      r8,r11,r4,LSL #3
        ADD      r9,r0,r4,LSL #3
|L0.84|
        LDM      r9,{r2,r3}
        LDM      r8,{r0,r1}
        BL       __aeabi_dmul
        LDM      r7,{r2,r3}
        BL       __aeabi_dadd
        ADD      r6,r6,#1
        STM      r7,{r0,r1}
        CMP      r6,#0xc8
        BLT      |L0.84|
        ADD      r4,r4,#1
        CMP      r4,#0x12c
        BLT      |L0.52|
        ADD      r5,r5,#1
        CMP      r5,#0x64
        BLT      |L0.12|
        ADD      sp,sp,#0x14
        POP      {r4-r11,pc}
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
        PUSH     {r0-r2,r4-r7,lr}
        MOVS     r0,#0
        SUB      sp,sp,#0x10
        STR      r0,[sp,#0]
|L0.8|
        MOVS     r1,#0x19
        LSLS     r1,r1,#5
        MULS     r0,r1,r0
        LDR      r2,[sp,#0x10]
        LDR      r1,[sp,#0x14]
        ADDS     r2,r0,r2
        STR      r2,[sp,#4]
        LDR      r2,[sp,#0x18]
        MOVS     r5,#0
        ADDS     r7,r0,r2
        ADDS     r0,r0,r1
        STR      r0,[sp,#8]
|L0.32|
        LSLS     r4,r5,#3
        MOVS     r0,#0
        ADDS     r2,r7,r4
        STR      r0,[r2,#0]
        MOVS     r6,r0
        STR      r0,[r2,#4]
|L0.44|
        LDR      r0,[sp,#8]
        ADDS     r0,r0,r4
        LDM      r0!,{r2,r3}
        LDR      r0,[sp,#4]
        ADDS     r1,r0,r4
        LDM      r1,{r0,r1}
        BL       __aeabi_dmul
        ADDS     r3,r7,r4
        LDM      r3,{r2,r3}
        BL       __aeabi_dadd
        ADDS     r2,r7,r4
        ADDS     r6,r6,#1
        STM      r2!,{r0,r1}
        CMP      r6,#0xc8
        BLT      |L0.44|
        MOVS     r0,#0xff
        ADDS     r5,r5,#1
        ADDS     r0,r0,#0x2d
        CMP      r5,r0
        BLT      |L0.32|
        LDR      r0,[sp,#0]
        ADDS     r0,r0,#1
        CMP      r0,#0x64
        STR      r0,[sp,#0]
        BLT      |L0.8|
        ADD      sp,sp,#0x1c
        POP      {r4-r7,pc}
_PRE_END

_HL2(`Non-Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
m:
	sub	sp, sp, #48
	str	x0, [sp,24]
	str	x1, [sp,16]
	str	x2, [sp,8]
	str	wzr, [sp,44]
	b	.L2
.L7:
	str	wzr, [sp,40]
	b	.L3
.L6:
	ldr	w1, [sp,44]
	mov	w0, 100
	mul	w0, w1, w0
	sxtw	x1, w0
	ldrsw	x0, [sp,40]
	add	x0, x1, x0
	lsl	x0, x0, 3
	ldr	x1, [sp,8]
	add	x0, x1, x0
	ldr	x1, .LC0
	str	x1, [x0]
	str	wzr, [sp,36]
	b	.L4
.L5:
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
	ldr	x2, [sp,8]
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	w3, [sp,44]
	mov	w1, 100
	mul	w1, w3, w1
	sxtw	x3, w1
	ldrsw	x1, [sp,40]
	add	x1, x3, x1
	lsl	x1, x1, 3
	ldr	x3, [sp,24]
	add	x1, x3, x1
	ldr	x3, [x1]
	ldr	w4, [sp,44]
	mov	w1, 100
	mul	w1, w4, w1
	sxtw	x4, w1
	ldrsw	x1, [sp,40]
	add	x1, x4, x1
	lsl	x1, x1, 3
	ldr	x4, [sp,16]
	add	x1, x4, x1
	ldr	x1, [x1]
	fmov	d0, x3
	fmov	d1, x1
	fmul	d0, d0, d1
	fmov	x1, d0
	fmov	d0, x2
	fmov	d1, x1
	fadd	d0, d0, d1
	fmov	x1, d0
	str	x1, [x0]
	ldr	w0, [sp,36]
	add	w0, w0, 1
	str	w0, [sp,36]
.L4:
	ldr	w0, [sp,36]
	cmp	w0, 199
	ble	.L5
	ldr	w0, [sp,40]
	add	w0, w0, 1
	str	w0, [sp,40]
.L3:
	ldr	w0, [sp,40]
	cmp	w0, 299
	ble	.L6
	ldr	w0, [sp,44]
	add	w0, w0, 1
	str	w0, [sp,44]
.L2:
	ldr	w0, [sp,44]
	cmp	w0, 99
	ble	.L7
	add	sp, sp, 48
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
m:
                li      $t5, 0x13880
                move    $t4, $zero
                li      $t1, 0xC8
                li      $t3, 0x12C

loc_14:                                  # CODE XREF: m+7C
                addu    $t0, $a0, $t4
                addu    $a3, $a1, $t4
                move    $v1, $a2
                move    $t2, $zero

loc_24:                                  # CODE XREF: m+70
                mtc1    $zero, $f0
                move    $v0, $zero
                mtc1    $zero, $f1
                or      $at, $zero
                swc1    $f0, 4($v1)
                swc1    $f1, 0($v1)

loc_3C:                                  # CODE XREF: m+5C
                lwc1    $f4, 4($t0)
                lwc1    $f2, 4($a3)
                lwc1    $f5, 0($t0)
                lwc1    $f3, 0($a3)
                addiu   $v0, 1
                mul.d   $f2, $f4, $f2
                add.d   $f0, $f2
                swc1    $f0, 4($v1)
                bne     $v0, $t1, loc_3C
                swc1    $f1, 0($v1)
                addiu   $t2, 1
                addiu   $v1, 8
                addiu   $t0, 8
                bne     $t2, $t3, loc_24
                addiu   $a3, 8
                addiu   $t4, 0x320
                bne     $t4, $t5, loc_14
                addiu   $a2, 0x320
                jr      $ra
                or      $at, $zero
_PRE_END

_CHALLENGE_FOOTER()


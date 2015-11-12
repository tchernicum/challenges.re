m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #37.')

<!--
\RU{Известная функция. Что она вычисляет? Почему стек переполняется если на вход подать
числа 4 и 2? Есть ли здесь какая-то ошибка?}
-->

<p>Well-known function.
What does it compute? 
Why does the stack overflow if 4 and 2 are supplied at input?
Is there any error?</p>

_HL2(`Optimizing MSVC 2012 x64')

_PRE_BEGIN
m$ = 48
n$ = 56
f	PROC
$LN14:
	push	rbx
	sub	rsp, 32
	mov	eax, edx
	mov	ebx, ecx
	test	ecx, ecx
	je	SHORT $LN11@f
$LL5@f:
	test	eax, eax
	jne	SHORT $LN1@f
	mov	eax, 1
	jmp	SHORT $LN12@f
$LN1@f:
	lea	edx, DWORD PTR [rax-1]
	mov	ecx, ebx
	call	f
$LN12@f:
	dec	ebx
	test	ebx, ebx
	jne	SHORT $LL5@f
$LN11@f:
	inc	eax
	add	rsp, 32
	pop	rbx
	ret	0
f	ENDP
_PRE_END

_HL2(`Optimizing Keil (ARM Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
        ADDEQ    r0,r1,#1
        POPEQ    {r4,pc}
        CMP      r1,#0
        MOVEQ    r1,#1
        SUBEQ    r0,r0,#1
        BEQ      |L0.48|
        SUB      r1,r1,#1
        BL       f
        MOV      r1,r0
        SUB      r0,r4,#1
|L0.48|
        POP      {r4,lr}
        B        f
        ENDP
_PRE_END

_HL2(`Optimizing Keil (Thumb Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
        BEQ      |L0.26|
        CMP      r1,#0
        BEQ      |L0.30|
        SUBS     r1,r1,#1
        BL       f
        MOVS     r1,r0
|L0.18|
        SUBS     r0,r4,#1
        BL       f
        POP      {r4,pc}
|L0.26|
        ADDS     r0,r1,#1
        POP      {r4,pc}
|L0.30|
        MOVS     r1,#1
        B        |L0.18|
        ENDP
_PRE_END

_HL2(`Non-Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
f:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp,16]
	str	w0, [x29,44]
	str	w1, [x29,40]
	ldr	w0, [x29,44]
	cmp	w0, wzr
	bne	.L2
	ldr	w0, [x29,40]
	add	w0, w0, 1
	b	.L3
.L2:
	ldr	w0, [x29,40]
	cmp	w0, wzr
	bne	.L4
	ldr	w0, [x29,44]
	sub	w0, w0, #1
	mov	w1, 1
	bl	ack
	b	.L3
.L4:
	ldr	w0, [x29,44]
	sub	w19, w0, #1
	ldr	w0, [x29,40]
	sub	w1, w0, #1
	ldr	w0, [x29,44]
	bl	ack
	mov	w1, w0
	mov	w0, w19
	bl	ack
.L3:
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 48
	ret
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

<!-- \RU{Оптимизирующий GCC генерирует куда больше кода. Почему?} -->

<p>Optimizing GCC generates a lot more code. Why?</p>

_PRE_BEGIN
ack:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	d8, d9, [sp,96]
	stp	x19, x20, [sp,16]
	stp	d10, d11, [sp,112]
	stp	x21, x22, [sp,32]
	stp	d12, d13, [sp,128]
	stp	x23, x24, [sp,48]
	stp	d14, d15, [sp,144]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	cbz	w0, .L2
	sub	w0, w0, #1
	fmov	s10, w0
	b	.L4
.L46:
	fmov	w0, s10
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s10, w0
	fmov	w0, s13
	cbz	w0, .L2
.L4:
	fmov	s13, s10
	cbz	w1, .L46
	sub	w1, w1, #1
	fmov	s11, s10
	b	.L7
.L48:
	fmov	w0, s11
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s11, w0
	fmov	w0, s14
	cbz	w0, .L47
.L7:
	fmov	s14, s11
	cbz	w1, .L48
	sub	w1, w1, #1
	fmov	s12, s11
	b	.L10
.L50:
	fmov	w0, s12
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s12, w0
	fmov	w0, s15
	cbz	w0, .L49
.L10:
	fmov	s15, s12
	cbz	w1, .L50
	sub	w1, w1, #1
	fmov	s8, s12
	b	.L13
.L52:
	fmov	w0, s8
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s8, w0
	fmov	w0, s9
	cbz	w0, .L51
.L13:
	fmov	s9, s8
	cbz	w1, .L52
	sub	w1, w1, #1
	fmov	w22, s8
	b	.L16
.L54:
	mov	w1, 1
	sub	w22, w22, #1
	cbz	w28, .L53
.L16:
	mov	w28, w22
	cbz	w1, .L54
	sub	w1, w1, #1
	mov	w21, w22
	b	.L19
.L56:
	mov	w1, 1
	sub	w21, w21, #1
	cbz	w24, .L55
.L19:
	mov	w24, w21
	cbz	w1, .L56
	sub	w1, w1, #1
	mov	w20, w21
	b	.L22
.L58:
	mov	w1, 1
	sub	w20, w20, #1
	cbz	w25, .L57
.L22:
	mov	w25, w20
	cbz	w1, .L58
	sub	w1, w1, #1
	mov	w26, w20
	b	.L25
.L60:
	mov	w1, 1
	sub	w26, w26, #1
	cbz	w27, .L59
.L25:
	mov	w27, w26
	cbz	w1, .L60
	sub	w1, w1, #1
	mov	w19, w26
	b	.L28
.L62:
	mov	w23, w19
	mov	w1, 1
	sub	w19, w19, #1
	cbz	w23, .L61
.L28:
	add	w0, w19, 1
	cbz	w1, .L62
	sub	w1, w1, #1
	mov	w23, w19
	sub	w19, w19, #1
	bl	ack
	mov	w1, w0
	cbnz	w23, .L28
.L61:
	add	w1, w1, 1
	sub	w26, w26, #1
	cbnz	w27, .L25
.L59:
	add	w1, w1, 1
	sub	w20, w20, #1
	cbnz	w25, .L22
.L57:
	add	w1, w1, 1
	sub	w21, w21, #1
	cbnz	w24, .L19
.L55:
	add	w1, w1, 1
	sub	w22, w22, #1
	cbnz	w28, .L16
.L53:
	fmov	w0, s8
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s8, w0
	fmov	w0, s9
	cbnz	w0, .L13
.L51:
	fmov	w0, s12
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s12, w0
	fmov	w0, s15
	cbnz	w0, .L10
.L49:
	fmov	w0, s11
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s11, w0
	fmov	w0, s14
	cbnz	w0, .L7
.L47:
	fmov	w0, s10
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s10, w0
	fmov	w0, s13
	cbnz	w0, .L4
.L2:
	add	w0, w1, 1
	ldp	d8, d9, [sp,96]
	ldp	x19, x20, [sp,16]
	ldp	d10, d11, [sp,112]
	ldp	x21, x22, [sp,32]
	ldp	d12, d13, [sp,128]
	ldp	x23, x24, [sp,48]
	ldp	d14, d15, [sp,144]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	x29, x30, [sp], 160
	ret
_PRE_END

_HL2(`Non-Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:                                     # CODE XREF: f+64
                                         # f+94 ...

var_C           = -0xC
var_8           = -8
var_4           = -4
arg_0           =  0
arg_4           =  4

                addiu   $sp, -0x28
                sw      $ra, 0x28+var_4($sp)
                sw      $fp, 0x28+var_8($sp)
                sw      $s0, 0x28+var_C($sp)
                move    $fp, $sp
                sw      $a0, 0x28+arg_0($fp)
                sw      $a1, 0x28+arg_4($fp)
                lw      $v0, 0x28+arg_0($fp)
                or      $at, $zero
                bnez    $v0, loc_40
                or      $at, $zero
                lw      $v0, 0x28+arg_4($fp)
                or      $at, $zero
                addiu   $v0, 1
                b       loc_AC
                or      $at, $zero

loc_40:                                  # CODE XREF: f+24
                lw      $v0, 0x28+arg_4($fp)
                or      $at, $zero
                bnez    $v0, loc_74
                or      $at, $zero
                lw      $v0, 0x28+arg_0($fp)
                or      $at, $zero
                addiu   $v0, -1
                move    $a0, $v0
                li      $a1, 1
                jal     f
                or      $at, $zero
                b       loc_AC
                or      $at, $zero

loc_74:                                  # CODE XREF: f+48
                lw      $v0, 0x28+arg_0($fp)
                or      $at, $zero
                addiu   $s0, $v0, -1
                lw      $v0, 0x28+arg_4($fp)
                or      $at, $zero
                addiu   $v0, -1
                lw      $a0, 0x28+arg_0($fp)
                move    $a1, $v0
                jal     f
                or      $at, $zero
                move    $a0, $s0
                move    $a1, $v0
                jal     f
                or      $at, $zero

loc_AC:                                  # CODE XREF: f+38
                                         # f+6C
                move    $sp, $fp
                lw      $ra, 0x28+var_4($sp)
                lw      $fp, 0x28+var_8($sp)
                lw      $s0, 0x28+var_C($sp)
                addiu   $sp, 0x28
                jr      $ra
                or      $at, $zero
_PRE_END

_CHALLENGE_FOOTER()


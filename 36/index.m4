m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #36.')
_TAGS(`36')

<!-- \RU{И снова известный алгоритм. Что он делает?} -->
<!-- \RU{Обратите внимание, что код для x86 использует FPU, а для x64 --- SIMD-инструкции. Это нормально} -->

<p>A well-known algorithm again.
What does it do?
Also, take notice that the code for x86 uses FPU, but SIMD instructions are used instead in the x64 code.
That's OK.</p>

_HL2(`Optimizing MSVC 2012 x64')

_PRE_BEGIN
__real@412e848000000000 DQ 0412e848000000000r	; 1e+006
__real@4010000000000000 DQ 04010000000000000r	; 4
__real@4008000000000000 DQ 04008000000000000r	; 3
__real@3f800000 DD 03f800000r			; 1

tmp$1 = 8
tmp$2 = 8
f	PROC
	movsdx	xmm3, QWORD PTR __real@4008000000000000
	movss	xmm4, DWORD PTR __real@3f800000
	mov	edx, DWORD PTR ?RNG_state@?1??get_rand@@9@9
	xor	ecx, ecx
	mov	r8d, 200000				; 00030d40H
	npad	2 ; align next label
$LL4@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN3@f
	inc	ecx
$LN3@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN15@f
	inc	ecx
$LN15@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN16@f
	inc	ecx
$LN16@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN17@f
	inc	ecx
$LN17@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN18@f
	inc	ecx
$LN18@f:
	dec	r8
	jne	$LL4@f
	movd	xmm0, ecx
	mov	DWORD PTR ?RNG_state@?1??get_rand@@9@9, edx
	cvtdq2ps xmm0, xmm0
	cvtps2pd xmm1, xmm0
	mulsd	xmm1, QWORD PTR __real@4010000000000000
	divsd	xmm1, QWORD PTR __real@412e848000000000
	cvtpd2ps xmm0, xmm1
	ret	0
f	ENDP
_PRE_END

_HL2(`Optimizing GCC 4.4.6 x64')

_PRE_BEGIN
f1:
	mov	eax, DWORD PTR v1.2084[rip]
	imul	eax, eax, 1664525
	add	eax, 1013904223
	mov	DWORD PTR v1.2084[rip], eax
	and	eax, 8388607
	or	eax, 1073741824
	mov	DWORD PTR [rsp-4], eax
	movss	xmm0, DWORD PTR [rsp-4]
	subss	xmm0, DWORD PTR .LC0[rip]
	ret
f:
	push	rbp
	xor	ebp, ebp
	push	rbx
	xor	ebx, ebx
	sub	rsp, 16
.L6:
	xor	eax, eax
	call	f1
	xor	eax, eax
	movss	DWORD PTR [rsp], xmm0
	call	f1
	movss	xmm1, DWORD PTR [rsp]
	mulss	xmm0, xmm0
	mulss	xmm1, xmm1
	lea	eax, [rbx+1]
	addss	xmm1, xmm0
	movss	xmm0, DWORD PTR .LC1[rip]
	ucomiss	xmm0, xmm1
	cmova	ebx, eax
	add	ebp, 1
	cmp	ebp, 1000000
	jne	.L6
	cvtsi2ss	xmm0, ebx
	unpcklps	xmm0, xmm0
	cvtps2pd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR .LC2[rip]
	divsd	xmm0, QWORD PTR .LC3[rip]
	add	rsp, 16
	pop	rbx
	pop	rbp
	unpcklpd	xmm0, xmm0
	cvtpd2ps	xmm0, xmm0
	ret
v1.2084:
	.long	305419896
.LC0:
	.long	1077936128
.LC1:
	.long	1065353216
.LC2:
	.long	0
	.long	1074790400
.LC3:
	.long	0
	.long	1093567616
_PRE_END

_HL2(`Optimizing GCC 4.8.1 x86')

_PRE_BEGIN
f1:
	sub	esp, 4
	imul	eax, DWORD PTR v1.2023, 1664525
	add	eax, 1013904223
	mov	DWORD PTR v1.2023, eax
	and	eax, 8388607
	or	eax, 1073741824
	mov	DWORD PTR [esp], eax
	fld	DWORD PTR [esp]
	fsub	DWORD PTR .LC0
	add	esp, 4
	ret
f:
	push	esi
	mov	esi, 1000000
	push	ebx
	xor	ebx, ebx
	sub	esp, 16
.L7:
	call	f1
	fstp	DWORD PTR [esp]
	call	f1
	lea	eax, [ebx+1]
	fld	DWORD PTR [esp]
	fmul	st, st(0)
	fxch	st(1)
	fmul	st, st(0)
	faddp	st(1), st
	fld1
	fucomip	st, st(1)
	fstp	st(0)
	cmova	ebx, eax
	sub	esi, 1
	jne	.L7
	mov	DWORD PTR [esp+4], ebx
	fild	DWORD PTR [esp+4]
	fmul	DWORD PTR .LC3
	fdiv	DWORD PTR .LC4
	fstp	DWORD PTR [esp+8]
	fld	DWORD PTR [esp+8]
	add	esp, 16
	pop	ebx
	pop	esi
	ret

v1.2023:
	.long	305419896
.LC0:
	.long	1077936128
.LC3:
	.long	1082130432
.LC4:
	.long	1232348160
_PRE_END

_HL2(`Keil (ARM Mode): Cortex-R4F CPU as target')

_PRE_BEGIN
f1      PROC
        LDR      r1,|L0.184|
        LDR      r0,[r1,#0]  ; v1
        LDR      r2,|L0.188|
        VMOV.F32 s1,#3.00000000
        MUL      r0,r0,r2
        LDR      r2,|L0.192|
        ADD      r0,r0,r2
        STR      r0,[r1,#0]  ; v1
        BFC      r0,#23,#9
        ORR      r0,r0,#0x40000000
        VMOV     s0,r0
        VSUB.F32 s0,s0,s1
        BX       lr
        ENDP

f       PROC
        PUSH     {r4,r5,lr}
        MOV      r4,#0
        LDR      r5,|L0.196|
        MOV      r3,r4
|L0.68|
        BL       f1
        VMOV.F32 s2,s0
        BL       f1
        VMOV.F32 s1,s2
        ADD      r3,r3,#1
        VMUL.F32 s1,s1,s1
        VMLA.F32 s1,s0,s0
        VMOV     r0,s1
        CMP      r0,#0x3f800000
        ADDLT    r4,r4,#1
        CMP      r3,r5
        BLT      |L0.68|
        VMOV     s0,r4
        VMOV.F64 d1,#4.00000000
        VCVT.F32.S32 s0,s0
        VCVT.F64.F32 d0,s0
        VMUL.F64 d0,d0,d1
        VLDR     d1,|L0.200|
        VDIV.F64 d2,d0,d1
        VCVT.F32.F64 s0,d2
        POP      {r4,r5,pc}
        ENDP

|L0.184|
        DCD      ||.data||
|L0.188|
        DCD      0x0019660d
|L0.192|
        DCD      0x3c6ef35f
|L0.196|
        DCD      0x000f4240
|L0.200|
        DCFD     0x412e848000000000 ; 1000000

        DCD      0x00000000
        AREA ||.data||, DATA, ALIGN=2
v1
        DCD      0x12345678
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
f1:
	adrp	x2, .LANCHOR0
	mov	w3, 26125
	mov	w0, 62303
	movk	w3, 0x19, lsl 16
	movk	w0, 0x3c6e, lsl 16
	ldr	w1, [x2,#:lo12:.LANCHOR0]
	fmov	s0, 3.0e+0
	madd	w0, w1, w3, w0
	str	w0, [x2,#:lo12:.LANCHOR0]
	and	w0, w0, 8388607
	orr	w0, w0, 1073741824
	fmov	s1, w0
	fsub	s0, s1, s0
	ret
main_function:
	adrp	x7, .LANCHOR0
	mov	w3, 16960
	movk	w3, 0xf, lsl 16
	mov	w2, 0
	fmov	s2, 3.0e+0
	ldr	w1, [x7,#:lo12:.LANCHOR0]
	fmov	s3, 1.0e+0
.L5:
	mov	w6, 26125
	mov	w0, 62303
	movk	w6, 0x19, lsl 16
	movk	w0, 0x3c6e, lsl 16
	mov	w5, 26125
	mov	w4, 62303
	madd	w1, w1, w6, w0
	movk	w5, 0x19, lsl 16
	movk	w4, 0x3c6e, lsl 16
	and	w0, w1, 8388607
	add	w6, w2, 1
	orr	w0, w0, 1073741824
	madd	w1, w1, w5, w4
	fmov	s0, w0
	and	w0, w1, 8388607
	orr	w0, w0, 1073741824
	fmov	s1, w0
	fsub	s0, s0, s2
	fsub	s1, s1, s2
	fmul	s1, s1, s1
	fmadd	s0, s0, s0, s1
	fcmp	s0, s3
	csel	w2, w2, w6, pl
	subs	w3, w3, #1
	bne	.L5
	scvtf	s0, w2
	str	w1, [x7,#:lo12:.LANCHOR0]
	fmov	d1, 4.0e+0
	fcvt	d0, s0
	fmul	d0, d0, d1
	ldr	d1, .LC0
	fdiv	d0, d0, d1
	fcvt	s0, d0
	ret
.LC0:
	.word	0
	.word	1093567616
v1:
	.word	1013904223
v2:
	.word	1664525
.LANCHOR0 = . + 0
v3.3095:
	.word	305419896
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:
                lui     $v0, ($LC0 >> 16)
                lui     $t3, (val1 >> 16)
                lwc1    $f4, $LC0
                lui     $v0, (dword_32C >> 16)
                lwc1    $f6, $LC1
                lui     $a3, 0x3C6E
                lui     $a2, 0x7F
                lui     $t2, 0xF
                lw      $v0, val1
                li      $a3, 0x3C6EF35F
                li      $a2, 0x7FFFFF
                li      $t2, 0xF4240
                move    $a0, $zero
                move    $t1, $zero
                lui     $a1, 0x4000
                sll     $t0, $v0, 2

loc_B4:                                  # CODE XREF: f:loc_158
                sll     $v1, $v0, 4
                addu    $v1, $t0, $v1
                sll     $t0, $v1, 6
                subu    $v1, $t0, $v1
                addu    $v1, $v0
                sll     $t0, $v1, 5
                addu    $v1, $t0
                sll     $v1, 3
                addu    $v0, $v1, $v0
                sll     $v1, $v0, 2
                addu    $v0, $v1
                addu    $v1, $v0, $a3
                sll     $t0, $v1, 2
                sll     $v0, $v1, 4
                addu    $v0, $t0, $v0
                sll     $t0, $v0, 6
                subu    $v0, $t0, $v0
                addu    $v0, $v1
                sll     $t0, $v0, 5
                addu    $v0, $t0
                sll     $v0, 3
                addu    $v0, $v1
                sll     $t0, $v0, 2
                addu    $v0, $t0
                addu    $v0, $a3
                and     $v1, $a2
                and     $t0, $v0, $a2
                or      $v1, $a1
                or      $t0, $a1
                mtc1    $v1, $f0
                mtc1    $t0, $f8
                sub.s   $f2, $f0, $f4
                sub.s   $f0, $f8, $f4
                mul.s   $f2, $f2
                mul.s   $f0, $f0
                add.s   $f0, $f2, $f0
                c.lt.s  $f0, $f6
                or      $at, $zero
                bc1f    loc_158
                addiu   $a0, 1
                addiu   $t1, 1

loc_158:                                 # CODE XREF: f+D8
                bne     $a0, $t2, loc_B4
                sll     $t0, $v0, 2
                mtc1    $t1, $f0
                lui     $v1, (unk_334 >> 16)
                cvt.s.w $f2, $f0
                lwc1    $f0, dword_32C
                cvt.d.s $f2, $f2
                lwc1    $f1, $LC2
                sw      $v0, (val1 & 0xFFFF)($t3)
                mul.d   $f2, $f0
                lui     $v0, ($LC3 >> 16)
                lwc1    $f0, unk_334
                or      $at, $zero
                lwc1    $f1, $LC3
                or      $at, $zero
                div.d   $f0, $f2, $f0
                jr      $ra
                cvt.s.d $f0, $f0

$LC0:           .float 3.0
$LC1:           .float 1.0
$LC2:           .word 0x40100000
$LC3:           .word 0x412E8480
val1:		.word 0x12345678
dword_32C:      .word 0
unk_334:        .byte    0
_PRE_END

_CHALLENGE_FOOTER()


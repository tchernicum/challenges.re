m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #70.')

<p>What this code does?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_m$ = 8		; size = 4
_n$ = 12	; size = 4
_f	PROC
	mov	ecx, DWORD PTR _n$[esp-4]
	xor	eax, eax
	xor	edx, edx
	test	ecx, ecx
	je	SHORT $LN2@f
	push	esi
	mov	esi, DWORD PTR _m$[esp]
$LL3@f:
	test	cl, 1
	je	SHORT $LN1@f
	add	eax, esi
	adc	edx, 0
$LN1@f:
	add	esi, esi
	shr	ecx, 1
	jne	SHORT $LL3@f
	pop	esi
$LN2@f:
	ret	0
_f	ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        MOV      r3,r0
        MOV      r0,#0
        MOV      r2,r0
        MOV      r12,r0
        B        |L0.48|
|L0.24|
        TST      r1,#1
        BEQ      |L0.40|
        ADDS     r0,r0,r3
        ADC      r2,r2,r12
|L0.40|
        LSL      r3,r3,#1
        LSR      r1,r1,#1
|L0.48|
        CMP      r1,#0
        MOVEQ    r1,r2
        BNE      |L0.24|
        POP      {r4,pc}
        ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,r5,lr}
        MOVS     r3,r0
        MOVS     r0,#0
        MOVS     r2,r0
        MOVS     r4,r0
        B        |L0.24|
|L0.12|
        LSLS     r5,r1,#31
        BEQ      |L0.20|
        ADDS     r0,r0,r3
        ADCS     r2,r2,r4
|L0.20|
        LSLS     r3,r3,#1
        LSRS     r1,r1,#1
|L0.24|
        CMP      r1,#0
        BNE      |L0.12|
        MOVS     r1,r2
        POP      {r4,r5,pc}
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	mov	w2, w0
	mov	x0, 0
	cbz	w1, .L2
.L3:
	and	w3, w1, 1
	lsr	w1, w1, 1
	cmp	w3, wzr
	add	x3, x0, x2, uxtw
	lsl	w2, w2, 1
	csel	x0, x3, x0, ne
	cbnz	w1, .L3
.L2:
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
mult:
                beqz    $a1, loc_40
                move    $a3, $zero
                move    $a2, $zero
                addu    $t0, $a3, $a0

loc_10:                                  # CODE XREF: mult+38
                sltu    $t1, $t0, $a3
                move    $v1, $t0
                andi    $t0, $a1, 1
                addu    $t1, $a2
                beqz    $t0, loc_30
                srl     $a1, 1
                move    $a3, $v1
                move    $a2, $t1

loc_30:                                  # CODE XREF: mult+20
                beqz    $a1, loc_44
                sll     $a0, 1
                b       loc_10
                addu    $t0, $a3, $a0
loc_40:                                  # CODE XREF: mult
                move    $a2, $zero

loc_44:                                  # CODE XREF: mult:loc_30
                move    $v0, $a2
                jr      $ra
                move    $v1, $a3
_PRE_END

_CHALLENGE_FOOTER()


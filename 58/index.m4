m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #58.')
_TAGS(`58')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_s$ = 8			
_f	PROC
	mov	edx, DWORD PTR _s$[esp-4]
	mov	cl, BYTE PTR [edx]
	xor	eax, eax
	test	cl, cl
	je	SHORT $LN2@f
	npad	4 ; align next label
$LL4@f:
	cmp	cl, 32	
	jne	SHORT $LN3@f
	inc	eax
$LN3@f:
	mov	cl, BYTE PTR [edx+1]
	inc	edx
	test	cl, cl
	jne	SHORT $LL4@f
$LN2@f:
	ret	0
_f	ENDP
_PRE_END

_HL2(`caption=GCC 4.8.1 -O3')

_PRE_BEGIN
f:
.LFB24:
	push	ebx
	mov	ecx, DWORD PTR [esp+8]
	xor	eax, eax
	movzx	edx, BYTE PTR [ecx]
	test	dl, dl
	je	.L2
.L3:
	cmp	dl, 32
	lea	ebx, [eax+1]
	cmove	eax, ebx
	add	ecx, 1
	movzx	edx, BYTE PTR [ecx]
	test	dl, dl
	jne	.L3
.L2:
	pop	ebx
	ret
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        MOV      r1,#0
|L0.4|
        LDRB     r2,[r0,#0]
        CMP      r2,#0
        MOVEQ    r0,r1
        BXEQ     lr
        CMP      r2,#0x20
        ADDEQ    r1,r1,#1
        ADD      r0,r0,#1
        B        |L0.4|
        ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        MOVS     r1,#0
        B        |L0.12|
|L0.4|
        CMP      r2,#0x20
        BNE      |L0.10|
        ADDS     r1,r1,#1
|L0.10|
        ADDS     r0,r0,#1
|L0.12|
        LDRB     r2,[r0,#0]
        CMP      r2,#0
        BNE      |L0.4|
        MOVS     r0,r1
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	ldrb	w1, [x0]
	cbz	w1, .L4
	mov	w2, 0
.L3:
	cmp	w1, 32
	ldrb	w1, [x0,1]!
	csinc	w2, w2, w2, ne
	cbnz	w1, .L3
.L2:
	mov	w0, w2
	ret
.L4:
	mov	w2, w1
	b	.L2
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                lb      $v1, 0($a0)
                or      $at, $zero
                beqz    $v1, locret_48
                li      $a1, 0x20  # ' '
                b       loc_28
                move    $v0, $zero
loc_18:                                  # CODE XREF: f:loc_28
                lb      $v1, 0($a0)
                or      $at, $zero
                beqz    $v1, locret_40
                or      $at, $zero

loc_28:                                  # CODE XREF: f+10
                                         # f+38
                bne     $v1, $a1, loc_18
                addiu   $a0, 1
                lb      $v1, 0($a0)
                or      $at, $zero
                bnez    $v1, loc_28
                addiu   $v0, 1

locret_40:                               # CODE XREF: f+20
                jr      $ra
                or      $at, $zero
locret_48:                               # CODE XREF: f+8
                jr      $ra
                move    $v0, $zero
_PRE_END

_CHALLENGE_FOOTER()


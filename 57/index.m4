m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #57.')
_TAGS(`57')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
$SG2795	DB	'%d', 0aH, 00H

_main	PROC
	push	esi
	push	edi
	mov	edi, DWORD PTR __imp__printf
	mov	esi, 1
	npad	3 ; align next label
$LL3@main:
	push	esi
	push	OFFSET $SG2795 ; '%d'
	call	edi
	add	esi, 3
	add	esp, 8
	cmp	esi, 100
	jl	SHORT $LL3@main
	pop	edi
	xor	eax, eax
	pop	esi
	ret	0
_main	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,lr}
        MOV      r4,#1
|L0.8|
        MOV      r1,r4
        ADR      r0,|L0.40|
        BL       __2printf
        ADD      r4,r4,#3
        CMP      r4,#0x64
        MOVGE    r0,#0
        BLT      |L0.8|
        POP      {r4,pc}
        ENDP

|L0.40|
        DCB      "%d\n",0
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,lr}
        MOVS     r4,#1
|L0.4|
        MOVS     r1,r4
        ADR      r0,|L0.24|
        BL       __2printf
        ADDS     r4,r4,#3
        CMP      r4,#0x64
        BLT      |L0.4|
        MOVS     r0,#0
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L0.24|
        DCB      "%d\n",0
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
main:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	adrp	x20, .LC0
	mov	w19, 1
	add	x20, x20, :lo12:.LC0
.L2:
	mov	w1, w19
	mov	x0, x20
	add	w19, w19, 3
	bl	printf
	cmp	w19, 100
	bne	.L2
	ldp	x19, x20, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"%d\n"
_PRE_END

_HL2(Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
main:

var_18          = -0x18
var_10          = -0x10
var_C           = -0xC
var_8           = -8
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x28
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x28+var_4($sp)
                sw      $s2, 0x28+var_8($sp)
                sw      $s1, 0x28+var_C($sp)
                sw      $s0, 0x28+var_10($sp)
                sw      $gp, 0x28+var_18($sp)
                la      $s2, $LC0        # "%d\n"
                li      $s0, 1
                li      $s1, 0x64  # 'd'

loc_30:                                  # CODE XREF: main+48
                lw      $t9, (printf & 0xFFFF)($gp)
                move    $a1, $s0
                move    $a0, $s2
                jalr    $t9
                addiu   $s0, 3
                lw      $gp, 0x28+var_18($sp)
                bne     $s0, $s1, loc_30
                or      $at, $zero
                lw      $ra, 0x28+var_4($sp)
                lw      $s2, 0x28+var_8($sp)
                lw      $s1, 0x28+var_C($sp)
                lw      $s0, 0x28+var_10($sp)
                jr      $ra
                addiu   $sp, 0x28

$LC0:           .ascii "%d\n"<0>         # DATA XREF: main+20
_PRE_END

_CHALLENGE_FOOTER()


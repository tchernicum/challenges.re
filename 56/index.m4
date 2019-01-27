m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #56.')
_TAGS(`56')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
$SG2795	DB	'%d', 0aH, 00H

_main	PROC
	push	esi
	push	edi
	mov	edi, DWORD PTR __imp__printf
	mov	esi, 100
	npad	3 ; align next label
$LL3@main:
	push	esi
	push	OFFSET $SG2795 ; '%d'
	call	edi
	dec	esi
	add	esp, 8
	test	esi, esi
	jg	SHORT $LL3@main
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
        MOV      r4,#0x64
|L0.8|
        MOV      r1,r4
        ADR      r0,|L0.40|
        BL       __2printf
        SUB      r4,r4,#1
        CMP      r4,#0
        MOVLE    r0,#0
        BGT      |L0.8|
        POP      {r4,pc}
        ENDP

|L0.40|
        DCB      "%d\n",0
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,lr}
        MOVS     r4,#0x64
|L0.4|
        MOVS     r1,r4
        ADR      r0,|L0.24|
        BL       __2printf
        SUBS     r4,r4,#1
        CMP      r4,#0
        BGT      |L0.4|
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
	mov	w19, 100
	add	x20, x20, :lo12:.LC0
.L2:
	mov	w1, w19
	mov	x0, x20
	bl	printf
	subs	w19, w19, #1
	bne	.L2
	ldp	x19, x20, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"%d\n"
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

main:

_PRE_BEGIN
var_18          = -0x18
var_C           = -0xC
var_8           = -8
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x28
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x28+var_4($sp)
                sw      $s1, 0x28+var_8($sp)
                sw      $s0, 0x28+var_C($sp)
                sw      $gp, 0x28+var_18($sp)
                la      $s1, $LC0        # "%d\n"
                li      $s0, 0x64  # 'd'

loc_28:                                  # CODE XREF: main+40
                lw      $t9, (printf & 0xFFFF)($gp)
                move    $a1, $s0
                move    $a0, $s1
                jalr    $t9
                addiu   $s0, -1
                lw      $gp, 0x28+var_18($sp)
                bnez    $s0, loc_28
                or      $at, $zero
                lw      $ra, 0x28+var_4($sp)
                lw      $s1, 0x28+var_8($sp)
                lw      $s0, 0x28+var_C($sp)
                jr      $ra
                addiu   $sp, 0x28

$LC0:           .ascii "%d\n"<0>         # DATA XREF: main+1C
_PRE_END

_CHALLENGE_FOOTER()


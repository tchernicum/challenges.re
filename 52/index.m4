m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #52.')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
$SG3103	DB	'%d', 0aH, 00H

_main	PROC
	push	0
	call	DWORD PTR __imp___time64
	push	edx
	push	eax
	push	OFFSET $SG3103 ; '%d'
	call	DWORD PTR __imp__printf
	add	esp, 16
	xor	eax, eax
	ret	0
_main	ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,lr}
        MOV      r0,#0
        BL       time
        MOV      r1,r0
        ADR      r0,|L0.32|
        BL       __2printf
        MOV      r0,#0
        POP      {r4,pc}
        ENDP

|L0.32|
        DCB      "%d\n",0
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,lr}
        MOVS     r0,#0
        BL       time
        MOVS     r1,r0
        ADR      r0,|L0.20|
        BL       __2printf
        MOVS     r0,#0
        POP      {r4,pc}
        ENDP

|L0.20|
        DCB      "%d\n",0
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
main:
	stp	x29, x30, [sp, -16]!
	mov	x0, 0
	add	x29, sp, 0
	bl	time
	mov	x1, x0
	ldp	x29, x30, [sp], 16
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	b	printf
.LC0:
	.string	"%d\n"
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
main:

var_10          = -0x10
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x20
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x20+var_4($sp)
                sw      $gp, 0x20+var_10($sp)
                lw      $t9, (time & 0xFFFF)($gp)
                or      $at, $zero
                jalr    $t9
                move    $a0, $zero
                lw      $gp, 0x20+var_10($sp)
                lui     $a0, ($LC0 >> 16)  # "%d\n"
                lw      $t9, (printf & 0xFFFF)($gp)
                lw      $ra, 0x20+var_4($sp)
                la      $a0, ($LC0 & 0xFFFF)  # "%d\n"
                move    $a1, $v0
                jr      $t9
                addiu   $sp, 0x20

$LC0:           .ascii "%d\n"<0>         # DATA XREF: main+28
_PRE_END

_CHALLENGE_FOOTER()


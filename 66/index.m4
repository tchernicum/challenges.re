m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #66.')
_TAGS(`66')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2012 /GS-')

_PRE_BEGIN
COMM	_tbl:DWORD:064H

tv759 = -4	; size = 4
_main	PROC
	push	ecx
	push	ebx
	push	ebp
	push	esi
	xor	edx, edx
	push	edi
	xor	esi, esi
	xor	edi, edi
	xor	ebx, ebx
	xor	ebp, ebp
	mov	DWORD PTR tv759[esp+20], edx
	mov	eax, OFFSET _tbl+4
	npad	8 ; align next label
$LL6@main:
	lea	ecx, DWORD PTR [edx+edx]
	mov	DWORD PTR [eax+4], ecx
	mov	ecx, DWORD PTR tv759[esp+20]
	add	DWORD PTR tv759[esp+20], 3
	mov	DWORD PTR [eax+8], ecx
	lea	ecx, DWORD PTR [edx*4]
	mov	DWORD PTR [eax+12], ecx
	lea	ecx, DWORD PTR [edx*8]
	mov	DWORD PTR [eax], edx
	mov	DWORD PTR [eax+16], ebp
	mov	DWORD PTR [eax+20], ebx
	mov	DWORD PTR [eax+24], edi
	mov	DWORD PTR [eax+32], esi
	mov	DWORD PTR [eax-4], 0
	mov	DWORD PTR [eax+28], ecx
	add	eax, 40
	inc	edx
	add	ebp, 5
	add	ebx, 6
	add	edi, 7
	add	esi, 9
	cmp	eax, OFFSET _tbl+404
	jl	SHORT $LL6@main
	pop	edi
	pop	esi
	pop	ebp
	xor	eax, eax
	pop	ebx
	pop	ecx
	ret	0
_main	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
main PROC
        LDR      r12,|L0.60|
        MOV      r1,#0
|L0.8|
        ADD      r2,r1,r1,LSL #2
        MOV      r0,#0
        ADD      r2,r12,r2,LSL #3
|L0.20|
        MUL      r3,r1,r0
        STR      r3,[r2,r0,LSL #2]
        ADD      r0,r0,#1
        CMP      r0,#0xa
        BLT      |L0.20|
        ADD      r1,r1,#1
        CMP      r1,#0xa
        MOVGE    r0,#0
        BLT      |L0.8|
        BX       lr
        ENDP

|L0.60|
        DCD      ||.bss||

        AREA ||.bss||, DATA, NOINIT, ALIGN=2

tbl
        %        400
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
main PROC
        PUSH     {r4,r5,lr}
        LDR      r4,|L0.40|
        MOVS     r1,#0
|L0.6|
        MOVS     r2,#0x28
        MULS     r2,r1,r2
        MOVS     r0,#0
        ADDS     r3,r2,r4
|L0.14|
        MOVS     r2,r1
        MULS     r2,r0,r2
        LSLS     r5,r0,#2
        ADDS     r0,r0,#1
        CMP      r0,#0xa
        STR      r2,[r3,r5]
        BLT      |L0.14|
        ADDS     r1,r1,#1
        CMP      r1,#0xa
        BLT      |L0.6|
        MOVS     r0,#0
        POP      {r4,r5,pc}
        ENDP

        DCW      0x0000
|L0.40|
        DCD      ||.bss||

        AREA ||.bss||, DATA, NOINIT, ALIGN=2

tbl
        %        400
_PRE_END

_HL2(`Non-Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
	.comm	tbl,400,8
main:
	sub	sp, sp, #16
	str	wzr, [sp,12]
	b	.L2
.L5:
	str	wzr, [sp,8]
	b	.L3
.L4:
	ldr	w1, [sp,12]
	ldr	w0, [sp,8]
	mul	w3, w1, w0
	adrp	x0, tbl
	add	x2, x0, :lo12:tbl
	ldrsw	x4, [sp,8]
	ldrsw	x1, [sp,12]
	mov	x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x4
	str	w3, [x2,x0,lsl 2]
	ldr	w0, [sp,8]
	add	w0, w0, 1
	str	w0, [sp,8]
.L3:
	ldr	w0, [sp,8]
	cmp	w0, 9
	ble	.L4
	ldr	w0, [sp,12]
	add	w0, w0, 1
	str	w0, [sp,12]
.L2:
	ldr	w0, [sp,12]
	cmp	w0, 9
	ble	.L5
	mov	w0, 0
	add	sp, sp, 16
	ret
_PRE_END

_HL2(`Non-Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
main:

var_18          = -0x18
var_10          = -0x10
var_C           = -0xC
var_4           = -4

                addiu   $sp, -0x18
                sw      $fp, 0x18+var_4($sp)
                move    $fp, $sp
                la      $gp, __gnu_local_gp
                sw      $gp, 0x18+var_18($sp)
                sw      $zero, 0x18+var_C($fp)
                b       loc_A0
                or      $at, $zero

loc_24:                                  # CODE XREF: main+AC
                sw      $zero, 0x18+var_10($fp)
                b       loc_7C
                or      $at, $zero

loc_30:                                  # CODE XREF: main+88
                lw      $v0, 0x18+var_C($fp)
                lw      $a0, 0x18+var_10($fp)
                lw      $a1, 0x18+var_C($fp)
                lw      $v1, 0x18+var_10($fp)
                or      $at, $zero
                mult    $a1, $v1
                mflo    $a2
                lw      $v1, (tbl & 0xFFFF)($gp)
                sll     $v0, 1
                sll     $a1, $v0, 2
                addu    $v0, $a1
                addu    $v0, $a0
                sll     $v0, 2
                addu    $v0, $v1, $v0
                sw      $a2, 0($v0)
                lw      $v0, 0x18+var_10($fp)
                or      $at, $zero
                addiu   $v0, 1
                sw      $v0, 0x18+var_10($fp)

loc_7C:                                  # CODE XREF: main+28
                lw      $v0, 0x18+var_10($fp)
                or      $at, $zero
                slti    $v0, 0xA
                bnez    $v0, loc_30
                or      $at, $zero
                lw      $v0, 0x18+var_C($fp)
                or      $at, $zero
                addiu   $v0, 1
                sw      $v0, 0x18+var_C($fp)

loc_A0:                                  # CODE XREF: main+1C
                lw      $v0, 0x18+var_C($fp)
                or      $at, $zero
                slti    $v0, 0xA
                bnez    $v0, loc_24
                or      $at, $zero
                move    $v0, $zero
                move    $sp, $fp
                lw      $fp, 0x18+var_4($sp)
                addiu   $sp, 0x18
                jr      $ra
                or      $at, $zero

                .comm tbl:0x64           # DATA XREF: main+4C
_PRE_END

_CHALLENGE_FOOTER()


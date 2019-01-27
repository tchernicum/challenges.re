m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #72.')
_TAGS(`72')

<p>
This function takes some structure on input and does something.
Try to reverse engineer structure field types.
Function contents may be ignored for the moment.
</p>
<!--
\RU{Эта функция берет какую-то структуру на вход и делает что-то. Попробуйте разобраться, поля каких типов 
присутствуют в структуре. Самое содержимое функции можно пока игнорировать.}
-->

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
$SG2802	DB	'%f', 0aH, 00H
$SG2803	DB	'%c, %d', 0aH, 00H
$SG2805	DB	'error #2', 0aH, 00H
$SG2807	DB	'error #1', 0aH, 00H

__real@405ec00000000000 DQ 0405ec00000000000r	; 123
__real@407bc00000000000 DQ 0407bc00000000000r	; 444

_s$ = 8
_f	PROC
	push	esi
	mov	esi, DWORD PTR _s$[esp]
	cmp	DWORD PTR [esi], 1000
	jle	SHORT $LN4@f
	cmp	DWORD PTR [esi+4], 10
	jbe	SHORT $LN3@f
	fld	DWORD PTR [esi+8]
	sub	esp, 8
	fmul	QWORD PTR __real@407bc00000000000
	fld	QWORD PTR [esi+16]
	fmul	QWORD PTR __real@405ec00000000000
	faddp	ST(1), ST(0)
	fstp	QWORD PTR [esp]
	push	OFFSET $SG2802 ; '%f'
	call	_printf
	movzx	eax, BYTE PTR [esi+25]
	movsx	ecx, BYTE PTR [esi+24]
	push	eax
	push	ecx
	push	OFFSET $SG2803 ; '%c, %d'
	call	_printf
	add	esp, 24
	pop	esi
	ret	0
$LN3@f:
	pop	esi
	mov	DWORD PTR _s$[esp-4], OFFSET $SG2805 ; 'error #2'
	jmp	_printf
$LN4@f:
	pop	esi
	mov	DWORD PTR _s$[esp-4], OFFSET $SG2807 ; 'error #1'
	jmp	_printf
_f	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        LDR      r0,[r0,#0]
        CMP      r0,#0x3e8
        ADRLE    r0,|L0.140|
        BLE      |L0.132|
        LDR      r0,[r4,#4]
        CMP      r0,#0xa
        ADRLS    r0,|L0.152|
        BLS      |L0.132|
        ADD      r0,r4,#0x10
        LDM      r0,{r0,r1}
        LDR      r3,|L0.164|
        MOV      r2,#0
        BL       __aeabi_dmul
        MOV      r5,r0
        MOV      r6,r1
        LDR      r0,[r4,#8]
        LDR      r1,|L0.168|
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOV      r2,r5
        MOV      r3,r6
        BL       __aeabi_dadd
        MOV      r2,r0
        MOV      r3,r1
        ADR      r0,|L0.172|
        BL       __2printf
        LDRB     r2,[r4,#0x19]
        LDRB     r1,[r4,#0x18]
        POP      {r4-r6,lr}
        ADR      r0,|L0.176|
        B        __2printf
|L0.132|
        POP      {r4-r6,lr}
        B        __2printf
        ENDP

|L0.140|
        DCB      "error #1\n",0
        DCB      0
        DCB      0
|L0.152|
        DCB      "error #2\n",0
        DCB      0
        DCB      0
|L0.164|
        DCD      0x405ec000
|L0.168|
        DCD      0x43de0000
|L0.172|
        DCB      "%f\n",0
|L0.176|
        DCB      "%c, %d\n",0
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        LDR      r0,[r0,#0]
        CMP      r0,#0x3e8
        ADRLE    r0,|L0.140|
        BLE      |L0.132|
        LDR      r0,[r4,#4]
        CMP      r0,#0xa
        ADRLS    r0,|L0.152|
        BLS      |L0.132|
        ADD      r0,r4,#0x10
        LDM      r0,{r0,r1}
        LDR      r3,|L0.164|
        MOV      r2,#0
        BL       __aeabi_dmul
        MOV      r5,r0
        MOV      r6,r1
        LDR      r0,[r4,#8]
        LDR      r1,|L0.168|
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOV      r2,r5
        MOV      r3,r6
        BL       __aeabi_dadd
        MOV      r2,r0
        MOV      r3,r1
        ADR      r0,|L0.172|
        BL       __2printf
        LDRB     r2,[r4,#0x19]
        LDRB     r1,[r4,#0x18]
        POP      {r4-r6,lr}
        ADR      r0,|L0.176|
        B        __2printf
|L0.132|
        POP      {r4-r6,lr}
        B        __2printf
        ENDP

|L0.140|
        DCB      "error #1\n",0
        DCB      0
        DCB      0
|L0.152|
        DCB      "error #2\n",0
        DCB      0
        DCB      0
|L0.164|
        DCD      0x405ec000
|L0.168|
        DCD      0x43de0000
|L0.172|
        DCB      "%f\n",0
|L0.176|
        DCB      "%c, %d\n",0
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	ldr	w1, [x0]
	str	x19, [sp,16]
	cmp	w1, 1000
	ble	.L2
	ldr	w1, [x0,4]
	cmp	w1, 10
	bls	.L3
	ldr	s1, [x0,8]
	mov	x19, x0
	ldr	s0, .LC1
	adrp	x0, .LC0
	ldr	d2, [x19,16]
	add	x0, x0, :lo12:.LC0
	fmul	s1, s1, s0
	ldr	d0, .LC2
	fmul	d0, d2, d0
	fcvt	d1, s1
	fadd	d0, d1, d0
	bl	printf
	ldrb	w1, [x19,24]
	adrp	x0, .LC3
	ldrb	w2, [x19,25]
	add	x0, x0, :lo12:.LC3
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	b	printf
.L3:
	ldr	x19, [sp,16]
	adrp	x0, .LC4
	ldp	x29, x30, [sp], 32
	add	x0, x0, :lo12:.LC4
	b	puts
.L2:
	ldr	x19, [sp,16]
	adrp	x0, .LC5
	ldp	x29, x30, [sp], 32
	add	x0, x0, :lo12:.LC5
	b	puts
	.size	f, .-f
.LC1:
	.word	1138622464
.LC2:
	.word	0
	.word	1079951360
.LC0:
	.string	"%f\n"
.LC3:
	.string	"%c, %d\n"
.LC4:
	.string	"error #2"
.LC5:
	.string	"error #1"
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:

var_10          = -0x10
var_8           = -8
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x20
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x20+var_4($sp)
                sw      $s0, 0x20+var_8($sp)
                sw      $gp, 0x20+var_10($sp)
                lw      $v0, 0($a0)
                or      $at, $zero
                slti    $v0, 0x3E9
                bnez    $v0, loc_C8
                move    $s0, $a0
                lw      $v0, 4($a0)
                or      $at, $zero
                sltiu   $v0, 0xB
                bnez    $v0, loc_AC
                lui     $v0, (dword_134 >> 16)
                lwc1    $f4, $LC1
                lwc1    $f2, 8($a0)
                lui     $v0, ($LC2 >> 16)
                lwc1    $f0, 0x14($a0)
                mul.s   $f2, $f4, $f2
                lwc1    $f4, dword_134
                lwc1    $f1, 0x10($a0)
                lwc1    $f5, $LC2
                cvt.d.s $f2, $f2
                mul.d   $f0, $f4, $f0
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC0 >> 16)  # "%f\n"
                add.d   $f4, $f2, $f0
                mfc1    $a2, $f5
                mfc1    $a3, $f4
                jalr    $t9
                la      $a0, ($LC0 & 0xFFFF)  # "%f\n"
                lw      $gp, 0x20+var_10($sp)
                lbu     $a2, 0x19($s0)
                lb      $a1, 0x18($s0)
                lui     $a0, ($LC3 >> 16)  # "%c, %d\n"
                lw      $t9, (printf & 0xFFFF)($gp)
                lw      $ra, 0x20+var_4($sp)
                lw      $s0, 0x20+var_8($sp)
                la      $a0, ($LC3 & 0xFFFF)  # "%c, %d\n"
                jr      $t9
                addiu   $sp, 0x20
loc_AC:                                  # CODE XREF: f+38
                lui     $a0, ($LC4 >> 16)  # "error #2"
                lw      $t9, (puts & 0xFFFF)($gp)
                lw      $ra, 0x20+var_4($sp)
                lw      $s0, 0x20+var_8($sp)
                la      $a0, ($LC4 & 0xFFFF)  # "error #2"
                jr      $t9
                addiu   $sp, 0x20
loc_C8:                                  # CODE XREF: f+24
                lui     $a0, ($LC5 >> 16)  # "error #1"
                lw      $t9, (puts & 0xFFFF)($gp)
                lw      $ra, 0x20+var_4($sp)
                lw      $s0, 0x20+var_8($sp)
                la      $a0, ($LC5 & 0xFFFF)  # "error #1"
                jr      $t9
                addiu   $sp, 0x20

$LC0:           .ascii "%f\n"<0>         
$LC3:           .ascii "%c, %d\n"<0>     
$LC4:           .ascii "error #2"<0>     
$LC5:           .ascii "error #1"<0>     

                .data # .rodata.cst4
$LC1:           .word 0x43DE0000         

                .data # .rodata.cst8
$LC2:           .word 0x405EC000         
dword_134:      .word 0                  
_PRE_END

_CHALLENGE_FOOTER()


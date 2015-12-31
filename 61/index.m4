m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #61.')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
__real@4014000000000000 DQ 04014000000000000r	; 5

_a1$ = 8	; size = 8
_a2$ = 16	; size = 8
_a3$ = 24	; size = 8
_a4$ = 32	; size = 8
_a5$ = 40	; size = 8
_f	PROC
	fld	QWORD PTR _a1$[esp-4]
	fadd	QWORD PTR _a2$[esp-4]
	fadd	QWORD PTR _a3$[esp-4]
	fadd	QWORD PTR _a4$[esp-4]
	fadd	QWORD PTR _a5$[esp-4]
	fdiv	QWORD PTR __real@4014000000000000
	ret	0
_f	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode, compiled for Cortex-R4F CPU)')

_PRE_BEGIN
f PROC
        VADD.F64 d0,d0,d1
        VMOV.F64 d1,#5.00000000
        VADD.F64 d0,d0,d2
        VADD.F64 d0,d0,d3
        VADD.F64 d2,d0,d4
        VDIV.F64 d0,d2,d1
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	fadd	d0, d0, d1
	fmov	d1, 5.0e+0
	fadd	d2, d0, d2
	fadd	d3, d2, d3
	fadd	d0, d3, d4
	fdiv	d0, d0, d1
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:

arg_10          =  0x10
arg_14          =  0x14
arg_18          =  0x18
arg_1C          =  0x1C
arg_20          =  0x20
arg_24          =  0x24

                lwc1    $f0, arg_14($sp)
                add.d   $f2, $f12, $f14
                lwc1    $f1, arg_10($sp)
                lui     $v0, ($LC0 >> 16)
                add.d   $f0, $f2, $f0
                lwc1    $f2, arg_1C($sp)
                or      $at, $zero
                lwc1    $f3, arg_18($sp)
                or      $at, $zero
                add.d   $f0, $f2
                lwc1    $f2, arg_24($sp)
                or      $at, $zero
                lwc1    $f3, arg_20($sp)
                or      $at, $zero
                add.d   $f0, $f2
                lwc1    $f2, dword_6C
                or      $at, $zero
                lwc1    $f3, $LC0
                jr      $ra
                div.d   $f0, $f2

$LC0:           .word 0x40140000         # DATA XREF: f+C
                                         # f+44
dword_6C:       .word 0                  # DATA XREF: f+3C
_PRE_END

_CHALLENGE_FOOTER()


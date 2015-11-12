m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #64.')

<p>What this code does?
Try to determine the dimensions of the array, at least partially.</p>

<!-- \RU{Попробуйте определить размеры массива, хотя бы частично.} -->

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_array$ = 8
_x$ = 12
_y$ = 16
_f	PROC
	mov	eax, DWORD PTR _x$[esp-4]
	mov	edx, DWORD PTR _y$[esp-4]
	mov	ecx, eax
	shl	ecx, 4
	sub	ecx, eax
	lea	eax, DWORD PTR [edx+ecx*8]
	mov	ecx, DWORD PTR _array$[esp-4]
	fld	QWORD PTR [ecx+eax*8]
	ret	0
_f	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        RSB      r1,r1,r1,LSL #4
        ADD      r0,r0,r1,LSL #6
        ADD      r1,r0,r2,LSL #3
        LDM      r1,{r0,r1}
        BX       lr
        ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        MOVS     r3,#0xf
        LSLS     r3,r3,#6
        MULS     r1,r3,r1
        ADDS     r0,r1,r0
        LSLS     r1,r2,#3
        ADDS     r1,r0,r1
        LDM      r1,{r0,r1}
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	sxtw	x1, w1
	add	x0, x0, x2, sxtw 3
	lsl	x2, x1, 10
	sub	x1, x2, x1, lsl 6
	ldr	d0, [x0,x1]
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                sll     $v0, $a1, 10
                sll     $a1, 6
                subu    $a1, $v0, $a1
                addu    $a1, $a0, $a1
                sll     $a2, 3
                addu    $a1, $a2
                lwc1    $f0, 4($a1)
                or      $at, $zero
                lwc1    $f1, 0($a1)
                jr      $ra
                or      $at, $zero
_PRE_END

_CHALLENGE_FOOTER()


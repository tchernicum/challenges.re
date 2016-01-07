m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #65.')

<p>What does this code do?
Try to determine the dimensions of the array, at least partially.</p>

<!--\RU{Попробуйте определить размеры массива, хотя бы частично.}-->

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_array$ = 8	
_x$ = 12	
_y$ = 16	
_z$ = 20	
_f	PROC
	mov	eax, DWORD PTR _x$[esp-4]
	mov	edx, DWORD PTR _y$[esp-4]
	mov	ecx, eax
	shl	ecx, 4
	sub	ecx, eax
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _array$[esp-4]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 4
	add	eax, DWORD PTR _z$[esp-4]
	mov	eax, DWORD PTR [ecx+eax*4]
	ret	0
_f	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        RSB      r1,r1,r1,LSL #4
        ADD      r1,r1,r1,LSL #2
        ADD      r0,r0,r1,LSL #8
        ADD      r1,r2,r2,LSL #2
        ADD      r0,r0,r1,LSL #6
        LDR      r0,[r0,r3,LSL #2]
        BX       lr
        ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        PUSH     {r4,lr}
        MOVS     r4,#0x4b
        LSLS     r4,r4,#8
        MULS     r1,r4,r1
        ADDS     r0,r1,r0
        MOVS     r1,#0xff
        ADDS     r1,r1,#0x41
        MULS     r2,r1,r2
        ADDS     r0,r0,r2
        LSLS     r1,r3,#2
        LDR      r0,[r0,r1]
        POP      {r4,pc}
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	sxtw	x2, w2
	mov	w4, 19200
	add	x2, x2, x2, lsl 2
	smull	x1, w1, w4
	lsl	x2, x2, 4
	add	x3, x2, x3, sxtw
	add	x0, x0, x3, lsl 2
	ldr	w0, [x0,x1]
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                sll     $v0, $a1, 10
                sll     $a1, 8
                addu    $a1, $v0
                sll     $v0, $a2, 6
                sll     $a2, 4
                addu    $a2, $v0
                sll     $v0, $a1, 4
                subu    $a1, $v0, $a1
                addu    $a2, $a3
                addu    $a1, $a0, $a1
                sll     $a2, 2
                addu    $a1, $a2
                lw      $v0, 0($a1)
                jr      $ra
                or      $at, $zero
_PRE_END

_CHALLENGE_FOOTER()


m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #67.')

<p>What does this code do?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_a$ = 8
_f	PROC
	mov	ecx, DWORD PTR _a$[esp-4]
	mov	eax, ecx
	mov	edx, ecx
	shl	edx, 16		; 00000010H
	and	eax, 65280	; 0000ff00H
	or	eax, edx
	mov	edx, ecx
	and	edx, 16711680	; 00ff0000H
	shr	ecx, 16		; 00000010H
	or	edx, ecx
	shl	eax, 8
	shr	edx, 8
	or	eax, edx
	ret	0
_f	ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        MOV      r1,#0xff0000
        AND      r1,r1,r0,LSL #8
        MOV      r2,#0xff00
        ORR      r1,r1,r0,LSR #24
        AND      r2,r2,r0,LSR #8
        ORR      r1,r1,r2
        ORR      r0,r1,r0,LSL #24
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        MOVS     r3,#0xff
        LSLS     r2,r0,#8
        LSLS     r3,r3,#16
        ANDS     r2,r2,r3
        LSRS     r1,r0,#24
        ORRS     r1,r1,r2
        LSRS     r2,r0,#8
        ASRS     r3,r3,#8
        ANDS     r2,r2,r3
        ORRS     r1,r1,r2
        LSLS     r0,r0,#24
        ORRS     r0,r0,r1
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	rev	w0, w0
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                srl     $v0, $a0, 24
                sll     $v1, $a0, 24
                sll     $a1, $a0, 8
                or      $v1, $v0
                lui     $v0, 0xFF
                and     $v0, $a1, $v0
                srl     $a0, 8
                or      $v0, $v1, $v0
                andi    $a0, 0xFF00
                jr      $ra
                or      $v0, $a0
_PRE_END

_CHALLENGE_FOOTER()


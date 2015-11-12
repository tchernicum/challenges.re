m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #59.')

<p>What this code does?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_a$ = 8
_f	PROC
	mov	ecx, DWORD PTR _a$[esp-4]
	lea	eax, DWORD PTR [ecx*8]
	sub	eax, ecx
	ret	0
_f	ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (ARM Mode)')

_PRE_BEGIN
f PROC
        RSB      r0,r0,r0,LSL #3
        BX       lr
        ENDP
_PRE_END

_HL2(`Non-Optimizing Keil 6 (Thumb Mode)')

_PRE_BEGIN
f PROC
        LSLS     r1,r0,#3
        SUBS     r0,r1,r0
        BX       lr
        ENDP
_PRE_END

_HL2(`Optimizing GCC 4.9 (ARM64)')

_PRE_BEGIN
f:
	lsl	w1, w0, 3
	sub	w0, w1, w0
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS) (IDA)')

_PRE_BEGIN
f:
                sll     $v0, $a0, 3
                jr      $ra
                subu    $v0, $a0
_PRE_END

_CHALLENGE_FOOTER()


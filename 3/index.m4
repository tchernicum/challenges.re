m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #3.')
_TAGS(`3')

<p>What does this code do? The function has array of 64 32-bit integers, I removed it in each assembly code snippet to save space.
The array is:</p>

_PRE_BEGIN
int v[64]=
	{ -1,31, 8,30, -1, 7,-1,-1, 29,-1,26, 6, -1,-1, 2,-1,
	  -1,28,-1,-1, -1,19,25,-1, 5,-1,17,-1, 23,14, 1,-1,
	   9,-1,-1,-1, 27,-1, 3,-1, -1,-1,20,-1, 18,24,15,10,
	  -1,-1, 4,-1, 21,-1,16,11, -1,22,-1,12, 13,-1, 0,-1 };
_PRE_END

<p>The algorithm is well-known, but I've changed constant so it wouldn't be googleable.</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
f:
	mov	edx, edi
	shr	edx
	or	edx, edi
	mov	eax, edx
	shr	eax, 2
	or	eax, edx
	mov	edx, eax
	shr	edx, 4
	or	edx, eax
	mov	eax, edx
	shr	eax, 8
	or	eax, edx
	mov	edx, eax
	shr	edx, 16
	or	edx, eax
	imul	eax, edx, 79355661 ; 0x4badf0d
	shr	eax, 26
	mov	eax, DWORD PTR v[0+rax*4]
	ret
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
<f>:
   0:           orr     w0, w0, w0, lsr #1
   4:           mov     w1, #0xdf0d                     // #57101
   8:           movk    w1, #0x4ba, lsl #16
   c:           orr     w0, w0, w0, lsr #2
  10:           orr     w0, w0, w0, lsr #4
  14:           orr     w0, w0, w0, lsr #8
  18:           orr     w0, w0, w0, lsr #16
  1c:           mul     w0, w0, w1
  20:           adrp    x1, 0 <f>
  24:           add     x1, x1, #0x0
  28:           lsr     w0, w0, #26
  2c:           ldr     w0, [x1,w0,uxtw #2]
  30:           ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        ORR      r0,r0,r0,LSR #1
        ORR      r0,r0,r0,LSR #2
        ORR      r0,r0,r0,LSR #4
        LDR      r1,|L0.44|
        ORR      r0,r0,r0,LSR #8
        ORR      r0,r0,r0,LSR #16
        MUL      r0,r1,r0
        LDR      r1,|L0.48|
        LSR      r0,r0,#26
        LDR      r0,[r1,r0,LSL #2]
        BX       lr
        ENDP

|L0.44|
        DCD      0x04badf0d
|L0.48|
        DCD      ||.data||
...
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (thumb mode):</p>

_PRE_BEGIN
f PROC
        LSRS     r1,r0,#1
        ORRS     r1,r1,r0
        LSRS     r0,r1,#2
        ORRS     r0,r0,r1
        LSRS     r1,r0,#4
        ORRS     r1,r1,r0
        LSRS     r2,r1,#8
        ORRS     r2,r2,r1
        LDR      r1,|L0.36|
        LSRS     r0,r2,#16
        ORRS     r0,r0,r2
        MULS     r0,r1,r0
        LDR      r1,|L0.40|
        LSRS     r0,r0,#26
        LSLS     r0,r0,#2
        LDR      r0,[r1,r0]
        BX       lr
        ENDP

|L0.36|
        DCD      0x04badf0d
|L0.40|
        DCD      ||.data||
...
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        srl     $2,$4,1
        or      $2,$2,$4
        srl     $3,$2,2
        or      $2,$3,$2
        srl     $3,$2,4
        or      $2,$3,$2
        srl     $3,$2,8
        or      $2,$3,$2
        srl     $3,$2,16
        or      $2,$3,$2
        li      $3,79298560                     # 0x4ba0000
        ori     $3,$3,0xdf0d
        mult    $2,$3
        lui     $3,%hi(v)
        addiu   $3,$3,%lo(v)
        mflo    $2
        srl     $2,$2,26
        sll     $2,$2,2
        addu    $2,$2,$3
        lw      $2,0($2)
        j       $31
        nop
_PRE_END

_CHALLENGE_FOOTER()


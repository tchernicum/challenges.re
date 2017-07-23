m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #35.')
_TAGS(`35')

<!-- \RU{Еще один хорошо известный алгоритм. Функция берет на вход 2 значения и возвращает одно.} -->

<p>Another well-known algorithm. The function takes two variables and returns one.</p>

_HL2(`MSVC 2012')

<!-- TODO link \index{x86!\Instructions!BSF} -->

_PRE_BEGIN
_rt$1 = -4						; size = 4
_rt$2 = 8						; size = 4
_x$ = 8							; size = 4
_y$ = 12						; size = 4
?f@@YAIII@Z PROC					; f
	push	ecx
	push	esi
	mov	esi, DWORD PTR _x$[esp+4]
	test	esi, esi
	jne	SHORT $LN7@f
	mov	eax, DWORD PTR _y$[esp+4]
	pop	esi
	pop	ecx
	ret	0
$LN7@f:
	mov	edx, DWORD PTR _y$[esp+4]
	mov	eax, esi
	test	edx, edx
	je	SHORT $LN8@f
	or	eax, edx
	push	edi
	bsf	edi, eax
	bsf	eax, esi
	mov	ecx, eax
	mov	DWORD PTR _rt$1[esp+12], eax
	bsf	eax, edx
	shr	esi, cl
	mov	ecx, eax
	shr	edx, cl
	mov	DWORD PTR _rt$2[esp+8], eax
	cmp	esi, edx
	je	SHORT $LN22@f
$LN23@f:
	jbe	SHORT $LN2@f
	xor	esi, edx
	xor	edx, esi
	xor	esi, edx
$LN2@f:
	cmp	esi, 1
	je	SHORT $LN22@f
	sub	edx, esi
	bsf	eax, edx
	mov	ecx, eax
	shr	edx, cl
	mov	DWORD PTR _rt$2[esp+8], eax
	cmp	esi, edx
	jne	SHORT $LN23@f
$LN22@f:
	mov	ecx, edi
	shl	esi, cl
	pop	edi
	mov	eax, esi
$LN8@f:
	pop	esi
	pop	ecx
	ret	0
?f@@YAIII@Z ENDP
_PRE_END

_HL2(`Keil (ARM Mode)')

<!-- TODO link \index{ARM!\Instructions!CLZ} -->

_PRE_BEGIN
||f1|| PROC
        CMP      r0,#0
        RSB      r1,r0,#0
        AND      r0,r0,r1
        CLZ      r0,r0
        RSBNE    r0,r0,#0x1f
        BX       lr
        ENDP

f PROC
        MOVS     r2,r0
        MOV      r3,r1
        MOVEQ    r0,r1
        CMPNE    r3,#0
        PUSH     {lr}
        POPEQ    {pc}
        ORR      r0,r2,r3
        BL       ||f1||
        MOV      r12,r0
        MOV      r0,r2
        BL       ||f1||
        LSR      r2,r2,r0
|L0.196|
        MOV      r0,r3
        BL       ||f1||
        LSR      r0,r3,r0
        CMP      r2,r0
        EORHI    r1,r2,r0
        EORHI    r0,r0,r1
        EORHI    r2,r1,r0
        BEQ      |L0.240|
        CMP      r2,#1
        SUBNE    r3,r0,r2
        BNE      |L0.196|
|L0.240|
        LSL      r0,r2,r12
        POP      {pc}
        ENDP
_PRE_END

_HL2(`GCC 4.6.3 for Raspberry Pi (ARM Mode)')

<!-- TODO link \index{ARM!\Instructions!CLZ} -->

_PRE_BEGIN
f:
        subs    r3, r0, #0
        beq     .L162
        cmp     r1, #0
        moveq   r1, r3
        beq     .L162
        orr     r2, r1, r3
        rsb     ip, r2, #0
        and     ip, ip, r2
        cmp     r2, #0
        rsb     r2, r3, #0
        and     r2, r2, r3
        clz     r2, r2
        rsb     r2, r2, #31
        clz     ip, ip
        rsbne   ip, ip, #31
        mov     r3, r3, lsr r2
        b       .L169
.L171:
        eorhi   r1, r1, r2
        eorhi   r3, r1, r2
        cmp     r3, #1
        rsb     r1, r3, r1
        beq     .L167
.L169:
        rsb     r0, r1, #0
        and     r0, r0, r1
        cmp     r1, #0
        clz     r0, r0
        mov     r2, r0
        rsbne   r2, r0, #31
        mov     r1, r1, lsr r2
        cmp     r3, r1
        eor     r2, r1, r3
        bne     .L171
.L167:
        mov     r1, r3, asl ip
.L162:
        mov     r0, r1
        bx      lr
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
f:
	mov	w3, w0
	mov	w0, w1
	cbz	w3, .L8
	mov	w0, w3
	cbz	w1, .L8
	mov	w6, 31
	orr	w5, w3, w1
	neg	w2, w3
	neg	w7, w5
	and	w2, w2, w3
	clz	w2, w2
	sub	w2, w6, w2
	and	w5, w7, w5
	mov	w4, w6
	clz	w5, w5
	lsr	w0, w3, w2
	sub	w5, w6, w5
	b	.L13
.L22:
	bls	.L12
	eor	w1, w1, w2
	eor	w0, w1, w2
.L12:
	cmp	w0, 1
	sub	w1, w1, w0
	beq	.L11
.L13:
	neg	w2, w1
	cmp	w1, wzr
	and	w2, w2, w1
	clz	w2, w2
	sub	w3, w4, w2
	csel	w2, w3, w2, ne
	lsr	w1, w1, w2
	cmp	w0, w1
	eor	w2, w1, w0
	bne	.L22
.L11:
	lsl	w0, w0, w5
.L8:
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:

var_20          = -0x20
var_18          = -0x18
var_14          = -0x14
var_10          = -0x10
var_C           = -0xC
var_8           = -8
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x30
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x30+var_4($sp)
                sw      $s4, 0x30+var_8($sp)
                sw      $s3, 0x30+var_C($sp)
                sw      $s2, 0x30+var_10($sp)
                sw      $s1, 0x30+var_14($sp)
                sw      $s0, 0x30+var_18($sp)
                sw      $gp, 0x30+var_20($sp)
                move    $s0, $a0
                beqz    $a0, loc_154
                move    $s1, $a1
                bnez    $a1, loc_178
                or      $s2, $a1, $a0
                move    $s1, $a0

loc_154:                                 # CODE XREF: f+2C
                lw      $ra, 0x30+var_4($sp)
                move    $v0, $s1
                lw      $s4, 0x30+var_8($sp)
                lw      $s3, 0x30+var_C($sp)
                lw      $s2, 0x30+var_10($sp)
                lw      $s1, 0x30+var_14($sp)
                lw      $s0, 0x30+var_18($sp)
                jr      $ra
                addiu   $sp, 0x30

loc_178:                                 # CODE XREF: f+34
                lw      $t9, (__clzsi2 & 0xFFFF)($gp)
                negu    $a0, $s2
                jalr    $t9
                and     $a0, $s2
                lw      $gp, 0x30+var_20($sp)
                bnez    $s2, loc_20C
                li      $s4, 0x1F
                move    $s4, $v0

loc_198:                                 # CODE XREF: f:loc_20C
                lw      $t9, (__clzsi2 & 0xFFFF)($gp)
                negu    $a0, $s0
                jalr    $t9
                and     $a0, $s0
                nor     $v0, $zero, $v0
                lw      $gp, 0x30+var_20($sp)
                srlv    $s0, $v0
                li      $s3, 0x1F
                li      $s2, 1

loc_1BC:                                 # CODE XREF: f+F0
                lw      $t9, (__clzsi2 & 0xFFFF)($gp)
                negu    $a0, $s1
                jalr    $t9
                and     $a0, $s1
                lw      $gp, 0x30+var_20($sp)
                beqz    $s1, loc_1DC
                or      $at, $zero
                subu    $v0, $s3, $v0

loc_1DC:                                 # CODE XREF: f+BC
                srlv    $s1, $v0
                xor     $v1, $s1, $s0
                beq     $s0, $s1, loc_214
                sltu    $v0, $s1, $s0
                beqz    $v0, loc_1FC
                or      $at, $zero
                xor     $s1, $v1
                xor     $s0, $s1, $v1

loc_1FC:                                 # CODE XREF: f+D8
                beq     $s0, $s2, loc_214
                subu    $s1, $s0
                b       loc_1BC
                or      $at, $zero

loc_20C:                                 # CODE XREF: f+78
                b       loc_198
                subu    $s4, $v0

loc_214:                                 # CODE XREF: f+D0
                                         # f:loc_1FC
                lw      $ra, 0x30+var_4($sp)
                sllv    $s1, $s0, $s4
                move    $v0, $s1
                lw      $s4, 0x30+var_8($sp)
                lw      $s3, 0x30+var_C($sp)
                lw      $s2, 0x30+var_10($sp)
                lw      $s1, 0x30+var_14($sp)
                lw      $s0, 0x30+var_18($sp)
                jr      $ra
                addiu   $sp, 0x30
_PRE_END

_CHALLENGE_FOOTER()


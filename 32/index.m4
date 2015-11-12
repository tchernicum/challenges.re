m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #32.')

<!-- \RU{Это стандартная функция из библиотек Си. Исходник взят из MSVC 2010.} -->

<p>This is a standard C library function. The source code is taken from MSVC 2010.
What this code does?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
PUBLIC    _f
_TEXT    SEGMENT
_arg1$ = 8            ; size = 4
_arg2$ = 12           ; size = 4
_f    PROC
    push   esi
    mov    esi, DWORD PTR _arg1$[esp]
    push   edi
    mov    edi, DWORD PTR _arg2$[esp+4]
    cmp    BYTE PTR [edi], 0
    mov    eax, esi
    je     SHORT $LN7@f
    mov    dl, BYTE PTR [esi]
    push   ebx
    test   dl, dl
    je     SHORT $LN4@f
    sub    esi, edi
    npad   6 ; align next label
$LL5@f:
    mov    ecx, edi
    test   dl, dl
    je     SHORT $LN2@f
$LL3@f:
    mov    dl, BYTE PTR [ecx]
    test   dl, dl
    je     SHORT $LN14@f
    movsx  ebx, BYTE PTR [esi+ecx]
    movsx  edx, dl
    sub    ebx, edx
    jne    SHORT $LN2@f
    inc    ecx
    cmp    BYTE PTR [esi+ecx], bl
    jne    SHORT $LL3@f
$LN2@f:
    cmp    BYTE PTR [ecx], 0
    je     SHORT $LN14@f
    mov    dl, BYTE PTR [eax+1]
    inc    eax
    inc    esi
    test   dl, dl
    jne    SHORT $LL5@f
    xor    eax, eax
    pop    ebx
    pop    edi
    pop    esi
    ret    0
_f    ENDP
_TEXT    ENDS
END
_PRE_END

_HL2(`GCC 4.4.1')

_PRE_BEGIN
                public f
f               proc near

var_C           = dword ptr -0Ch
var_8           = dword ptr -8
var_4           = dword ptr -4
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch

                push    ebp
                mov     ebp, esp
                sub     esp, 10h
                mov     eax, [ebp+arg_0]
                mov     [ebp+var_4], eax
                mov     eax, [ebp+arg_4]
                movzx   eax, byte ptr [eax]
                test    al, al
                jnz     short loc_8048443
                mov     eax, [ebp+arg_0]
                jmp     short locret_8048453

loc_80483F4:
                mov     eax, [ebp+var_4]
                mov     [ebp+var_8], eax
                mov     eax, [ebp+arg_4]
                mov     [ebp+var_C], eax
                jmp     short loc_804840A

loc_8048402:
                add     [ebp+var_8], 1
                add     [ebp+var_C], 1

loc_804840A:
                mov     eax, [ebp+var_8]
                movzx   eax, byte ptr [eax]
                test    al, al
                jz      short loc_804842E
                mov     eax, [ebp+var_C]
                movzx   eax, byte ptr [eax]
                test    al, al
                jz      short loc_804842E
                mov     eax, [ebp+var_8]
                movzx   edx, byte ptr [eax]
                mov     eax, [ebp+var_C]
                movzx   eax, byte ptr [eax]
                cmp     dl, al
                jz      short loc_8048402

loc_804842E:
                mov     eax, [ebp+var_C]
                movzx   eax, byte ptr [eax]
                test    al, al
                jnz     short loc_804843D
                mov     eax, [ebp+var_4]
                jmp     short locret_8048453

loc_804843D:
                add     [ebp+var_4], 1
                jmp     short loc_8048444


loc_8048443:
                nop

loc_8048444:
                mov     eax, [ebp+var_4]
                movzx   eax, byte ptr [eax]
                test    al, al
                jnz     short loc_80483F4
                mov     eax, 0

locret_8048453:
                leave
                retn
f               endp
_PRE_END

_HL2(`Optimizing Keil (ARM Mode)')

_PRE_BEGIN
        PUSH     {r4,lr}
        LDRB     r2,[r1,#0]
        CMP      r2,#0
        POPEQ    {r4,pc}
        B        |L0.80|
|L0.20|
        LDRB     r12,[r3,#0]
        CMP      r12,#0
        BEQ      |L0.64|
        LDRB     r4,[r2,#0]
        CMP      r4,#0
        POPEQ    {r4,pc}
        CMP      r12,r4
        ADDEQ    r3,r3,#1
        ADDEQ    r2,r2,#1
        BEQ      |L0.20|
        B        |L0.76|
|L0.64|
        LDRB     r2,[r2,#0]
        CMP      r2,#0
        POPEQ    {r4,pc}
|L0.76|
        ADD      r0,r0,#1
|L0.80|
        LDRB     r2,[r0,#0]
        CMP      r2,#0
        MOVNE    r3,r0
        MOVNE    r2,r1
        MOVEQ    r0,#0
        BNE      |L0.20|
        POP      {r4,pc}
_PRE_END

_HL2(`Optimizing Keil (Thumb Mode)')

_PRE_BEGIN
        PUSH     {r4,r5,lr}
        LDRB     r2,[r1,#0]
        CMP      r2,#0
        BEQ      |L0.54|
        B        |L0.46|
|L0.10|
        MOVS     r3,r0
        MOVS     r2,r1
        B        |L0.20|
|L0.16|
        ADDS     r3,r3,#1
        ADDS     r2,r2,#1
|L0.20|
        LDRB     r4,[r3,#0]
        CMP      r4,#0
        BEQ      |L0.38|
        LDRB     r5,[r2,#0]
        CMP      r5,#0
        BEQ      |L0.54|
        CMP      r4,r5
        BEQ      |L0.16|
        B        |L0.44|
|L0.38|
        LDRB     r2,[r2,#0]
        CMP      r2,#0
        BEQ      |L0.54|
|L0.44|
        ADDS     r0,r0,#1
|L0.46|
        LDRB     r2,[r0,#0]
        CMP      r2,#0
        BNE      |L0.10|
        MOVS     r0,#0
|L0.54|
        POP      {r4,r5,pc}
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
func:
	ldrb	w6, [x1]
	mov	x2, x0
	cbz	w6, .L2
	ldrb	w2, [x0]
	cbz	w2, .L24
.L17:
	ldrb	w2, [x0]
	cbz	w2, .L5
	cmp	w6, w2
	mov	x5, x0
	mov	x2, x1
	beq	.L18
	b	.L5
.L4:
	ldrb	w4, [x2]
	cmp	w3, w4
	cbz	w4, .L8
	bne	.L8
.L18:
	ldrb	w3, [x5,1]!
	add	x2, x2, 1
	cbnz	w3, .L4
.L8:
	ldrb	w2, [x2]
	cbz	w2, .L27
.L5:
	ldrb	w2, [x0,1]!
	cbnz	w2, .L17
.L24:
	mov	x2, 0
.L2:
	mov	x0, x2
	ret
.L27:
	mov	x2, x0
	mov	x0, x2
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:
                lb      $v1, 0($a1)
                or      $at, $zero
                bnez    $v1, loc_18
                move    $v0, $a0

locret_10:                               # CODE XREF: f+50
                                         # f+78
                jr      $ra
                or      $at, $zero

loc_18:                                  # CODE XREF: f+8
                lb      $a0, 0($a0)
                or      $at, $zero
                beqz    $a0, locret_94
                move    $a2, $v0

loc_28:                                  # CODE XREF: f+8C
                lb      $a0, 0($a2)
                or      $at, $zero
                beqz    $a0, loc_80
                or      $at, $zero
                bne     $v1, $a0, loc_80
                move    $a3, $a1
                b       loc_60
                addiu   $a2, 1

loc_48:                                  # CODE XREF: f+68
                lb      $t1, 0($a3)
                or      $at, $zero
                beqz    $t1, locret_10
                or      $at, $zero
                bne     $t0, $t1, loc_80
                addiu   $a2, 1

loc_60:                                  # CODE XREF: f+40
                lb      $t0, 0($a2)
                or      $at, $zero
                bnez    $t0, loc_48
                addiu   $a3, 1
                lb      $a0, 0($a3)
                or      $at, $zero
                beqz    $a0, locret_10
                or      $at, $zero

loc_80:                                  # CODE XREF: f+30
                                         # f+38 ...
                addiu   $v0, 1
                lb      $a0, 0($v0)
                or      $at, $zero
                bnez    $a0, loc_28
                move    $a2, $v0

locret_94:                               # CODE XREF: f+20
                jr      $ra
                move    $v0, $zero
_PRE_END

_CHALLENGE_FOOTER()


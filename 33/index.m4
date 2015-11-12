m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #33.')

<p>What this code does?</p>

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
PUBLIC    _f
; Function compile flags: /Ogtpy
_TEXT    SEGMENT
_k0$ = -12            ; size = 4
_k3$ = -8             ; size = 4
_k2$ = -4             ; size = 4
_v$ = 8               ; size = 4
_k1$ = 12             ; size = 4
_k$ = 12              ; size = 4
_f    PROC
    sub    esp, 12    ; 0000000cH
    mov    ecx, DWORD PTR _v$[esp+8]
    mov    eax, DWORD PTR [ecx]
    mov    ecx, DWORD PTR [ecx+4]
    push   ebx
    push   esi
    mov    esi, DWORD PTR _k$[esp+16]
    push   edi
    mov    edi, DWORD PTR [esi]
    mov    DWORD PTR _k0$[esp+24], edi
    mov    edi, DWORD PTR [esi+4]
    mov    DWORD PTR _k1$[esp+20], edi
    mov    edi, DWORD PTR [esi+8]
    mov    esi, DWORD PTR [esi+12]
    xor    edx, edx
    mov    DWORD PTR _k2$[esp+24], edi
    mov    DWORD PTR _k3$[esp+24], esi
    lea    edi, DWORD PTR [edx+32]
$LL8@f:
    mov    esi, ecx
    shr    esi, 5
    add    esi, DWORD PTR _k1$[esp+20]
    mov    ebx, ecx
    shl    ebx, 4
    add    ebx, DWORD PTR _k0$[esp+24]
    sub    edx, 1640531527   ; 61c88647H
    xor    esi, ebx
    lea    ebx, DWORD PTR [edx+ecx]
    xor    esi, ebx
    add    eax, esi
    mov    esi, eax
    shr    esi, 5
    add    esi, DWORD PTR _k3$[esp+24]
    mov    ebx, eax
    shl    ebx, 4
    add    ebx, DWORD PTR _k2$[esp+24]
    xor    esi, ebx
    lea    ebx, DWORD PTR [edx+eax]
    xor    esi, ebx
    add    ecx, esi
    dec    edi
    jne    SHORT $LL8@f
    mov    edx, DWORD PTR _v$[esp+20]
    pop    edi
    pop    esi
    mov    DWORD PTR [edx], eax
    mov    DWORD PTR [edx+4], ecx
    pop    ebx
    add    esp, 12                    ; 0000000cH
    ret    0
_f    ENDP
_PRE_END

_HL2(`Optimizing Keil (ARM Mode)')

_PRE_BEGIN
        PUSH     {r4-r10,lr}
        ADD      r5,r1,#8
        LDM      r5,{r5,r7}
        LDR      r2,[r0,#4]
        LDR      r3,[r0,#0]
        LDR      r4,|L0.116|
        LDR      r6,[r1,#4]
        LDR      r8,[r1,#0]
        MOV      r12,#0
        MOV      r1,r12
|L0.40|
        ADD      r12,r12,r4
        ADD      r9,r8,r2,LSL #4
        ADD      r10,r2,r12
        EOR      r9,r9,r10
        ADD      r10,r6,r2,LSR #5
        EOR      r9,r9,r10
        ADD      r3,r3,r9
        ADD      r9,r5,r3,LSL #4
        ADD      r10,r3,r12
        EOR      r9,r9,r10
        ADD      r10,r7,r3,LSR #5
        EOR      r9,r9,r10
        ADD      r1,r1,#1
        CMP      r1,#0x20
        ADD      r2,r2,r9
        STRCS    r2,[r0,#4]
        STRCS    r3,[r0,#0]
        BCC      |L0.40|
        POP      {r4-r10,pc}

|L0.116|
        DCD      0x9e3779b9
_PRE_END

_HL2(`Optimizing Keil (Thumb Mode)')

_PRE_BEGIN
        PUSH     {r1-r7,lr}
        LDR      r5,|L0.84|
        LDR      r3,[r0,#0]
        LDR      r2,[r0,#4]
        STR      r5,[sp,#8]
        MOVS     r6,r1
        LDM      r6,{r6,r7}
        LDR      r5,[r1,#8]
        STR      r6,[sp,#4]
        LDR      r6,[r1,#0xc]
        MOVS     r4,#0
        MOVS     r1,r4
        MOV      lr,r5
        MOV      r12,r6
        STR      r7,[sp,#0]
|L0.30|
        LDR      r5,[sp,#8]
        LSLS     r6,r2,#4
        ADDS     r4,r4,r5
        LDR      r5,[sp,#4]
        LSRS     r7,r2,#5
        ADDS     r5,r6,r5
        ADDS     r6,r2,r4
        EORS     r5,r5,r6
        LDR      r6,[sp,#0]
        ADDS     r1,r1,#1
        ADDS     r6,r7,r6
        EORS     r5,r5,r6
        ADDS     r3,r5,r3
        LSLS     r5,r3,#4
        ADDS     r6,r3,r4
        ADD      r5,r5,lr
        EORS     r5,r5,r6
        LSRS     r6,r3,#5
        ADD      r6,r6,r12
        EORS     r5,r5,r6
        ADDS     r2,r5,r2
        CMP      r1,#0x20
        BCC      |L0.30|
        STR      r3,[r0,#0]
        STR      r2,[r0,#4]
        POP      {r1-r7,pc}

|L0.84|
        DCD      0x9e3779b9
_PRE_END

_HL2(`Optimizing GCC 4.9.1 (ARM64)')

_PRE_BEGIN
f:
	ldr	w3, [x0]
	mov	w4, 0
	ldr	w2, [x0,4]
	ldr	w10, [x1]
	ldr	w9, [x1,4]
	ldr	w8, [x1,8]
	ldr	w7, [x1,12]
.L2:
	mov	w5, 31161
	add	w6, w10, w2, lsl 4
	movk	w5, 0x9e37, lsl 16
	add	w1, w9, w2, lsr 5
	add	w4, w4, w5
	eor	w1, w6, w1
	add	w5, w2, w4
	mov	w6, 14112
	eor	w1, w1, w5
	movk	w6, 0xc6ef, lsl 16
	add	w3, w3, w1
	cmp	w4, w6
	add	w5, w3, w4
	add	w6, w8, w3, lsl 4
	add	w1, w7, w3, lsr 5
	eor	w1, w6, w1
	eor	w1, w1, w5
	add	w2, w2, w1
	bne	.L2
	str	w3, [x0]
	str	w2, [x0,4]
	ret
_PRE_END

_HL2(`Optimizing GCC 4.4.5 (MIPS)')

_PRE_BEGIN
f:
                lui     $t2, 0x9E37
                lui     $t1, 0xC6EF
                lw      $v0, 0($a0)
                lw      $v1, 4($a0)
                lw      $t6, 0xC($a1)
                lw      $t5, 0($a1)
                lw      $t4, 4($a1)
                lw      $t3, 8($a1)
                li      $t2, 0x9E3779B9
                li      $t1, 0xC6EF3720
                move    $a1, $zero

loc_2C:                                  # CODE XREF: f+6C
                addu    $a1, $t2
                sll     $a2, $v1, 4
                addu    $t0, $a1, $v1
                srl     $a3, $v1, 5
                addu    $a2, $t5
                addu    $a3, $t4
                xor     $a2, $t0, $a2
                xor     $a2, $a3
                addu    $v0, $a2
                sll     $a3, $v0, 4
                srl     $a2, $v0, 5
                addu    $a3, $t3
                addu    $a2, $t6
                xor     $a2, $a3, $a2
                addu    $a3, $v0, $a1
                xor     $a2, $a3
                bne     $a1, $t1, loc_2C
                addu    $v1, $a2
                sw      $v1, 4($a0)
                jr      $ra
                sw      $v0, 0($a0)
_PRE_END

_CHALLENGE_FOOTER()


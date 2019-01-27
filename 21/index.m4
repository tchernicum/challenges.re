m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #21.')
_TAGS(`21')

<p>
This is easy.
What does the following code do?
</p>

_HL3(`Optimizing GCC 4.8.2 for x64')

_PRE_BEGIN
f1:
        push    r12
        push    rbp
        mov     rbp, rdi
        push    rbx
        mov     rbx, rsi
        call    strlen
        mov     rdi, rbx
        mov     r12, rax
        call    strlen
        sub     r12, rax
        mov     rsi, rbx
        lea     rdi, [rbp+0+r12]
        call    strcmp
        pop     rbx
        test    eax, eax
        pop     rbp
        sete    al
        pop     r12
        ret
_PRE_END

_HL3(`Optimizing Keil 5.05 (ARM mode)')

_PRE_BEGIN
||f1|| PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r1
        MOV      r5,r0
        BL       strlen
        ADD      r5,r5,r0
        MOV      r0,r4
        BL       strlen
        SUB      r0,r5,r0
        MOV      r1,r4
        BL       strcmp
        CMP      r0,#0
        MOVEQ    r0,#1
        MOVNE    r0,#0
        POP      {r4-r6,pc}
        ENDP
_PRE_END

_HL3(`Optimizing Keil 5.05 (Thumb mode)')

_PRE_BEGIN
||f1|| PROC
        PUSH     {r4-r6,lr}
        MOVS     r4,r1
        MOVS     r5,r0
        BL       strlen
        ADDS     r5,r0,r5
        MOVS     r0,r4
        BL       strlen
        SUBS     r0,r5,r0
        MOVS     r1,r4
        BL       strcmp
        CMP      r0,#0
        BEQ      |L0.34|
        MOVS     r0,#0
        POP      {r4-r6,pc}
_PRE_END

_HL3(`Optimizing GCC 4.9.3 for ARM64')

_PRE_BEGIN
f1:
        stp     x29, x30, [sp, -48]!
        add     x29, sp, 0
        stp     x19, x20, [sp, 16]
        mov     x20, x0
        str     x1, [x29, 40]
        bl      strlen
        ldr     x1, [x29, 40]
        mov     x19, x0
        mov     x0, x1
        bl      strlen
        sub     x0, x19, x0
        ldr     x1, [x29, 40]
        add     x0, x20, x0
        bl      strcmp
        cmp     w0, wzr
        cset    w0, eq
        ldp     x19, x20, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret
_PRE_END

_HL3(`Optimizing GCC 4.4.5 for MIPS')

_PRE_BEGIN
f1:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-48
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,44($sp)
        sw      $17,40($sp)
        sw      $16,36($sp)
        lw      $25,%call16(strlen)($28)
        sw      $5,24($sp)
        jalr    $25
        move    $16,$4
        lw      $28,16($sp)
        lw      $5,24($sp)
        lw      $25,%call16(strlen)($28)
        move    $4,$5
        jalr    $25
        move    $17,$2
        lw      $28,16($sp)
        subu    $2,$17,$2
        lw      $25,%call16(strcmp)($28)
        lw      $5,24($sp)
        jalr    $25
        addu    $4,$16,$2
        lw      $31,44($sp)
        sltu    $2,$2,1
        lw      $17,40($sp)
        lw      $16,36($sp)
        j       $31
        addiu   $sp,$sp,48
_PRE_END

_CHALLENGE_FOOTER()


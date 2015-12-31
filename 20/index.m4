m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #20.')

<p>
This is easy.
What does the following code do?
</p>

_HL3(`Optimizing GCC 4.8.2 for x64')

_PRE_BEGIN
f4:
.LFB40:
        sub     rsp, 8
        call    rand
        cvtsi2ss        xmm0, eax
        mulss   xmm0, DWORD PTR .LC0[rip]
        add     rsp, 8
        ret
.LC0:
        .long   805306368
_PRE_END

<p>As you may notice, it uses SSEx instructions for floating point number processing.
The code below was compiled by the same version of GCC, but using <b>-march=pentium3 -m32</b> switches, that forces it to compile code for 80x87 FPU:</p>

_PRE_BEGIN
f4:
        sub     esp, 28
        call    rand
        mov     DWORD PTR [esp+12], eax
        fild    DWORD PTR [esp+12]
        fmul    DWORD PTR .LC0
        add     esp, 28
        ret
.LC0:
        .long   805306368
_PRE_END

_HL3(`Optimizing Keil 5.05 (ARM mode)')

_PRE_BEGIN
||f4|| PROC
        PUSH     {r4,lr}
        BL       rand
        BL       __aeabi_i2f
        POP      {r4,lr}
        MVN      r1,#0x1e
        B        __ARM_scalbnf
        ENDP
_PRE_END

_HL3(`Optimizing Keil 5.05 (Thumb mode)')

_PRE_BEGIN
||f4|| PROC
        PUSH     {r4,lr}
        BL       rand
        BL       __aeabi_i2f
        MOVS     r1,#0x1e
        MVNS     r1,r1
        BL       __ARM_scalbnf
        POP      {r4,pc}
        ENDP
_PRE_END

_HL3(`Optimizing GCC 4.9.3 for ARM64')

_PRE_BEGIN
f4:
        stp     x29, x30, [sp, -16]!
        add     x29, sp, 0
        bl      rand
        scvtf   s1, w0
        ldr     s0, .LC0
        ldp     x29, x30, [sp], 16
        fmul    s0, s1, s0
        ret
.LC0:
        .word   805306368
_PRE_END

_HL3(`Optimizing GCC 4.4.5 for MIPS')

_PRE_BEGIN
f4:
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-32
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,28($sp)
        lw      $25,%call16(rand)($28)
        nop
        jalr    $25
        nop

        mtc1    $2,$f0
        lui     $2,%hi($LC0)
        cvt.s.w $f2,$f0
        lw      $31,28($sp)
        lwc1    $f0,%lo($LC0)($2)
        addiu   $sp,$sp,32
        j       $31
        mul.s   $f0,$f2,$f0
$LC0:
        .word   805306368
_PRE_END

_CHALLENGE_FOOTER()


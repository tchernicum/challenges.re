m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #2.')
_TAGS(`2')

<p>What does this code do?</p>

<p>Optimizing GCC 4.8.2 -m32:</p>

_PRE_BEGIN
&lt;f>:
   0:          mov    eax,DWORD PTR [esp+0x4]
   4:          bswap  eax
   6:          mov    edx,eax
   8:          and    eax,0xf0f0f0f
   d:          and    edx,0xf0f0f0f0
  13:          shr    edx,0x4
  16:          shl    eax,0x4
  19:          or     eax,edx
  1b:          mov    edx,eax
  1d:          and    eax,0x33333333
  22:          and    edx,0xcccccccc
  28:          shr    edx,0x2
  2b:          shl    eax,0x2
  2e:          or     eax,edx
  30:          mov    edx,eax
  32:          and    eax,0x55555555
  37:          and    edx,0xaaaaaaaa
  3d:          add    eax,eax
  3f:          shr    edx,1
  41:          or     eax,edx
  43:          ret
_PRE_END

<p>Optimizing GCC 4.9.3 (Linaro) for ARM64:</p>

_PRE_BEGIN
&lt;f>:
   0:           rev     w0, w0
   4:           and     w1, w0, #0xf0f0f0f
   8:           and     w0, w0, #0xf0f0f0f0
   c:           lsl     w1, w1, #4
  10:           orr     w0, w1, w0, lsr #4
  14:           and     w1, w0, #0x33333333
  18:           and     w0, w0, #0xcccccccc
  1c:           lsl     w1, w1, #2
  20:           orr     w1, w1, w0, lsr #2
  24:           and     w0, w1, #0xaaaaaaaa
  28:           and     w1, w1, #0x55555555
  2c:           add     w1, w1, w1
  30:           orr     w0, w1, w0, lsr #1
  34:           ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f       PROC
        ROR      r0,r0,#16
        MVN      r1,#0xff00
        AND      r1,r1,r0,LSR #8
        BIC      r0,r0,#0xff00
        ORR      r0,r1,r0,LSL #8
        LDR      r1,|L0.124|
        AND      r2,r1,r0,LSR #4
        AND      r0,r0,r1
        LDR      r1,|L0.128|
        ORR      r0,r2,r0,LSL #4
        AND      r2,r1,r0,LSR #2
        AND      r0,r0,r1
        ORR      r0,r2,r0,LSL #2
        EOR      r1,r1,r1,LSL #1
        AND      r2,r1,r0,LSR #1
        AND      r0,r0,r1
        ORR      r0,r2,r0,LSL #1
        BX       lr
        ENDP
|L0.124|
        DCD      0xff0f0f0f
|L0.128|
        DCD      0x33333333
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f       PROC
        MOVS     r1,#0x10
        RORS     r0,r0,r1
        LDR      r2,|L0.88|
        LSRS     r1,r0,#8
        ANDS     r0,r0,r2
        ANDS     r1,r1,r2
        LSLS     r0,r0,#8
        LDR      r2,|L0.92|
        ORRS     r1,r1,r0
        LSRS     r0,r1,#4
        ANDS     r1,r1,r2
        ANDS     r0,r0,r2
        LSLS     r1,r1,#4
        LDR      r2,|L0.96|
        ORRS     r0,r0,r1
        LSRS     r1,r0,#2
        ANDS     r0,r0,r2
        ANDS     r1,r1,r2
        LSLS     r0,r0,#2
        LDR      r2,|L0.100|
        ORRS     r1,r1,r0
        LSRS     r0,r1,#1
        ANDS     r1,r1,r2
        ANDS     r0,r0,r2
        LSLS     r1,r1,#1
        ORRS     r0,r0,r1
        BX       lr
        ENDP
|L0.88|
        DCD      0x00ff00ff
|L0.92|
        DCD      0x0f0f0f0f
|L0.96|
        DCD      0x33333333
|L0.100|
        DCD      0x55555555
_PRE_END

<p>Optimizing GCC 4.4.5 MIPS:</p>

_PRE_BEGIN
f:
        sll     $2,$4,16
        srl     $4,$4,16
        or      $2,$2,$4
        li      $3,-16777216                    # 0xffffffffff000000
        li      $4,16711680                     # 0xff0000
        ori     $3,$3,0xff00
        ori     $4,$4,0xff
        and     $4,$2,$4
        and     $2,$2,$3
        srl     $2,$2,8
        sll     $4,$4,8
        or      $4,$4,$2
        li      $3,-252706816                   # 0xfffffffff0f00000
        li      $2,252641280                    # 0xf0f0000
        ori     $3,$3,0xf0f0
        ori     $2,$2,0xf0f
        and     $2,$4,$2
        and     $4,$4,$3
        srl     $4,$4,4
        sll     $2,$2,4
        or      $2,$2,$4
        li      $3,858980352                    # 0x33330000
        li      $4,-859045888                   # 0xffffffffcccc0000
        ori     $4,$4,0xcccc
        ori     $3,$3,0x3333
        and     $3,$2,$3
        and     $2,$2,$4
        srl     $2,$2,2
        sll     $3,$3,2
        or      $3,$3,$2
        li      $4,-1431699456                  # 0xffffffffaaaa0000
        li      $2,1431633920                   # 0x55550000
        ori     $4,$4,0xaaaa
        ori     $2,$2,0x5555
        and     $2,$3,$2
        and     $3,$3,$4
        srl     $3,$3,1
        sll     $2,$2,1
        j       $31
        or      $2,$2,$3
_PRE_END

_CHALLENGE_FOOTER()

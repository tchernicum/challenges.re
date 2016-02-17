f PROC
        PUSH     {r4-r9,lr}
        CMP      r2,r3
        MOV      r12,r1
        ADD      r5,r1,r3
        ADD      r7,r0,r2
        MOV      r4,#0x80
        MOVCS    r1,r3
        BCS      |L0.52|
        B        |L0.184|
|L0.36|
        LDRB     r4,[r0],#1
        ADD      r2,r12,#1
        STRB     r4,[r12,#0]
        MOV      r12,r2
|L0.52|
        SUBS     r1,r1,#1
        MOVCC    r0,r3
        BCS      |L0.36|
        POP      {r4-r9,pc}
|L0.68|
        LSL      r4,r4,#1
        CMP      r4,#0x100
        LDRBEQ   r6,[r0],#1
        MOVEQ    r4,#1
        TST      r6,r4
        BEQ      |L0.168|
        LDRB     r2,[r0],#1
        LDRB     r8,[r0],#1
        MOV      r3,#3
        ADD      r3,r3,r2,LSR #2
        ORR      r2,r8,r2,LSL #8
        BIC      r2,r2,#0xfc00
        SUB      r2,r12,r2
        CMP      r1,r2
        BLS      |L0.148|
        B        |L0.196|
|L0.132|
        LDRB     r8,[r2],#1
        ADD      r9,r12,#1
        STRB     r8,[r12,#0]
        MOV      r12,r9
|L0.148|
        SUBS     r3,r3,#1
        BMI      |L0.184|
        CMP      r12,r5
        BCS      |L0.184|
        B        |L0.132|
|L0.168|
        LDRB     r3,[r0],#1
        ADD      r2,r12,#1
        STRB     r3,[r12,#0]
        MOV      r12,r2
|L0.184|
        CMP      r0,r7
        CMPCC    r12,r5
        BCC      |L0.68|
|L0.196|
        SUB      r0,r12,r1
        POP      {r4-r9,pc}
        ENDP

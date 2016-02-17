f PROC
        PUSH     {r3-r7,lr}
        ADDS     r5,r0,r2
        MOVS     r6,#0x80
        MOV      r12,r5
        MOVS     r4,r1
        ADDS     r5,r1,r3
        CMP      r2,r3
        MOV      lr,r6
        BCC      |L0.128|
        MOVS     r1,r3
        B        |L0.32|
|L0.22|
        LDRB     r2,[r0,#0]
        ADDS     r5,r4,#1
        STRB     r2,[r4,#0]
        MOVS     r4,r5
        ADDS     r0,r0,#1
|L0.32|
        SUBS     r1,r1,#1
        BCS      |L0.22|
        MOVS     r0,r3
        POP      {r3-r7,pc}
|L0.40|
        MOV      r2,lr
        LSLS     r2,r2,#1
        MOVS     r3,#0xff
        ADDS     r3,#1
        CMP      r2,r3
        MOV      lr,r2
        BEQ      |L0.58|
        LDR      r2,[sp,#0]
        B        |L0.68|
|L0.58|
        MOVS     r2,#1
        MOV      lr,r2
        LDRB     r2,[r0,#0]
        ADDS     r0,r0,#1
        STR      r2,[sp,#0]
|L0.68|
        MOV      r3,lr
        TST      r2,r3
        LDRB     r2,[r0,#0]
        BEQ      |L0.120|
        LDRB     r7,[r0,#1]
        LSLS     r6,r2,#8
        LSRS     r3,r2,#2
        ORRS     r6,r6,r7
        LSLS     r2,r6,#22
        LSRS     r2,r2,#22
        SUBS     r2,r4,r2
        ADDS     r0,r0,#2
        ADDS     r3,r3,#3
        CMP      r2,r1
        BCS      |L0.110|
        B        |L0.136|
|L0.100|
        LDRB     r6,[r2,#0]
        ADDS     r7,r4,#1
        STRB     r6,[r4,#0]
        MOVS     r4,r7
        ADDS     r2,r2,#1
|L0.110|
        SUBS     r3,r3,#1
        BMI      |L0.128|
        CMP      r4,r5
        BCS      |L0.128|
        B        |L0.100|
|L0.120|
        ADDS     r3,r4,#1
        STRB     r2,[r4,#0]
        MOVS     r4,r3
        ADDS     r0,r0,#1
|L0.128|
        CMP      r0,r12
        BCS      |L0.136|
        CMP      r4,r5
        BCC      |L0.40|
|L0.136|
        SUBS     r0,r4,r1
        POP      {r3-r7,pc}
        ENDP

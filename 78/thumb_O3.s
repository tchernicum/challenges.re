||f1|| PROC
        PUSH     {r4,lr}
        LDRB     r3,[r0,#0]
        CMP      r3,#0
        BEQ      |L0.58|
        LDRB     r2,[r0,#1]
        CMP      r2,#0x2a
        BEQ      |L0.20|
        CMP      r3,#0x24
        BEQ      |L0.32|
        B        |L0.36|
|L0.20|
        MOVS     r2,r1
        ADDS     r1,r0,#2
        MOVS     r0,r3
        BL       ||f2||
        POP      {r4,pc}
|L0.32|
        CMP      r2,#0
        BEQ      |L0.52|
|L0.36|
        LDRB     r2,[r1,#0]
        CMP      r2,#0
        BEQ      |L0.58|
        CMP      r3,#0x2e
        BEQ      |L0.66|
        CMP      r3,r2
        BEQ      |L0.66|
        B        |L0.58|
|L0.52|
        LDRB     r0,[r1,#0]
        CMP      r0,#0
        BEQ      |L0.62|
|L0.58|
        MOVS     r0,#0
        POP      {r4,pc}
|L0.62|
        MOVS     r0,#1
        POP      {r4,pc}
|L0.66|
        ADDS     r0,r0,#1
        ADDS     r1,r1,#1
        BL       ||f1||
        POP      {r4,pc}
        ENDP

||f2|| PROC
        PUSH     {r4-r6,lr}
        MOVS     r4,r2
        MOVS     r6,r1
        MOVS     r5,r0
|L0.84|
        MOVS     r1,r4
        MOVS     r0,r6
        BL       ||f1||
        CMP      r0,#0
        BEQ      |L0.100|
        MOVS     r0,#1
        POP      {r4-r6,pc}
|L0.100|
        LDRB     r0,[r4,#0]
        CMP      r0,#0
        BEQ      |L0.116|
        ADDS     r4,r4,#1
        CMP      r0,r5
        BEQ      |L0.84|
        CMP      r5,#0x2e
        BEQ      |L0.84|
|L0.116|
        MOVS     r0,#0
        POP      {r4-r6,pc}
        ENDP

f_main PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        LDRB     r0,[r0,#0]
        MOVS     r4,r1
        CMP      r0,#0x5e
        BNE      |L0.140|
        ADDS     r0,r5,#1
        BL       ||f1||
        POP      {r4-r6,pc}
|L0.140|
        MOVS     r1,r4
        MOVS     r0,r5
        BL       ||f1||
        CMP      r0,#0
        BEQ      |L0.156|
        MOVS     r0,#1
        POP      {r4-r6,pc}
|L0.156|
        LDRB     r0,[r4,#0]
        ADDS     r4,r4,#1
        CMP      r0,#0
        BNE      |L0.140|
        POP      {r4-r6,pc}
        ENDP

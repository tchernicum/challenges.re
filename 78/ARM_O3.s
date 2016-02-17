||f1|| PROC
        MOV      r3,r0
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BXEQ     lr
        LDRB     r2,[r3,#1]
        CMP      r2,#0x2a
        BEQ      |L0.68|
        CMP      r0,#0x24
        CMPEQ    r2,#0
        BEQ      |L0.80|
        LDRB     r2,[r1,#0]
        CMP      r2,#0
        BEQ      |L0.96|
        CMP      r0,#0x2e
        CMPNE    r0,r2
        BEQ      |L0.104|
        B        |L0.96|
|L0.68|
        MOV      r2,r1
        ADD      r1,r3,#2
        B        ||f2||
|L0.80|
        LDRB     r0,[r1,#0]
        CMP      r0,#0
        MOVEQ    r0,#1
        BXEQ     lr
|L0.96|
        MOV      r0,#0
        BX       lr
|L0.104|
        ADD      r0,r3,#1
        ADD      r1,r1,#1
        B        ||f1||
        ENDP

||f2|| PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r2
        MOV      r6,r1
        MOV      r5,r0
|L0.132|
        MOV      r1,r4
        MOV      r0,r6
        BL       ||f1||
        CMP      r0,#0
        MOVNE    r0,#1
        POPNE    {r4-r6,pc}
        LDRB     r0,[r4,#0]
        CMP      r0,#0
        BEQ      |L0.184|
        CMP      r0,r5
        CMPNE    r5,#0x2e
        ADD      r4,r4,#1
        BEQ      |L0.132|
|L0.184|
        MOV      r0,#0
        POP      {r4-r6,pc}
        ENDP

f_main PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        LDRB     r0,[r0,#0]
        MOV      r4,r1
        CMP      r0,#0x5e
        BNE      |L0.228|
        ADD      r0,r5,#1
        POP      {r4-r6,lr}
        B        ||f1||
|L0.228|
        MOV      r1,r4
        MOV      r0,r5
        BL       ||f1||
        CMP      r0,#0
        MOVNE    r0,#1
        POPNE    {r4-r6,pc}
        LDRB     r0,[r4],#1
        CMP      r0,#0
        BNE      |L0.228|
        POP      {r4-r6,pc}
        ENDP

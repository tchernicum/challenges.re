||f1|| PROC
        PUSH     {r4,r5,lr}
        MOVS     r1,r0
        MOV      r3,#0
        MOV      r12,#0x8000
        MOV      r2,r3
        MOVEQ    r0,#0x80000000
        POPEQ    {r4,r5,pc}
|L0.28|
        CMP      r0,#0x10000
        LSLCC    r0,r0,#1
        SUBCC    r3,r3,#0x10000
        BCC      |L0.28|
|L0.44|
        CMP      r0,#0x20000
        LSRCS    r0,r0,#1
        ADDCS    r3,r3,#0x10000
        MOVCC    r0,#0
        BCS      |L0.44|
|L0.64|
        UMULL    r4,r5,r1,r1
        MLA      r5,r2,r1,r5
        MLA      r2,r1,r2,r5
        LSR      r4,r4,#16
        ORR      r1,r4,r2,LSL #16
        SUBS     r4,r1,#0x20000
        LSR      r2,r2,#16
        SBCS     r4,r2,#0
        BCC      |L0.112|
        LSRS     r2,r2,#1
        RRX      r1,r1
        ADD      r3,r3,r12
|L0.112|
        ADD      r0,r0,#1
        CMP      r0,#0x10
        ASR      r12,r12,#1
        MOVCS    r0,r3
        BCC      |L0.64|
        POP      {r4,r5,pc}
        ENDP

||f2|| PROC
        SMULL    r12,r1,r0,r1
        PUSH     {r4,lr}
        MOV      r2,#0x10000
        MOV      r3,#0
        MOV      r0,r12
        BL       __aeabi_ldivmod
        POP      {r4,pc}
        ENDP

||f3|| PROC
        ASR      r2,r0,#31
        LSL      r2,r2,#16
        ORR      r12,r2,r0,LSR #16
        MOV      r2,r1
        ASR      r3,r1,#31
        PUSH     {r4,lr}
        LSL      r0,r0,#16
        MOV      r1,r12
        BL       __aeabi_ldivmod
        POP      {r4,pc}
        ENDP

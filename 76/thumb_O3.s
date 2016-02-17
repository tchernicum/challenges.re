||f1|| PROC
        PUSH     {r3-r7,lr}
        MOVS     r6,#1
        LSLS     r6,r6,#15
        MOVS     r4,#0
        MOVS     r2,r0
        MOVS     r1,r4
        LSLS     r3,r6,#1
        CMP      r0,#0
        BNE      |L0.26|
        LSLS     r0,r3,#15
        POP      {r3-r7,pc}
|L0.22|
        LSLS     r2,r2,#1
        SUBS     r4,r4,r3
|L0.26|
        CMP      r2,r3
        BCC      |L0.22|
        MOVS     r5,#1
        LSLS     r5,r5,#17
|L0.34|
        CMP      r2,r5
        BCC      |L0.44|
        LSRS     r2,r2,#1
        ADDS     r4,r4,r3
        B        |L0.34|
|L0.44|
        MOVS     r5,#0
|L0.46|
        MOVS     r2,r0
        MOVS     r3,r1
        BL       __aeabi_lmul
        LSLS     r2,r1,#16
        LSRS     r0,r0,#16
        ORRS     r0,r0,r2
        LSRS     r1,r1,#16
        MOVS     r3,#1
        LSLS     r3,r3,#17
        MOVS     r2,r1
        MOVS     r7,#0
        SUBS     r3,r0,r3
        SBCS     r2,r2,r7
        BCC      |L0.86|
        LSLS     r2,r1,#31
        LSRS     r0,r0,#1
        ORRS     r0,r0,r2
        LSRS     r1,r1,#1
        ADDS     r4,r4,r6
|L0.86|
        ASRS     r6,r6,#1
        ADDS     r5,r5,#1
        CMP      r5,#0x10
        BCC      |L0.46|
        MOVS     r0,r4
        POP      {r3-r7,pc}
        ENDP

||f2|| PROC
        PUSH     {r4,lr}
        BL       __ARM_common_ll_mulss_thumb
        MOVS     r2,#1
        LSLS     r2,r2,#16
        MOVS     r3,#0
        BL       __aeabi_ldivmod
        POP      {r4,pc}
        ENDP

||f3|| PROC
        MOVS     r2,r1
        ASRS     r1,r0,#31
        LSRS     r3,r0,#16
        LSLS     r1,r1,#16
        ORRS     r1,r1,r3
        PUSH     {r4,lr}
        LSLS     r0,r0,#16
        ASRS     r3,r2,#31
        BL       __aeabi_ldivmod
        POP      {r4,pc}
        ENDP

__ARM_common_ll_mulss_thumb PROC
        BX       pc
        DCW      0x0000
        ARM
        MOV      r2,r1
        SMULL    r0,r1,r2,r0
        BX       lr
        ENDP

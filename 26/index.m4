m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #26.')
_TAGS(`26')

<p>
What does the following code do?
</p>

_HL2(`csc .NET compiler (MSVS 2010), ildasm output')

_PRE_BEGIN
  .method public hidebysig static uint8  f(uint8 a) cil managed
  {
    // Code size       36 (0x24)
    .maxstack  2
    .locals init (uint8 V_0)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  conv.u8
    IL_0003:  ldc.i8     0x202020202
    IL_000c:  mul
    IL_000d:  ldc.i8     0x10884422010
    IL_0016:  and
    IL_0017:  ldc.i4     0x3ff
    IL_001c:  conv.i8
    IL_001d:  rem
    IL_001e:  conv.u1
    IL_001f:  stloc.0
    IL_0020:  br.s       IL_0022

    IL_0022:  ldloc.0
    IL_0023:  ret
  } // end of method e25::f
_PRE_END

_HL2(`Java 1.8 compiler:')

_PRE_BEGIN
  public static byte f(byte);
    descriptor: (B)B
    flags: ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=1, args_size=1
         0: iload_0
         1: i2l
         2: ldc2_w        #2                  // long 8623620610l
         5: lmul
         6: ldc2_w        #4                  // long 1136090292240l
         9: land
        10: ldc2_w        #6                  // long 1023l
        13: lrem
        14: l2i
        15: i2b
        16: ireturn
_PRE_END

_CHALLENGE_FOOTER()


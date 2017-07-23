m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #14.')
_TAGS(`14')

<p>Now that's easy. What does this code do?</p>

<p>Optimizing csc .NET compiler from MSVS 2015 (/o switch), ildasm output:</p>

_PRE_BEGIN
  .method public hidebysig static bool  f(char a) cil managed
  {
    // Code size       26 (0x1a)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.s   97
    IL_0003:  blt.s      IL_000c

    IL_0005:  ldarg.0
    IL_0006:  ldc.i4.s   122
    IL_0008:  bgt.s      IL_000c

    IL_000a:  ldc.i4.1
    IL_000b:  ret

    IL_000c:  ldarg.0
    IL_000d:  ldc.i4.s   65
    IL_000f:  blt.s      IL_0018

    IL_0011:  ldarg.0
    IL_0012:  ldc.i4.s   90
    IL_0014:  bgt.s      IL_0018

    IL_0016:  ldc.i4.1
    IL_0017:  ret

    IL_0018:  ldc.i4.0
    IL_0019:  ret
  } // end of method some_class::f

_PRE_END

<p>Java 1.8 compiler:</p>

_PRE_BEGIN
  public boolean f(char);
    descriptor: (C)Z
    flags: ACC_PUBLIC
    Code:
      stack=2, locals=2, args_size=2
         0: iload_1
         1: bipush        97
         3: if_icmplt     14
         6: iload_1
         7: bipush        122
         9: if_icmpgt     14
        12: iconst_1
        13: ireturn
        14: iload_1
        15: bipush        65
        17: if_icmplt     28
        20: iload_1
        21: bipush        90
        23: if_icmpgt     28
        26: iconst_1
        27: ireturn
        28: iconst_0
        29: ireturn
_PRE_END

_CHALLENGE_FOOTER()


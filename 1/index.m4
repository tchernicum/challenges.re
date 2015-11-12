m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #1.')

<p>What this code does? The function has 4 arguments, it is compiled by GCC for Linux x64 ABI (i.e., arguments are passed in registers).</p>

_PRE_BEGIN
&lt;f>:
   0:                   mov    r8,rdi
   3:                   push   rbx
   4:                   mov    rdi,rsi
   7:                   mov    rbx,rdx
   a:                   mov    rsi,r8
   d:                   xor    rdx,rdx

begin:
  10:                   lods   rax,QWORD PTR ds:[rsi]
  12:                   div    rbx
  15:                   stos   QWORD PTR es:[rdi],rax
  17:                   loop   begin
  19:                   pop    rbx
  1a:                   mov    rax,rdx
  1d:                   ret
_PRE_END

_CHALLENGE_FOOTER()


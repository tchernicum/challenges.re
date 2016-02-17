m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #76.')

<p>
These 3 functions operates on <a href="https://en.wikipedia.org/wiki/Fixed-point_arithmetic">fixed-point numbers</a>.
Try to find out, what does these functions do, and <a href="https://en.wikipedia.org/wiki/Q_%28number_format%29">precision of numbers</a>.
</p>

<ul>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/x64_clang.s">Optimizing Clang/LLVM 3.4</a>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/x64_MSVC2013_Ox.asm">Optimizing MSVC 2013 x64</a>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/ARM_O3.s">Optimizing Keil 6 (ARM Mode)</a>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/thumb_O3.s">Optimizing Keil 6 (Thumb Mode)</a>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/ARM64.s">Optimizing GCC 4.9 (ARM64)</a>
<li><a href="https://github.com/dennis714/challenges.re/blob/master/76/MIPS.s">Optimizing GCC 4.4.5 (MIPS)</a>
</ul>

<p>Code length varies significantly from compiler to compiler. This is optimizations, but which?</p>

_CHALLENGE_FOOTER()


m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #88.')

<p>This is my <a href="https://github.com/dennis714/progcalc">programmer's calculator</a>, but two undocumented functions has been added.</p>

<p>1) Named secret(), takes two arguments. What does it do? Hint: running it with various arguments can give a hint.</p>

_PRE_BEGIN
Programmer's calculator <dennis(a)yurichev.com> https://github.com/dennis714/progcalc (Jul 27 2017)
Modified version for https://challenges.re/88/
[1] secret(1,2)
[1] (unsigned) 4 0x4 0b100
[2] secret(1,6)
[2] (unsigned) 8 0x8 0b1000
[3] secret(2,4)
[3] (unsigned) 11 0xb 0b1011
[4] secret(3,3)
[4] (unsigned) 61 0x3d 0b111101 ASCII: '='
_PRE_END

<p>2) No name known. Try to find it.</p>

<p>Downloads: <a href="https://challenges.re/88/challenge88.rar">Win64</a>,
<a href="https://challenges.re/88/challenge88.tar">Linux64</a>.</p>

_CHALLENGE_FOOTER()


m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #75.')

<p>What does this x86 code do?</p>

_PRE_BEGIN
eax=input value 1
edx=input value 2

sub     eax, edx
cdq
xor     eax, edx
sub     eax, edx

eax=result
_PRE_END

_CHALLENGE_FOOTER()


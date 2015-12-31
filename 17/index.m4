m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #17.')

<p>
This is a quite esoteric piece of code, but nevertheless, the task it does is very mundane and well-known to anyone.
The function has 4 64-bit arguments and returns a 64-bit one.
What does it do?
</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
f:
        sub     edx, edi
        mov     r8d, ecx
        mov     ecx, 63
        mov     eax, edx
        sub     r8d, esi
        sar     eax, cl
        and     eax, edx
        mov     edx, r8d
        sar     edx, cl
        add     edi, eax
        and     edx, r8d
        add     esi, edx
        sub     esi, edi
        mov     eax, esi
        sar     eax, cl
        and     eax, esi
        add     eax, edi
        ret
_PRE_END

_CHALLENGE_FOOTER()


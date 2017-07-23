m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #87.')
_TAGS(`87')

<p>This is one of the hardest ever exercises at this website.
What does this code do?</p>

<p>Hint: the function has been copypasted from the guts of GCC, but in fact, it is present almost in all modern compilers, though, in different forms, but calculating the same value(s).
Its function is highly important.</p>

<p>Second hint: <i>f(f(x))=x</i>.</p>

<p>Optimizing GCC 5.4 x86</p>

_PRE_BEGIN
f:
        mov     edx, 31
        mov     eax, 1
.L2:
        imul    eax, edi
        imul    edi, edi
        sub     edx, 1
        jne     .L2
        ret
_PRE_END

_CHALLENGE_FOOTER()


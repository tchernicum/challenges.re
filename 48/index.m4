m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #48.')
_TAGS(`48')

<!--\RU{Что делает эта win32-функция}-->
<p>What does this win32-function do?</p>

_PRE_BEGIN
main:
    push 0xFFFFFFFF
    call MessageBeep
    xor  eax,eax
    retn
_PRE_END

_CHALLENGE_FOOTER()


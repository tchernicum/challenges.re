m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #49.')

<!--
\RU{Что делает эта Linux-функция}
\RU{Здесь используется AT\&T-синтаксис ассемблера.}
-->

<p>What does this Linux-function do?
AT&T assembly language syntax is used here.</p>

_PRE_BEGIN
main:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    $2, %edi
        call    sleep
        popq    %rbp
        ret
_PRE_END

_CHALLENGE_FOOTER()


m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #12.')

<p>What this code does?</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
.LC0:
        .string "Usage: <filename>"
.LC1:
        .string "error #1!"
.LC2:
        .string "error #2!"
main:
        push    rbx
        mov     rbx, rsi
        sub     rsp, 160
        cmp     edi, 2
        je      .L2
        mov     edi, OFFSET FLAT:.LC0
        call    puts
.L2:
        mov     rsi, QWORD PTR [rbx+8]
        lea     rdx, [rsp+16]
        mov     edi, 1
        call    __xstat
        test    eax, eax
        js      .L10
        mov     rax, QWORD PTR [rsp+88]
        xor     edi, edi
        mov     QWORD PTR [rsp], rax
        call    time
        mov     rdi, QWORD PTR [rbx+8]
        mov     rsi, rsp
        mov     QWORD PTR [rsp+8], rax
        call    utime
        test    eax, eax
        js      .L11
        add     rsp, 160
        xor     eax, eax
        pop     rbx
        ret
.L10:
        mov     edi, OFFSET FLAT:.LC1
        call    puts
        xor     edi, edi
        call    exit
.L11:
        mov     edi, OFFSET FLAT:.LC2
        call    puts
        xor     edi, edi
        call    exit
_PRE_END

<p>Executable file is also available for download: _HTML_LINK(`http://challenges.re/12/binary/e12',`here').
Don't forget to set executable flag: <b>chmod +x e12</b>.</p>

_CHALLENGE_FOOTER()

m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #15.')

<p>Now that's really easy. What does this code do?</p>

<p>Optimizing clang 3.4, LLVM 3.4, AT&T syntax:</p>

_PRE_BEGIN
f:                                      # @f
        xorps   %xmm0, %xmm0
        movups  %xmm0, 240(%rdi)
        movups  %xmm0, 224(%rdi)
        movups  %xmm0, 208(%rdi)
        movups  %xmm0, 192(%rdi)
        movups  %xmm0, 176(%rdi)
        movups  %xmm0, 160(%rdi)
        movups  %xmm0, 144(%rdi)
        movups  %xmm0, 128(%rdi)
        movups  %xmm0, 112(%rdi)
        movups  %xmm0, 96(%rdi)
        movups  %xmm0, 80(%rdi)
        movups  %xmm0, 64(%rdi)
        movups  %xmm0, 48(%rdi)
        movups  %xmm0, 32(%rdi)
        movups  %xmm0, 16(%rdi)
        movups  %xmm0, (%rdi)
        ret
_PRE_END

_CHALLENGE_FOOTER()


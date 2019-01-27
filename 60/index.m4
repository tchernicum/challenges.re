m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #60.')
_TAGS(`60')

<p>This piece of code...</p>

_PRE_BEGIN
#include &lt;stdio.h>

double d_max (double a, double b)
{
	if (a>b)
		return a;

	return b;
};

int main()
{
	// test
	printf ("%f\n", d_max (1.2, 3.4));
	printf ("%f\n", d_max (5.6, -4));
};
_PRE_END

<p>... is compiled by optimizing GCC 4.8.1 into the following piece of 32-bit x86 assembly code:</p>

_PRE_BEGIN
	fld	QWORD PTR [esp+4]
	fld	QWORD PTR [esp+12]
	fxch	st(1)
	fucomi	st, st(1)
	fcmovbe	st, st(1)
	fstp	st(1)
	ret
_PRE_END

<p>Try to eliminate the FXCH instruction, and test it.</p>

_CHALLENGE_FOOTER()

m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #69.')
_TAGS(`69')

<p>Using the MSDN documentation, find out which flags were used in the MessageBox() win32 function call.</p>
<!--\RU{Используя документацию \ac{MSDN}, найдите, какие флаги использовались в вызове win32-функции \TT{MessageBox()}.}-->

_HL2(`Optimizing MSVC 2010')

_PRE_BEGIN
_main	PROC
	push	278595		; 00044043H
	push	OFFSET $SG79792 ; 'caption'
	push	OFFSET $SG79793 ; 'hello, world!'
	push	0
	call	DWORD PTR __imp__MessageBoxA@16
	xor	eax, eax
	ret	0
_main	ENDP
_PRE_END

_CHALLENGE_FOOTER()


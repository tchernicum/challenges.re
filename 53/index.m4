m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #53.')
_TAGS(`53')

<p>This code, compiled in Linux x86-64 using GCC is crashing while execution (segmentation fault).
It's also crashed if compiled by MinGW for win32.

However, it works in Windows environment if compiled by MSVC 2010 x86.
Why?</p>

<!--
\RU{Этот код, когда компилируется при помощи GCC в Linux x86-64, падает во время исполнения (segmentation fault).
Но он работает в среде Windows, когда скомпилирован при помощи MSVC 2010 x86.
Почему?}
-->

_PRE_BEGIN
#include &lt;string.h>
#include &lt;stdio.h>

void alter_string(char *s)
{
        strcpy (s, "Goodbye!");
        printf ("Result: %s\n", s);
};

int main()
{
        alter_string ("Hello, world!\n");
};
_PRE_END

<p>Thanks to Sourav Punoriyar for note about MinGW.</p>

_CHALLENGE_FOOTER()


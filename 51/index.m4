m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #51.')

<!--
\RU{Если это скомпилировать в MSVC и запустить, появится три числа. Откуда они берутся? 
Откуда они берутся если скомпилировать в MSVC с оптимизациями (\Ox)?}
\RU{Почему в GCC ситуация совсем иная}
-->

<p>
If we compile this piece of code in MSVC and run it, three numbers are printed.
Where do they come from?
Where do they come from if you compile it in MSVC with optimization (\Ox)?
Why is the situation completely different if we compile with GCC?
</p>

_PRE_BEGIN
#include &lt;stdio.h>

int main()
{
	printf ("%d, %d, %d\n");

	return 0;
};
_PRE_END

_CHALLENGE_FOOTER()


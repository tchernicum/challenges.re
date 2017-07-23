m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #55.')
_TAGS(`55')

<!--
\RU{Возьмите пример, рассмотренный в этой секции}
\RU{скомпилируйте его в вашей любимой}
\RU{и компиляторе, и модифицируйте исполняемый файл так, чтобы цикл был в пределах}
-->

_PRE_BEGIN
#include &lt;stdio.h>

void printing_function(int i)
{
	printf ("f(%d)\n", i);
};

int main()
{
	int i;

	for (i=2; i&lt;10; i++)
		printing_function(i);

	return 0;
};
_PRE_END

<p>Compile this example in your favorite OS and compiler and modify (patch) the executable file so the loop range will be [6..20].</p>

_CHALLENGE_FOOTER()


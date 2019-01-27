m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #47.')
_TAGS(`47')

<!--
\RU{Это достаточно известный алгоритм компрессии данных}
\RU{Но из-за ошибки (или даже опечатки) он разжимает неверно}
\RU{В этом можно убедиться на этих примерах}
\RU{Это исходный текст}
\RU{Это корректно сжатый текст}
\RU{Это некорректно разжатый текст}
\RU{Попробуйте найти и исправить ошибку}
\RU{При некотором упорстве, это можно сделать при помощи модификации исполняемого файла}
-->

<p>It's a well known data compression algorithm.
However, due to a mistake (or typo) in the (closed) source code, it decompresses incorrectly.
Here we can see this bug in these examples.</p>

<p>This is a text used as a source: _HTML_LINK_AS_IS(`files/test.txt').</p>

<p>This is the text compressed correctly: _HTML_LINK_AS_IS(`files/test.compressed').</p>

<p>This is the incorrectly uncompressed text: _HTML_LINK_AS_IS(`files/test.uncompressed_incorrectly').</p>

<p>Try to find and fix the bug. With some effort, it can be done even by patching the binary.</p>

<ul>
<li> _HTML_LINK(`files/compressor_win32.exe',`Windows x86')
<li> _HTML_LINK(`files/compressor_linux86.tar',`Linux x86')
<li> _HTML_LINK(`files/compressor_MacOSX64.tar',`Mac OS X (x64)')
</ul>
<!-- % TODO: MIPS? -->

_CHALLENGE_FOOTER()


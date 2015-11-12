m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #45.')

<!--
\RU{Это имитация защиты от копирования использующей ключевой файл}
\RU{В ключевом файле имя пользователя и серийный номер}
\RU{Задачи две}
\RU{(Простая) при помощи \tracer либо иного отладчика, 
заставьте эту программу принимать измененный ключевой файл}
\RU{(Средняя) ваша задача заключается в том, чтобы изменить в файле имя пользователя на другое, 
но при этом, модифицировать саму программу нельзя}
-->

<p>This is a software copy protection imitation, which uses a key file.
The key file contain a user (or customer) name and a serial number.</p>

<p>There are two tasks:</p>

<ul>
<li><p>(Easy) with the help of any debugger, force the program to accept a changed key file.</p>
<li><p>(Medium) your goal is to modify the user name to another, without patching the program.</p>
</ul>

<p>The files:</p>

<ul>
<li> _HTML_LINK(`files/super_mega_protection.exe',`Windows x86')
<li> _HTML_LINK(`files/super_mega_protection.tar',`Linux x86')
<li> _HTML_LINK(`files/super_mega_protection_MacOSX.tar',`Mac OS X (x64)')
<li> _HTML_LINK(`files/super_mega_protection_MIPS.tar',`Linux MIPS')
<li> Key file: _HTML_LINK(`files/sample.key',`sample.key')
</ul>

_CHALLENGE_FOOTER()


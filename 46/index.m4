m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #46.')
_TAGS(`46')

<!--
\RU{Это очень примитивный игрушечный веб-сервер, поддерживающий только статические файлы, без \ac{CGI},}
\RU{В нем сознательно оставлено по крайней мере 4 уязвимости}
\RU{Постарайтесь найти их все и использовать для взлома удаленной машины}
-->

<p>
Here is a very primitive toy web-server that supports only static files, without CGI, etc.
At least 4 vulnerabilities are left here intentionally.
Try to find them all and exploit them in order to break into a remote host.
</p>

<ul>
<li> _HTML_LINK(`files/webserv_win32.rar',`Windows x86')
<li> _HTML_LINK(`files/webserv_Linux_x86.tar',`Linux x86')
<li> _HTML_LINK(`files/webserv_MacOSX_x64.tar',`Mac OS X (x64)')
</ul>

<!-- % TODO: MIPS? -->

_CHALLENGE_FOOTER()


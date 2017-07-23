m4_define(`_HTML_LINK', `<a href="$1">$2</a>')m4_dnl
m4_define(`_HTML_LINK_AS_IS', `<a href="$1">$1</a>')m4_dnl
m4_define(`_HTML_IMG', `<img src="$1" alt="$2">')m4_dnl
m4_define(`_HTML_EMAIL_LINK', `_HTML_LINK(mailto:_EMAIL_ADDRESS,_EMAIL_ADDRESS)')m4_dnl
m4_define(`_MAKE_TITLE', `<title>$1</title>')m4_dnl
m4_define(`_HEADER',`<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="author" content="Dennis Yurichev">
_MAKE_TITLE(`$1')
<link rel="stylesheet" href="//challenges.re/style.css">
</head>
<body>')m4_dnl
m4_define(`_FOOTER',`</body>
</html>')m4_dnl
m4_define(`_BLOG_FOOTER_GITHUB', `<hr><p>This open sourced site and this page in particular is <a href="https://github.com/dennis714/yurichev.com/blob/master/blog/$1/index.m4">hosted on GitHub</a>. Patches, suggestions and comments are welcome.</p>')m4_dnl
m4_define(`_HL1', `<h2>$1</h2>')m4_dnl
m4_define(`_HL2', `<a class="hl_link" name="$1" href="#$1"><h3>$1</h3></a>')m4_dnl
m4_define(`_HL3', `<a class="hl_link" name="$1" href="#$1"><h4>$1</h4></a>')m4_dnl
m4_define(`_HL4', `<a class="hl_link" name="$1" href="#$1"><h5>$1</h4></a>')m4_dnl
m4_define(`_GREY', `<font color="#808080">$1</font>')m4_dnl
m4_define(`_BOOK_NOT_FINISHED', `$1')m4_dnl
m4_define(`_HEADER_HL1', `_HEADER(`$1')_HL1(`$1')')m4_dnl
m4_define(`_TAGS',`<p>Tags: m4_include(`$1/tags.html').</p>')m4_dnl
m4_define(`_PRE_BEGIN',`<pre class="normal"><span class="inner-pre" style="font-size: 13px">')m4_dnl
m4_define(`_PRE_END',`</pre>')m4_dnl
m4_define(`_CHALLENGE_FOOTER',`<p>More challenges: _HTML_LINK(`//challenges.re/',`challenges.re'); about solutions: _HTML_LINK(`//challenges.re/#Solutions',`challenges.re/#Solutions').</p>
_FOOTER()')m4_dnl

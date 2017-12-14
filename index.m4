m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenges')

<p>Contrived by Dennis Yurichev (_HTML_LINK(`http://yurichev.com',`yurichev.com')).</p>

<p>The website has been inspired by _HTML_LINK(`http://projecteuler.net/',`Project Euler') and 
_HTML_LINK(`http://cryptopals.com/',`"the matasano crypto challenges"').</p>

<hr>

_HL2(`All challenges/exercises/problems/tasks')

<p>m4_include(`ALL.html')</p>

<hr>

_HL2(`By level')

<ul>
<li><p id="tag_L1">Level 1: m4_include(`L1.html') </p>

<li><p id="tag_L2">Level 2: m4_include(`L2.html') </p>

<li><p id="tag_L3">Level 3: m4_include(`L3.html') </p>
</ul>

<p>Distinction between levels is very blurred and not very strict, so don't rely on them fully.
But feel free to send me recommendations about them.
I would love to _HTML_LINK(`http://yurichev.com/contacts.html',`hear comments') like "it was so easy/hard" or "I've spent 2 hours for this",
so I can gather some statistics about exercises and promote/demote them.</p>

<hr>

_HL2(`By type')

<ul>
<li><p id="tag_ASM">Piece of assembly listing: m4_include(`ASM.html') </p>

<!--
Почти для всех задач, если не указано иное, два вопроса:
1) Что делает эта функция? Ответ должен состоять из одной фразы.
2) Перепишите эту функцию на \CCpp
-->

There are two questions for almost every exercise similar to the following (unless otherwise specified):
1) What does this function do? Try to give one-sentence answer.
2) Rewrite this function into C/C++.

<li><p id="tag_EXEC">Executable file: m4_include(`EXEC.html') </p>
</ul>

<hr>

_HL2(`By architecture')

<ul>
<li><p id="tag_X86">X86: m4_include(`X86.html') </p>

<li><p id="tag_X64">X64: m4_include(`X64.html') </p>

<li><p id="tag_SSE">X86/X64 SSE: m4_include(`SSE.html') </p>

<li><p id="tag_FPU">X86/X64 FPU: m4_include(`FPU.html') </p>

<li><p id="tag_MIPS">MIPS: m4_include(`MIPS.html') </p>

<li><p id="tag_ARM">ARM: m4_include(`ARM.html') </p>

<li><p id="tag_ARM64">ARM64: m4_include(`ARM64.html') </p>

<li><p id="tag_CLR">CLR (.NET): m4_include(`CLR.html') </p>

<li><p id="tag_JVM">JVM (Java Virtual Machine): m4_include(`JVM.html') </p>
</ul>

<hr>

_HL2(`By OS')

<ul>
<li><p id="tag_WINDOWS">Windows: m4_include(`WINDOWS.html') </p>

<li><p id="tag_LINUX">Linux: m4_include(`LINUX.html') </p>

<li><p id="tag_MACOSX">Mac OS X: m4_include(`MACOSX.html') </p>

<li><p id="tag_RASPBERRY">Raspberry Pi Linux: m4_include(`RASPBERRY.html') </p>
</ul>

<hr>

_HL2(`Other')

<ul>
<li><p id="tag_CRYPTO">Amateur cryptography: m4_include(`CRYPTO.html') </p>

<p>This kind of cryptography is very different from professional one, nevertheless,
it is highly popular in various types of software, so practicing reverse engineers has experience with it (or should have).</p>

<li><p id="tag_CRACKME">Crackme/keygenme: m4_include(`CRACKME.html') </p>
</ul>

<hr>

_HL2(`About the website')

<p>Well, "challenges" is a loud word, these are rather just exercises.</p>

<p>Some exercises were in _HTML_LINK(`http://beginners.re/',`my book for beginners'), some were in _HTML_LINK(`http://yurichev.com/blog/',`my blog'),
and I eventually decided to keep them all in one single place like this website, so be it.</p>

<!-- Translators are very welcome! -->

<p>
The source code of this website is also available at GitHub: _HTML_LINK_AS_IS(`https://github.com/DennisYurichev/challenges.re').
I would love to get any suggestions and notices about misspellings and typos.
</p>

_HL2(`Exercise numbers')

<p>There is no correlation between exercise number and hardness.
Sorry: I add new exercises occasionally and I can't use some fixed numbering system, so numbers are chaotic and has no meaning at all.</p>

<p>On the other hand, I can assure, exercise numbers will never change, so my readers can refer to them, and they are also referred from 
_HTML_LINK(`http://beginners.re/',`my book for beginners').</p>

_HL2(`Duplicates')

<p>There are some pieces of code which are really does the same thing, but in different ways.
Or maybe it is implemented for different architectures (x86 and Java VM/.NET).
That's OK.</p>

_HL2(`FAQ')

_HL3(`Can I use Google?')

<p>It's up to you. I would first try to solve exercise without googling.
If I would stuck, I would try to google some constants, text messages, etc.</p>

_HL3(`Should I give low-level answer (what each instruction does) or high-level (what the function does)?')

<p>As highest as possible.
In fact, reverse engineer's job is to reduce amount of information he/she has.
Malware analyst should describe a specific piece of malware using couple of sentences, no one really interesting what each of its several thousand instructions does.</p>

_HL3(`How can I measure my performance?')

<ul>
<li><p>As far as I can realize, If reverse engineer can solve most of these exercises, he is a hot target for head hunters (programming jobs in general).</p>

<li><p>Those who can solve from ¼ to ½ of all levels, perhaps, can freely apply for reverse engineering/malware analysts/vulnerability research job positions.</p>

<li><p>If you feel even first level is too hard for you, you may probably drop the idea to learn RE.</p>
</ul>

_HL3(`How can I learn Reverse Engineering?')

<p>Here is my book for beginners: _HTML_LINK_AS_IS(`http://beginners.re/').</p>

_HL3(`Can I use these exercises for my teaching?')

<p>Yes, that is why they are (and this website as a whole) licensed under Creative Commons terms (CC BY-SA 4.0),
like _HTML_LINK(`http://beginners.re/',`my book about RE for beginners').</p>

<center>
<a href="http://creativecommons.org/licenses/by-sa/4.0/">
<img src="CC-BY-SA_3_icon_88x31.png">
</a>
</center>

_HL2(`Solutions')

<p>I made decision not to publish solutions.</p>

<p>Some computer science/programming books has solutions for exercises 
(like _HTML_LINK(`https://en.wikipedia.org/wiki/The_Art_of_Computer_Programming',`TAOCP')), 
some has not (_HTML_LINK(`https://en.wikipedia.org/wiki/The_C_Programming_Language',`K&R'), 
_HTML_LINK(`https://en.wikipedia.org/wiki/Structure_and_Interpretation_of_Computer_Programs',`SICP'), 
_HTML_LINK(`https://www.inf.ethz.ch/personal/wirth/AD.pdf',`Niklaus Wirth - "Algorithms and Data Structures"'), 
_HTML_LINK(`https://en.wikipedia.org/wiki/The_Practice_of_Programming',`Brian Kernighan/Rob Pike - The Practice of Programming"') to name a few).</p>

<p>This website has been inspired by _HTML_LINK(`http://projecteuler.net/',`Project Euler') and 
_HTML_LINK(`http://cryptopals.com/',`"the matasano crypto challenges"') - and there are no solutions as well.</p>
<!-- http://euler.jakumo.org/ -->

<p>In my own opinion and experience, published solutions are killers to incentive (or motivation).
When you see solution to the exercise, you lost an intellectual curiosity to solve it.
It's like when magician reveals his tricks - he will loose all attention after the moment.</p>

<p>So please do not publish solutions on googleable forums/blogs/social networks, etc.
On the other hand, you can freely discuss exercises with your friends and other people on the closed non-googleable private forums.
Of course, I can't force anyone to do so, I just ask.
Here is also explanation by one of "the matasano crypto challenges" website authors:
_HTML_LINK_AS_IS(`https://www.reddit.com/r/haskell/comments/1fa8br/matasano_crypto_challenges_in_haskell/ca8em35').</p>

<p>If you are unsure if you solved some exercise correctly, just ask me by email (<i>dennis(@)yurichev.com</i>)
(please also put exercise number in subject line like "exercise #123").
If you don't want to reveal your name/email, you may use _HTML_LINK(`https://bitmessage.org/',`BitMessage') 
(my ID is <b>BM-2cUyrfGUDyjuUHyzAA63kq5NHAB2zMo4Q2</b>) and a temporary throw-away ID.</p>

_HL2(`Updates/news')

<p>I'll add more exercises in future, if you interesting, you may subscribe to my _HTML_LINK(`http://yurichev.com/blog/index.html',`blog') 
and/or twitter: _HTML_LINK(`https://twitter.com/yurichev',`@yurichev') 
and/or _HTML_LINK(`https://www.facebook.com/dennis.yurichev.5',`facebook').</p>

_HL2(`Thanks')

<p>Thanks to Diego Boy, Wolfgang Reiter and Niklas for bugfixes.</p>

_HL2(`Contact me')

<p>dennis(@)yurichev.com</p>

_FOOTER()


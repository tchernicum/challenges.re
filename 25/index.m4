m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #25 (black box).')

<p>It's a secret algorithm hidden inside of a black box (e.g. a smart card).
It's not possible to reveal it (well, at least, let's say, using our current hypothetical budget).
But we can send a lot of random data to it and observe responses.</p>

<p>There are 8 black boxes and 100,000 questions/answers pairs are gathered for each:</p>

<ul>
<li>_HTML_LINK(`bb1.txt',`exercise 25.1'): one 16-bit input; one 16-bit output
<li>_HTML_LINK(`bb2.txt',`exercise 25.2'): two 32-bit inputs; one 32-bit output
<li>_HTML_LINK(`bb3.txt',`exercise 25.3'); three 32-bit inputs; one 32-bit output
<li>_HTML_LINK(`bb4.txt',`exercise 25.4'); four 32-bit inputs; one 32-bit output
<li>_HTML_LINK(`bb5.txt',`exercise 25.5'); four 32-bit inputs; one 32-bit output
<li>_HTML_LINK(`bb6.txt',`exercise 25.6'); four 32-bit inputs; one 32-bit output
<li>_HTML_LINK(`bb7.txt',`exercise 25.7'); four 64-bit inputs; one 64-bit output
<li>_HTML_LINK(`bb8.txt',`exercise 25.8'); four 64-bit inputs; one 64-bit output
</ul>

<p>The problem is to find expression which will be correct for each pair.
The problem is generally known to be unsolvable, but it can be practically solved if there are few operations in expressions.
Here is one method: _HTML_LINK_AS_IS(`http://yurichev.com/writings/z3_rockey.pdf').</p>

<p>To make things slightly harder, inputs like 0, 0xFFFFFFFF, 0x55555555, 0xAAAAAAAA, etc, were not sent to black boxes.</p>

<p>Black boxes for this example were constructed in the sense of naive amateur cryptography (security through chaotic mess of operations and random constants),
so they all contains no more than 6 primitive mathematical/logical operations
and also small constants (smaller than 64 for the most black boxes, but one of them has a bigger constant as exception).</p>

<p>First three black boxes are easiest, last two are probably hardest.</p>

_CHALLENGE_FOOTER()



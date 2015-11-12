m4_include(`commons.m4')
_HEADER_HL1(`Reverse Engineering challenge #44.')

<!--
\RU{Утилита, шифрующая и дешифрующая файлы, по паролю}
\RU{Есть зашифрованный текстовый файл, пароль неизвестен}
\RU{Зашифрованный файл ~--- это текст на английском языке}
\RU{Утилита использует сравнительно мощный алгоритм шифрования, тем не менее,
он был применен с очень грубой ошибкой. И из-за ошибки расшифровать файл вполне возможно 
с минимумом затрат.}
\RU{Попробуйте найти ошибку и расшифровать файл}
-->

<p>
There is an utility which encrypts/decrypts files using a password.
There is an encrypted text file, the password is unknown.
The encrypted file is a text in the English language.
</p>

<p>
The utility uses a relatively strong cryptosystem, nevertheless, it was implemented with a serious blunder.
With the mistake present, it is possible to decrypt the file with a little effort.
</p>

<p>Try to find the mistake and decrypt the file.</p>

<p>_HTML_LINK(`files/amateur_cryptor.exe',`Windows x86').</p>

<p>The text file: _HTML_LINK_AS_IS(`files/text_encrypted').</p>

_CHALLENGE_FOOTER()


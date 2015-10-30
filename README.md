# A-Sin-To-Err

Cipher Machine Using [4 bit Nibbler CPU](http://bigmessofwires.com/nibbler).

Encoding
--------

Before encryption, plaintext needs to be converted to a stream of decimal digits. One way 
to do it is by using [straddling checkerboard](https://en.wikipedia.org/wiki/VIC_cipher#Straddling_checkerboard).

|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|---|
|   | A |   | S | I | N |   | T | O | E | R |
| 1 | B | C | D | F | G | H | J | K | L | M |
| 5 | P | Q | U | V | W | X | Y | Z | . | / |

Letters in the unmarked row are represented by one digit (column number), e.g., N becomes 4. 

Letters in the other two rows are represented by two digits (row then column), e.g., W becomes 54.

Numbers are enclosed in / symbols (59) and each number is repeated twice, e.g., 42 becomes 59442259.

Example encoding of text as stream of digits using straddling checkerboard:

| Plaintext | H | E | L | L | O | W | O | R | L | D |
|-----------|---|---|---|---|---|---|---|---|---|---|
| Encoded   | 15|  8| 18| 18|  7| 54|  7|  9| 18| 12|

Encryption
----------

Message begins with 8 digit nonce followed by stream of encrypted digits. Nonce is not
secret, but every value should only be used once. It is similar to page identifier of one 
time pad.

Example:

| Nonce     | 5551 | 8424 |      |      |      |      |
|-----------|------|------|------|------|------|------|
| Encoded   |      |      | 1581 | 8187 | 5479 | 1812 |
| Message   | 5551 | 8424 | 6592 | 9162 | 3839 | 2885 |

To encrypt, type nonce followed by encoded stream and record message shown on the LED 
display.

Decryption
----------

To decrypt, type message and record decrypted stream shown on the LED display.

| Message     | 5551 | 8424 | 6592 | 9162 | 3839 | 2885 |
|-------------|------|------|------|------|------|------|
| Decrypted   |      |      | 1581 | 8187 | 5479 | 1812 |

Decoding
--------

Ignore first 8 digits (nonce) and decode the rest using straddling checkerboard. Example:

| Decrypted   | 15|  8| 18| 18|  7| 54|  7|  9| 18| 12|
|-------------|---|---|---|---|---|---|---|---|---|---|
| Decoded     | H | E | L | L | O | W | O | R | L | D |

Building
--------

Start by changing the key in a_sin_to_err.cpp. The key has to be
random, e.g., 128 coin tosses. Then build code generator:

    make a_sin_to_err
    cp asintoer.asm asintoer2.asm
    ./a_sin_to_err codegen >>asintoer2.asm 

Compile asintoer2.asm on Windows to create ROM for Nibbler:

    assembler -o asintoer2.bin asintoerr2.asm

Implementation Details
----------------------

[RC5](https://en.wikipedia.org/wiki/RC5) in [CTR mode](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Counter_.28CTR.29)
is used. For ease of implementation, only one nibble from each block is used. Nibbles that
do not correspond to BCD are discarded.

Encryption function applied to each digit is (20 - plaintext - key) % 10. It is 
involuntory, meaning that f(f(x)) = x. Decryption function is the same as encryption,
(20 - ciphertext - key).

Known Limitations
-----------------

Expanded key is stored in ROM because Nibbler's lack of indirect addressing and limited
ROM size makes it difficult to port rc5_setup. Besides, entering 39 digit key
every time is impractical.

Hardware Changes
----------------

Cipher machine has the following hardware changes compared to the original Nibbler:

* Four seven-segment LED digits instead of LCD. HEF4543B decoders are connected to OUT0,
/LE lines to OUT1. Rightmost digit is bit 0 of OUT1.
* 12 key telephone-style keypad instead of four pushbuttons. Key switches are arranged in
a matrix. Columns are connected to IN0. Rightmost column is bit 0. Rows are connected to 
OUT0. Top row is bit 0.

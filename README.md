# A-Sin-To-Err

Cipher Machine Using [4 bit Nibbler CPU](http://bigmessofwires.com/nibbler).

Design highlights
-----------------

* Four digit seven-segment LED display
* 12 key telephone style keypad
* [RC5](https://en.wikipedia.org/wiki/RC5) in [CTR mode](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Counter_.28CTR.29)

[Straddling Checkerboard](https://en.wikipedia.org/wiki/VIC_cipher#Straddling_checkerboard)
-----------------------

A table to convert digits to letters

|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|---|
|   | A |   | S | I | N |   | T | O | E | R |
| 1 | B | C | D | F | G | H | J | K | L | M |
| 5 | P | Q | U | V | W | X | Y | Z | . | / |

Building
--------

Command-line tools, code generator:

    make straddling_checkerboard.cpp 
    make a_sin_to_err
    cp asintoer.asm asintoer2.asm
    ./a_sin_to_err codegen >>asintoer2.asm 

Compiling asintoer2.asm on Windows to create ROM for Nibbler:

    assembler -o asintoer2.bin asintoerr2.asm
    

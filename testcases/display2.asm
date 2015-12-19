; LED display test case

start:
    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101

	lit #4 ; digit value
	out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110

    lit #1 ; which digit
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101


    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101

	lit #3 ; digit value
	out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110

    lit #2 ; which digit
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101


    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101

	lit #2 ; digit value
	out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110

    lit #4 ; which digit
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101


    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101

	lit #1 ; digit value
	out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110

    lit #8 ; which digit
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101

    jmp start
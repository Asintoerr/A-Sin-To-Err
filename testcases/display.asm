; LED display test case

    lit #0
    out #1

	lit #1 ; digit value
	out #0
	lit #8 ; which digit
	out #1
    lit #0
    out #1

	lit #2 ; digit value
	out #0
	lit #4 ; which digit
	out #1
    lit #0
    out #1

	lit #3 ; digit value
	out #0
	lit #2 ; which digit
	out #1
    lit #0
    out #1

	lit #4 ; digit value
	out #0
	lit #1 ; which digit
	out #1
    lit #0
    out #1

halt:
    jmp halt
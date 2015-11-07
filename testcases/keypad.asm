; Matrix keypad test case

#define DD0     $33 ; display digit 0, 1 nibble
#define DD1     $34 ; display digit 1, 1 nibble
#define DD2     $35 ; display digit 2, 1 nibble
#define DD3     $36 ; display digit 3, 1 nibble
#define NEW_DIG $37 ; new digit, 1 nibble
#define TEMP    $38 ; 1 nibble
#define DELAY0  $39 ; 1 nibble
#define DELAY1  $3a ; 1 nibble
                    ; 2 nibbles empty

#define R0S     $80 ; keypad row 0 state, 1 nibble
#define R0C     $81 ; keypad row 0 count, 1 nibble
#define R0L     $82 ; keypad row 0 previous state, 1 nibble

#define R1S     $83 ; keypad row 1 state, 1 nibble
#define R1C     $84 ; keypad row 1 count, 1 nibble
#define R1L     $85 ; keypad row 1 previous state, 1 nibble

#define R2S     $86 ; keypad row 2 state, 1 nibble
#define R2C     $87 ; keypad row 2 count, 1 nibble
#define R2L     $88 ; keypad row 2 previous state, 1 nibble

#define R3S     $89 ; keypad row 3 state, 1 nibble
#define R3C     $8a ; keypad row 3 count, 1 nibble
#define R3L     $8b ; keypad row 3 previous state, 1 nibble


main_loop:
    ld DD0 ; Show digit 0, select row 0 of keypad matrix =================================
    out #0
    lit #1
    out #1
    
    lit #$f ; Delay
    st DELAY0
    st DELAY1
--  lit #$f
-   jz +
    addi #-1
    jmp -
+   ld DELAY0
    jz +
    addi #-1
    st DELAY0
    jnz --
+   ld DELAY1
    jz +
    addi #-1
    st DELAY1
    jnz --

+   in #0 ; Debounce
    cmpm R0L
    jz ++
    cmpm R0S
    jz +
    st R0S
    lit #0
    st R0C
    jmp ++
+   ld R0C
    addi #1
    st R0C
    jnz ++
    ld R0S
    st R0L
    st TEMP ; Decode new digit
    addm TEMP
    st TEMP
    addm TEMP ; ignore highest bit
    st TEMP
    jnc +
    lit #1 ; Button 1
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #2 ; Button 2
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #3 ; Button 3
    st NEW_DIG
    jmp new_digit
+
++  lit #0
    out #1 ; Reset control bit
    
    ld DD1 ; Show digit 1, select row 1 of keypad matrix =================================
    out #0
    lit #2
    out #1
    
    lit #$f ; Delay
    st DELAY0
    st DELAY1
--  lit #$f
-   jz +
    addi #-1
    jmp -
+   ld DELAY0
    jz +
    addi #-1
    st DELAY0
    jnz --
+   ld DELAY1
    jz +
    addi #-1
    st DELAY1
    jnz --

+   in #0 ; Debounce
    cmpm R1L
    jz ++
    cmpm R1S
    jz +
    st R1S
    lit #0
    st R1C
    jmp ++
+   ld R1C
    addi #1
    st R1C
    jnz ++
    ld R1S
    st R1L
    st TEMP ; Decode new digit
    addm TEMP
    st TEMP
    addm TEMP ; ignore highest bit
    st TEMP
    jnc +
    lit #4 ; Button 4
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #5 ; Button 5
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #6 ; Button 6
    st NEW_DIG
    jmp new_digit
+
++  lit #0
    out #1 ; Reset control bit

    ld DD2 ; Show digit 2, select row 2 of keypad matrix =================================
    out #0
    lit #4
    out #1
    
    lit #$f ; Delay
    st DELAY0
    st DELAY1
--  lit #$f
-   jz +
    addi #-1
    jmp -
+   ld DELAY0
    jz +
    addi #-1
    st DELAY0
    jnz --
+   ld DELAY1
    jz +
    addi #-1
    st DELAY1
    jnz --

+   in #0 ; Debounce
    cmpm R2L
    jz ++
    cmpm R2S
    jz +
    st R2S
    lit #0
    st R2C
    jmp ++
+   ld R2C
    addi #1
    st R2C
    jnz ++
    ld R2S
    st R2L
    st TEMP ; Decode new digit
    addm TEMP
    st TEMP
    addm TEMP ; ignore highest bit
    st TEMP
    jnc +
    lit #7 ; Button 7
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #8 ; Button 8
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #9 ; Button 9
    st NEW_DIG
    jmp new_digit
+
++  lit #0
    out #1 ; Reset control bit

    ld DD3 ; Show digit 3, select row 3 of keypad matrix =================================
    out #0
    lit #8
    out #1
    
    lit #$f ; Delay
    st DELAY0
    st DELAY1
--  lit #$f
-   jz +
    addi #-1
    jmp -
+   ld DELAY0
    jz +
    addi #-1
    st DELAY0
    jnz --
+   ld DELAY1
    jz +
    addi #-1
    st DELAY1
    jnz --

+   in #0 ; Debounce
    cmpm R3L
    jz ++
    cmpm R3S
    jz +
    st R3S
    lit #0
    st R3C
    jmp ++
+   ld R3C
    addi #1
    st R3C
    jnz ++
    ld R3S
    st R3L
    st TEMP ; Decode new digit
    addm TEMP
    st TEMP
    addm TEMP ; ignore highest bit
    st TEMP
    jnc +
    ; Button *
    jmp main_loop
+   addm TEMP
    st TEMP
    jnc +
    lit #0 ; Button 0
    st NEW_DIG
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    ; Button #
    jmp main_loop
+
++  lit #0
    out #1 ; Reset control bit
    jmp main_loop
    
new_digit:
    ; Encrypt NEW_DIG here
        
    ; Shift old digits to make space for the new
    ld DD2
    st DD3
    ld DD1
    st DD2
    ld DD0
    st DD1
    ld NEW_DIG
    st DD0
    jmp main_loop

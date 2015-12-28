; Nibbler cipher machine

; RC5 input
#define CTR_NONCE           $0 ; 32 bits = 8 nibbles
#define CTR_COUNTER         $8 ; 32 bits = 8 nibbles

; RC5 output
#define RC5_A              $10 ; 32 bits = 8 nibbles
#define RC5_B              $18 ; 32 bits = 8 nibbles

; Temporary variables
#define OPERAND_A          $20 ; 32 bits = 8 nibbles
#define OPERAND_B          $28 ; 32 bits = 8 nibbles
#define ROTL_COUNT         $30 ; 5 bits = 2 nibbles
#define BUFFER_VARIABLE    $32 ; 1 nibble

; IO related
#define DD0               $33 ; display digit 0, 1 nibble
#define DD1               $34 ; display digit 1, 1 nibble
#define DD2               $35 ; display digit 2, 1 nibble
#define DD3               $36 ; display digit 3, 1 nibble
#define NEW_DIG           $37 ; new digit, 1 nibble
#define TEMP              $38 ; 1 nibble
#define DELAY0            $39 ; 1 nibble
#define DELAY1            $3a ; 1 nibble

; Where we are in the process
#define NONCE_DIGITS      $3b ; number of nonce digits entered
#define GROUP_DIGITS      $3c ; 1 nibble

; Debouncing
#define R0S               $3d ; keypad row 0 state, 1 nibble
#define R0C               $3e ; keypad row 0 count, 1 nibble
#define R0L               $3f ; keypad row 0 previous state, 1 nibble

#define R1S               $40 ; keypad row 1 state, 1 nibble
#define R1C               $41 ; keypad row 1 count, 1 nibble
#define R1L               $42 ; keypad row 1 previous state, 1 nibble

#define R2S               $43 ; keypad row 2 state, 1 nibble
#define R2C               $44 ; keypad row 2 count, 1 nibble
#define R2L               $45 ; keypad row 2 previous state, 1 nibble

#define R3S               $46 ; keypad row 3 state, 1 nibble
#define R3C               $47 ; keypad row 3 count, 1 nibble
#define R3L               $48 ; keypad row 3 previous state, 1 nibble

; Flags for RC5 unrolled loop
#define TODO_LIST         $49 ; 17*4 nibbles

    ; Initialization
    lit #$0
    st CTR_NONCE+0
    st CTR_NONCE+1
    st CTR_NONCE+2
    st CTR_NONCE+3
    st CTR_NONCE+4
    st CTR_NONCE+5
    st CTR_NONCE+6
    st CTR_NONCE+7
    st CTR_COUNTER+0
    st CTR_COUNTER+1
    st CTR_COUNTER+2
    st CTR_COUNTER+3
    st CTR_COUNTER+4
    st CTR_COUNTER+5
    st CTR_COUNTER+6
    st CTR_COUNTER+7
    
    st NONCE_DIGITS
    st GROUP_DIGITS

    st R0S
    st R0C
    st R0L

    st R1S
    st R1C
    st R1L

    st R2S
    st R2C
    st R2L

    st R3S
    st R3C
    st R3L

    ; Initial state of LED display, can be key or version ID.
    ; Hex values above 9 are shown as blank.
    lit #$e
    st DD0
    lit #$2
    st DD1
    lit #$5
    st DD2
    lit #$a
    st DD3

main_loop:
    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    ld DD0 ; Show digit 0, select row 0 of keypad matrix =================================
    out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110 responds to any port number where bit 0 is 0, e.g., #$e=1110
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #1
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    lit #$8 ; Delay
    st DELAY0
    st DELAY1
--  lit #$8 ; Delay
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
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #2 ; Button 2
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #3 ; Button 3
    jmp new_digit
+
++  lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    ld DD1 ; Show digit 1, select row 1 of keypad matrix =================================
    out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #2
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    lit #$8 ; Delay
    st DELAY0
    st DELAY1
--  lit #$8 ; Delay
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
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #5 ; Button 5
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #6 ; Button 6
    jmp new_digit
+
++  lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    ld DD2 ; Show digit 2, select row 2 of keypad matrix =================================
    out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #4
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    lit #$8 ; Delay
    st DELAY0
    st DELAY1
--  lit #$8 ; Delay
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
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #8 ; Button 8
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    lit #9 ; Button 9
    jmp new_digit
+
++  lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    ld DD3 ; Show digit 3, select row 3 of keypad matrix =================================
    out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    lit #8
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    lit #$8 ; Delay
    st DELAY0
    st DELAY1
--  lit #$8 ; Delay
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
; test only insert start =================================================================
    ld RC5_A
    st DD3
    lit #$f 
    st DD2
    st DD1
    ld GROUP_DIGITS
    st DD0
; test only insert end =================================================================
    jmp main_loop
+   addm TEMP
    st TEMP
    jnc +
    lit #0 ; Button 0
    jmp new_digit
+   addm TEMP
    st TEMP
    jnc +
    ; Button #
; test only insert start =================================================================
    ld CTR_COUNTER+2
    st DD3
    ld CTR_COUNTER+1
    st DD2
    ld CTR_COUNTER+0
    st DD1
    lit #$f
    st DD0
; test only insert end =================================================================
+
++  jmp main_loop
    
new_digit:
    ; New digit in accumulator, see if it's part of nonce ================================
    st NEW_DIG
    
    lit #0 ; Blank display during long calculation
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #$f
    out #$e ; OUT0 responds to any port number where bit 0 is 0, e.g., #$e=1110
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #$f
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay

    lit #0
    out #$d ; OUT1 responds to any port number where bit 1 is 0, e.g., #$d=1101 ; Reset control bit
    lit #0  ; rather
-   addi #1 ; short
    jnz -   ; delay
    
    ld NONCE_DIGITS
    cmpi #0
    jnz +
    ld NEW_DIG
    st CTR_NONCE+0
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #1
    jnz +
    ld NEW_DIG
    st CTR_NONCE+1
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #2
    jnz +
    ld NEW_DIG
    st CTR_NONCE+2
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #3
    jnz +
    ld NEW_DIG
    st CTR_NONCE+3
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #4
    jnz +
    lit #$e ; blank leading digits to indicate new group
    st DD2
    st DD1
    st DD0
    ld NEW_DIG
    st CTR_NONCE+4
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #5
    jnz +
    ld NEW_DIG
    st CTR_NONCE+5
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #6
    jnz +
    ld NEW_DIG
    st CTR_NONCE+6
    jmp next_nonce
+   ld NONCE_DIGITS
    cmpi #7
    jnz +
    ld NEW_DIG
    st CTR_NONCE+7
    jmp next_nonce
+
    ld GROUP_DIGITS ; increment digit counter
    addi #$1
    st GROUP_DIGITS
    cmpi #$1
    jz +
    cmpi #$5
    jz +
    cmpi #$9
    jz +
    cmpi #$d
    jnz ++
+
    lit #$e ; blank leading digits to indicate new group
    st DD2
    st DD1
    st DD0
++
    ; Get next keystream digit ===========================================================
get_another_key_digit:
    ld CTR_COUNTER+0 ; increment counter
    addi #1
    st CTR_COUNTER+0
    jnc rc5_process_block
    ld CTR_COUNTER+1 ;
    addi #1
    st CTR_COUNTER+1
    jnc rc5_process_block
    ld CTR_COUNTER+2 ;
    addi #1
    st CTR_COUNTER+2
    jnc rc5_process_block
    ld CTR_COUNTER+3 ;
    addi #1
    st CTR_COUNTER+3
    jnc rc5_process_block
    ld CTR_COUNTER+4 ;
    addi #1
    st CTR_COUNTER+4
    jnc rc5_process_block
    ld CTR_COUNTER+5 ;
    addi #1
    st CTR_COUNTER+5
    jnc rc5_process_block
    ld CTR_COUNTER+6 ;
    addi #1
    st CTR_COUNTER+6
    jnc rc5_process_block
    ld CTR_COUNTER+7 ;
    addi #1
    st CTR_COUNTER+7
    jmp rc5_process_block

got_next_key_digit: ; rc5_process_block returns here
    
    ; Encrypt NEW_DIG on keystream digit =================================================
    ld RC5_A      ; Check if first nibble of RC5_A is valid BCD
    cmpi #10
    jc get_another_key_digit

    ; Compute 10's complement of keystream digit, store in TEMP
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
+   st TEMP

    ; Compute 10's complement of plaintext
    ld NEW_DIG
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
    
    ; Add 10's complements
+   addm TEMP
    jc +
    cmpi #10
    jnc ++
+   addi #6
    
    ; Done with encryption
++  st NEW_DIG
    jmp show_new_dig
    
next_nonce:
    ld NONCE_DIGITS
    addi #1
    st NONCE_DIGITS

show_new_dig:        
    ; Shift old digits to make space for the new =========================================
    ld DD2
    st DD3
    ld DD1
    st DD2
    ld DD0
    st DD1
    ld NEW_DIG
    st DD0
    jmp main_loop

add32_into_rc5_a:
    ld OPERAND_A+0
    addm OPERAND_B+0
    st RC5_A+0
    jnc +
    
    ld OPERAND_A+1       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+1
    st RC5_A+1
    jmp +++ 
+   ld OPERAND_A+1
++  addm OPERAND_B+1
    st RC5_A+1
    jnc +

+++ ld OPERAND_A+2       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+2
    st RC5_A+2
    jmp +++
+   ld OPERAND_A+2
++  addm OPERAND_B+2
    st RC5_A+2
    jnc +
    
+++ ld OPERAND_A+3       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+3
    st RC5_A+3
    jmp +++ 
+   ld OPERAND_A+3
++  addm OPERAND_B+3
    st RC5_A+3
    jnc +

+++ ld OPERAND_A+4       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+4
    st RC5_A+4
    jmp +++ 
+   ld OPERAND_A+4
++  addm OPERAND_B+4
    st RC5_A+4
    jnc +

+++ ld OPERAND_A+5       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+5
    st RC5_A+5
    jmp +++ 
+   ld OPERAND_A+5
++  addm OPERAND_B+5
    st RC5_A+5
    jnc +

+++ ld OPERAND_A+6       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+6
    st RC5_A+6
    jmp +++ 
+   ld OPERAND_A+6
++  addm OPERAND_B+6
    st RC5_A+6
    jnc +

+++ ld OPERAND_A+7       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+7
    st RC5_A+7
    jmp +++ 
+   ld OPERAND_A+7
++  addm OPERAND_B+7
    st RC5_A+7

+++ jmp cycle_start

add32_into_rc5_b:
    ld OPERAND_A+0
    addm OPERAND_B+0
    st RC5_B+0
    jnc +
    
    ld OPERAND_A+1       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+1
    st RC5_B+1
    jmp +++ 
+   ld OPERAND_A+1
++  addm OPERAND_B+1
    st RC5_B+1
    jnc +

+++ ld OPERAND_A+2       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+2
    st RC5_B+2
    jmp +++
+   ld OPERAND_A+2
++  addm OPERAND_B+2
    st RC5_B+2
    jnc +
    
+++ ld OPERAND_A+3       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+3
    st RC5_B+3
    jmp +++ 
+   ld OPERAND_A+3
++  addm OPERAND_B+3
    st RC5_B+3
    jnc +

+++ ld OPERAND_A+4       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+4
    st RC5_B+4
    jmp +++ 
+   ld OPERAND_A+4
++  addm OPERAND_B+4
    st RC5_B+4
    jnc +

+++ ld OPERAND_A+5       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+5
    st RC5_B+5
    jmp +++ 
+   ld OPERAND_A+5
++  addm OPERAND_B+5
    st RC5_B+5
    jnc +

+++ ld OPERAND_A+6       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+6
    st RC5_B+6
    jmp +++ 
+   ld OPERAND_A+6
++  addm OPERAND_B+6
    st RC5_B+6
    jnc +

+++ ld OPERAND_A+7       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+7
    st RC5_B+7
    jmp +++ 
+   ld OPERAND_A+7
++  addm OPERAND_B+7
    st RC5_B+7

+++ jmp cycle_start

xor_rotl_into_a:
    ld RC5_A+0       ;-----------------
    nori #0
    st OPERAND_A+0
    ld RC5_B+0      
    nori #0                  
    norm OPERAND_A+0  
    st OPERAND_A+0
    ld RC5_A+0
    norm RC5_B+0
    norm OPERAND_A+0
    st OPERAND_A+0

    ld RC5_A+1       ;-----------------
    nori #0
    st OPERAND_A+1
    ld RC5_B+1
    nori #0
    norm OPERAND_A+1
    st OPERAND_A+1
    ld RC5_A+1
    norm RC5_B+1
    norm OPERAND_A+1
    st OPERAND_A+1

    ld RC5_A+2       ;-----------------
    nori #0
    st OPERAND_A+2
    ld RC5_B+2
    nori #0
    norm OPERAND_A+2
    st OPERAND_A+2
    ld RC5_A+2
    norm RC5_B+2
    norm OPERAND_A+2
    st OPERAND_A+2

    ld RC5_A+3       ;-----------------
    nori #0
    st OPERAND_A+3
    ld RC5_B+3
    nori #0
    norm OPERAND_A+3
    st OPERAND_A+3
    ld RC5_A+3
    norm RC5_B+3
    norm OPERAND_A+3
    st OPERAND_A+3

    ld RC5_A+4       ;-----------------
    nori #0
    st OPERAND_A+4
    ld RC5_B+4
    nori #0
    norm OPERAND_A+4
    st OPERAND_A+4
    ld RC5_A+4
    norm RC5_B+4
    norm OPERAND_A+4
    st OPERAND_A+4

    ld RC5_A+5       ;-----------------
    nori #0
    st OPERAND_A+5
    ld RC5_B+5
    nori #0
    norm OPERAND_A+5
    st OPERAND_A+5
    ld RC5_A+5
    norm RC5_B+5
    norm OPERAND_A+5
    st OPERAND_A+5

    ld RC5_A+6       ;-----------------
    nori #0
    st OPERAND_A+6
    ld RC5_B+6
    nori #0
    norm OPERAND_A+6
    st OPERAND_A+6
    ld RC5_A+6
    norm RC5_B+6
    norm OPERAND_A+6
    st OPERAND_A+6
    
    ld RC5_A+7       ;-----------------
    nori #0
    st OPERAND_A+7
    ld RC5_B+7
    nori #0
    norm OPERAND_A+7
    st OPERAND_A+7
    ld RC5_A+7
    norm RC5_B+7
    norm OPERAND_A+7
    st OPERAND_A+7

    ; rotate left
    ld ROTL_COUNT+1      ; 4th bit of rotation counter...
    NORI #0
    NORI #$e
    jz +
    ld OPERAND_A+4    ; ...is set, rotate by 16 bits (4 nibbles)
    st BUFFER_VARIABLE
    ld OPERAND_A+0    ; 0<->4
    st OPERAND_A+4
    ld BUFFER_VARIABLE
    st OPERAND_A+0
    ld OPERAND_A+5    ; 1<->5
    st BUFFER_VARIABLE
    ld OPERAND_A+1
    st OPERAND_A+5
    ld BUFFER_VARIABLE
    st OPERAND_A+1
    ld OPERAND_A+6    ; 2<->6
    st BUFFER_VARIABLE
    ld OPERAND_A+2
    st OPERAND_A+6
    ld BUFFER_VARIABLE
    st OPERAND_A+2
    ld OPERAND_A+7    ; 3<->7
    st BUFFER_VARIABLE
    ld OPERAND_A+3
    st OPERAND_A+7
    ld BUFFER_VARIABLE
    st OPERAND_A+3

+   ld ROTL_COUNT+0      ; 3rd bit of rotation counter...
    NORI #0
    NORI #7
    jz +
    ld OPERAND_A+2    ; ...is set, rotate by 8 bits (2 nibbles)
    st BUFFER_VARIABLE
    ld OPERAND_A+0    ; 0->2
    st OPERAND_A+2
    ld OPERAND_A+6    ; 6->0
    st OPERAND_A+0
    ld OPERAND_A+4    ; 4->6
    st OPERAND_A+6
    ld BUFFER_VARIABLE       ; 2->4
    st OPERAND_A+4
    ld OPERAND_A+3    ; now odd
    st BUFFER_VARIABLE
    ld OPERAND_A+1    ; 1->3
    st OPERAND_A+3
    ld OPERAND_A+7    ; 7->1
    st OPERAND_A+1
    ld OPERAND_A+5    ; 5->7
    st OPERAND_A+7
    ld BUFFER_VARIABLE       ; 3->5
    st OPERAND_A+5
    
+   ld ROTL_COUNT+0      ; 2nd bit of rotation counter...
    NORI #0
    NORI #$b
    jz +
    ld OPERAND_A+1    ; ...is set, rotate by 4 bits (1 nibble)
    st BUFFER_VARIABLE
    ld OPERAND_A+0    ; 0->1
    st OPERAND_A+1
    ld OPERAND_A+7    ; 7->0
    st OPERAND_A+0
    ld OPERAND_A+6    ; 6->7
    st OPERAND_A+7
    ld OPERAND_A+5    ; 5->6
    st OPERAND_A+6
    ld OPERAND_A+4    ; 4->5
    st OPERAND_A+5
    ld OPERAND_A+3    ; 3->4
    st OPERAND_A+4
    ld OPERAND_A+2    ; 2->3
    st OPERAND_A+3
    ld BUFFER_VARIABLE       ; 1->2
    st OPERAND_A+2

+   ld ROTL_COUNT+0      ; last two bits of rotation counter, rotate one by one
    st BUFFER_VARIABLE

rotate_more:
    NORI #0
    NORI #$c
    jz cycle_start

    ld OPERAND_A+0
    addm OPERAND_A+0
    st OPERAND_A+0
    jnc +                
    
    ld OPERAND_A+1    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+1
    st OPERAND_A+1
    jmp +++ 
+   ld OPERAND_A+1
++  addm OPERAND_A+1
    st OPERAND_A+1
    jnc +                

+++ ld OPERAND_A+2    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+2
    st OPERAND_A+2
    jmp +++ 
+   ld OPERAND_A+2
++  addm OPERAND_A+2
    st OPERAND_A+2
    jnc +                

+++ ld OPERAND_A+3    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+3
    st OPERAND_A+3
    jmp +++ 
+   ld OPERAND_A+3
++  addm OPERAND_A+3
    st OPERAND_A+3
    jnc +                

+++ ld OPERAND_A+4    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+4
    st OPERAND_A+4
    jmp +++ 
+   ld OPERAND_A+4
++  addm OPERAND_A+4
    st OPERAND_A+4
    jnc +                

+++ ld OPERAND_A+5    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+5
    st OPERAND_A+5
    jmp +++ 
+   ld OPERAND_A+5
++  addm OPERAND_A+5
    st OPERAND_A+5
    jnc +                

+++ ld OPERAND_A+6    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+6
    st OPERAND_A+6
    jmp +++ 
+   ld OPERAND_A+6
++  addm OPERAND_A+6
    st OPERAND_A+6
    jnc +                

+++ ld OPERAND_A+7    ;--------------
    addi #1
    jnc ++
    ld OPERAND_A+7
    st OPERAND_A+7
    jmp +++ 
+   ld OPERAND_A+7
++  addm OPERAND_A+7
    st OPERAND_A+7
    jnc +
    
+++ ld OPERAND_A+0     ; wrap around last bit
    addi #1
    st OPERAND_A+0

+   ld BUFFER_VARIABLE
    addi #-1
    st BUFFER_VARIABLE
    jmp rotate_more

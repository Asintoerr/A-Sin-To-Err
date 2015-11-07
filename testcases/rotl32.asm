; 32 bit rotate left test case

#define FIRST_OPERAND    $0 ; 32 bits = 8 nibbles
#define SECOND_OPERAND   $8 ; 5 bits <= 2 nibbles
#define OPERATION_RESULT $10 ; 32 bits = 8 nibbles
#define BUFFER_VARIABLE  $a

; Variable initialization
    lit #$0
    st FIRST_OPERAND+0
    lit #$c
    st FIRST_OPERAND+1
    lit #$a
    st FIRST_OPERAND+2
    lit #$e
    st FIRST_OPERAND+3
    lit #$a
    st FIRST_OPERAND+4
    lit #$0
    st FIRST_OPERAND+5
    lit #$9
    st FIRST_OPERAND+6
    lit #$5
    st FIRST_OPERAND+7

    lit #$a
    st SECOND_OPERAND+0
    lit #$0
    st SECOND_OPERAND+1
 
rotl32:
    ld FIRST_OPERAND+0       ; copy
    st OPERATION_RESULT+0
    ld FIRST_OPERAND+1
    st OPERATION_RESULT+1
    ld FIRST_OPERAND+2
    st OPERATION_RESULT+2
    ld FIRST_OPERAND+3
    st OPERATION_RESULT+3
    ld FIRST_OPERAND+4
    st OPERATION_RESULT+4
    ld FIRST_OPERAND+5
    st OPERATION_RESULT+5
    ld FIRST_OPERAND+6
    st OPERATION_RESULT+6
    ld FIRST_OPERAND+7
    st OPERATION_RESULT+7

    ld SECOND_OPERAND+1      ; 4th bit of rotation counter...
    NORI #0
    NORI #$e
    jz +
    ld OPERATION_RESULT+4    ; ...is set, rotate by 16 bits (4 nibbles)
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+0    ; 0<->4
    st OPERATION_RESULT+4
    ld BUFFER_VARIABLE
    st OPERATION_RESULT+0
    ld OPERATION_RESULT+5    ; 1<->5
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+1
    st OPERATION_RESULT+5
    ld BUFFER_VARIABLE
    st OPERATION_RESULT+1
    ld OPERATION_RESULT+6    ; 2<->6
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+2
    st OPERATION_RESULT+6
    ld BUFFER_VARIABLE
    st OPERATION_RESULT+2
    ld OPERATION_RESULT+7    ; 3<->7
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+3
    st OPERATION_RESULT+7
    ld BUFFER_VARIABLE
    st OPERATION_RESULT+3

+   ld SECOND_OPERAND+0      ; 3rd bit of rotation counter...
    NORI #0
    NORI #7
    jz +
    ld OPERATION_RESULT+2    ; ...is set, rotate by 8 bits (2 nibbles)
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+0    ; 0->2
    st OPERATION_RESULT+2
    ld OPERATION_RESULT+6    ; 6->0
    st OPERATION_RESULT+0
    ld OPERATION_RESULT+4    ; 4->6
    st OPERATION_RESULT+6
    ld BUFFER_VARIABLE       ; 2->4
    st OPERATION_RESULT+4
    ld OPERATION_RESULT+3    ; now odd
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+1    ; 1->3
    st OPERATION_RESULT+3
    ld OPERATION_RESULT+7    ; 7->1
    st OPERATION_RESULT+1
    ld OPERATION_RESULT+5    ; 5->7
    st OPERATION_RESULT+7
    ld BUFFER_VARIABLE       ; 3->5
    st OPERATION_RESULT+5
    
+   ld SECOND_OPERAND+0      ; 2nd bit of rotation counter...
    NORI #0
    NORI #$b
    jz +
    ld OPERATION_RESULT+1    ; ...is set, rotate by 4 bits (1 nibble)
    st BUFFER_VARIABLE
    ld OPERATION_RESULT+0    ; 0->1
    st OPERATION_RESULT+1
    ld OPERATION_RESULT+7    ; 7->0
    st OPERATION_RESULT+0
    ld OPERATION_RESULT+6    ; 6->7
    st OPERATION_RESULT+7
    ld OPERATION_RESULT+5    ; 5->6
    st OPERATION_RESULT+6
    ld OPERATION_RESULT+4    ; 4->5
    st OPERATION_RESULT+5
    ld OPERATION_RESULT+3    ; 3->4
    st OPERATION_RESULT+4
    ld OPERATION_RESULT+2    ; 2->3
    st OPERATION_RESULT+3
    ld BUFFER_VARIABLE       ; 1->2
    st OPERATION_RESULT+2

+   ld SECOND_OPERAND+0      ; last two bits of rotation counter, rotate one by one
    st BUFFER_VARIABLE

rotate_more:
    NORI #0
    NORI #$c
    jz halt

    ld OPERATION_RESULT+0
    addm OPERATION_RESULT+0
    st OPERATION_RESULT+0
    jnc +                
    
    ld OPERATION_RESULT+1    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+1
    st OPERATION_RESULT+1
    jmp +++ 
+   ld OPERATION_RESULT+1
++  addm OPERATION_RESULT+1
    st OPERATION_RESULT+1
    jnc +                

+++ ld OPERATION_RESULT+2    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+2
    st OPERATION_RESULT+2
    jmp +++ 
+   ld OPERATION_RESULT+2
++  addm OPERATION_RESULT+2
    st OPERATION_RESULT+2
    jnc +                

+++ ld OPERATION_RESULT+3    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+3
    st OPERATION_RESULT+3
    jmp +++ 
+   ld OPERATION_RESULT+3
++  addm OPERATION_RESULT+3
    st OPERATION_RESULT+3
    jnc +                

+++ ld OPERATION_RESULT+4    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+4
    st OPERATION_RESULT+4
    jmp +++ 
+   ld OPERATION_RESULT+4
++  addm OPERATION_RESULT+4
    st OPERATION_RESULT+4
    jnc +                

+++ ld OPERATION_RESULT+5    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+5
    st OPERATION_RESULT+5
    jmp +++ 
+   ld OPERATION_RESULT+5
++  addm OPERATION_RESULT+5
    st OPERATION_RESULT+5
    jnc +                

+++ ld OPERATION_RESULT+6    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+6
    st OPERATION_RESULT+6
    jmp +++ 
+   ld OPERATION_RESULT+6
++  addm OPERATION_RESULT+6
    st OPERATION_RESULT+6
    jnc +                

+++ ld OPERATION_RESULT+7    ;--------------
    addi #1
    jnc ++
    ld OPERATION_RESULT+7
    st OPERATION_RESULT+7
    jmp +++ 
+   ld OPERATION_RESULT+7
++  addm OPERATION_RESULT+7
    st OPERATION_RESULT+7
    jnc +
    
+++ ld OPERATION_RESULT+0     ; wrap around last bit
    addi #1
    st OPERATION_RESULT+0

+   ld BUFFER_VARIABLE
    addi #-1
    st BUFFER_VARIABLE
    jmp rotate_more

halt:    
    jmp halt
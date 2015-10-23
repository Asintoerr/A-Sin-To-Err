; 32 bit rotate left

#define FIRST_OPERAND    $0 ; 32 bits = 8 nibbles
#define SECOND_OPERAND   $8 ; 5 bits <= 2 nibbles
#define OPERATION_RESULT $10 ; 32 bits = 8 nibbles
#define BUFFER_VARIABLE  $a

; Variable initialization
    lit #$d
    st FIRST_OPERAND+0
    lit #$e
    st FIRST_OPERAND+1
    lit #$a
    st FIRST_OPERAND+2
    lit #$d
    st FIRST_OPERAND+3
    lit #$b
    st FIRST_OPERAND+4
    lit #$e
    st FIRST_OPERAND+5
    lit #$e
    st FIRST_OPERAND+6
    lit #$f
    st FIRST_OPERAND+7

    lit #$f
    st SECOND_OPERAND+0
    lit #$1
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
    NORI #$d
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

halt:    
+   jmp halt
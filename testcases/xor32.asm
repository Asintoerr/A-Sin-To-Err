; 32 bit exclusive OR test case

#define FIRST_OPERAND    $0 ; 32 bits = 8 nibbles
#define SECOND_OPERAND   $8
#define OPERATION_RESULT $10

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

    lit #$c
    st SECOND_OPERAND+0
    lit #$a
    st SECOND_OPERAND+1
    lit #$f
    st SECOND_OPERAND+2
    lit #$e
    st SECOND_OPERAND+3
    lit #$1
    st SECOND_OPERAND+4
    lit #$2
    st SECOND_OPERAND+5
    lit #$3
    st SECOND_OPERAND+6
    lit #$4
    st SECOND_OPERAND+7
 
xor32:
    ld FIRST_OPERAND+0       ;-----------------
    nori #0
    st OPERATION_RESULT+0
    ld SECOND_OPERAND+0      
    nori #0                  
    norm OPERATION_RESULT+0  
    st OPERATION_RESULT+0
    ld FIRST_OPERAND+0
    norm SECOND_OPERAND+0
    norm OPERATION_RESULT+0
    st OPERATION_RESULT+0

    ld FIRST_OPERAND+1       ;-----------------
    nori #0
    st OPERATION_RESULT+1
    ld SECOND_OPERAND+1
    nori #0
    norm OPERATION_RESULT+1
    st OPERATION_RESULT+1
    ld FIRST_OPERAND+1
    norm SECOND_OPERAND+1
    norm OPERATION_RESULT+1
    st OPERATION_RESULT+1

    ld FIRST_OPERAND+2       ;-----------------
    nori #0
    st OPERATION_RESULT+2
    ld SECOND_OPERAND+2
    nori #0
    norm OPERATION_RESULT+2
    st OPERATION_RESULT+2
    ld FIRST_OPERAND+2
    norm SECOND_OPERAND+2
    norm OPERATION_RESULT+2
    st OPERATION_RESULT+2

    ld FIRST_OPERAND+3       ;-----------------
    nori #0
    st OPERATION_RESULT+3
    ld SECOND_OPERAND+3
    nori #0
    norm OPERATION_RESULT+3
    st OPERATION_RESULT+3
    ld FIRST_OPERAND+3
    norm SECOND_OPERAND+3
    norm OPERATION_RESULT+3
    st OPERATION_RESULT+3

    ld FIRST_OPERAND+4       ;-----------------
    nori #0
    st OPERATION_RESULT+4
    ld SECOND_OPERAND+4
    nori #0
    norm OPERATION_RESULT+4
    st OPERATION_RESULT+4
    ld FIRST_OPERAND+4
    norm SECOND_OPERAND+4
    norm OPERATION_RESULT+4
    st OPERATION_RESULT+4

    ld FIRST_OPERAND+5       ;-----------------
    nori #0
    st OPERATION_RESULT+5
    ld SECOND_OPERAND+5
    nori #0
    norm OPERATION_RESULT+5
    st OPERATION_RESULT+5
    ld FIRST_OPERAND+5
    norm SECOND_OPERAND+5
    norm OPERATION_RESULT+5
    st OPERATION_RESULT+5

    ld FIRST_OPERAND+6       ;-----------------
    nori #0
    st OPERATION_RESULT+6
    ld SECOND_OPERAND+6
    nori #0
    norm OPERATION_RESULT+6
    st OPERATION_RESULT+6
    ld FIRST_OPERAND+6
    norm SECOND_OPERAND+6
    norm OPERATION_RESULT+6
    st OPERATION_RESULT+6
    
    ld FIRST_OPERAND+7       ;-----------------
    nori #0
    st OPERATION_RESULT+7
    ld SECOND_OPERAND+7
    nori #0
    norm OPERATION_RESULT+7
    st OPERATION_RESULT+7
    ld FIRST_OPERAND+7
    norm SECOND_OPERAND+7
    norm OPERATION_RESULT+7
    st OPERATION_RESULT+7

halt:    
    jmp halt
; 32 bit addition

#define FIRST_OPERAND    $0 ; 32 bits = 8 nibbles
#define SECOND_OPERAND   $8
#define OPERATION_RESULT $10

; Variable initialization
    lit #$8
    st FIRST_OPERAND+0
    lit #$7
    st FIRST_OPERAND+1
    lit #$6
    st FIRST_OPERAND+2
    lit #$5
    st FIRST_OPERAND+3
    lit #$4
    st FIRST_OPERAND+4
    lit #$3
    st FIRST_OPERAND+5
    lit #$2
    st FIRST_OPERAND+6
    lit #$1
    st FIRST_OPERAND+7

    lit #$0
    st SECOND_OPERAND+0
    lit #$f
    st SECOND_OPERAND+1
    lit #$e
    st SECOND_OPERAND+2
    lit #$d
    st SECOND_OPERAND+3
    lit #$c
    st SECOND_OPERAND+4
    lit #$b
    st SECOND_OPERAND+5
    lit #$a
    st SECOND_OPERAND+6
    lit #$9
    st SECOND_OPERAND+7
 
u32addition:
    ld FIRST_OPERAND+0       ;
    addm SECOND_OPERAND+0    ;
    st OPERATION_RESULT+0    ;
    jnc +                    ;
    
    ld FIRST_OPERAND+1       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+1      ; carry from adding 1 means accumulator is zero
    st OPERATION_RESULT+1
    jmp +++ 
+   ld FIRST_OPERAND+1       ;
++  addm SECOND_OPERAND+1    ;
    st OPERATION_RESULT+1    ;
    jnc +                    ;

+++ ld FIRST_OPERAND+2       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+2
    st OPERATION_RESULT+2
    jmp +++
+   ld FIRST_OPERAND+2       ;
++  addm SECOND_OPERAND+2    ;
    st OPERATION_RESULT+2    ;
    
    ld FIRST_OPERAND+3       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+3
    st OPERATION_RESULT+3
    jmp +++ 
+   ld FIRST_OPERAND+3       ;
++  addm SECOND_OPERAND+3    ;
    st OPERATION_RESULT+3    ;
    jnc +                    ;

    ld FIRST_OPERAND+4       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+4
    st OPERATION_RESULT+4
    jmp +++ 
+   ld FIRST_OPERAND+4       ;
++  addm SECOND_OPERAND+4    ;
    st OPERATION_RESULT+4    ;
    jnc +                    ;

    ld FIRST_OPERAND+5       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+5
    st OPERATION_RESULT+5
    jmp +++ 
+   ld FIRST_OPERAND+5       ;
++  addm SECOND_OPERAND+5    ;
    st OPERATION_RESULT+5    ;
    jnc +                    ;

    ld FIRST_OPERAND+6       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+6
    st OPERATION_RESULT+6
    jmp +++ 
+   ld FIRST_OPERAND+6       ;
++  addm SECOND_OPERAND+6    ;
    st OPERATION_RESULT+6    ;
    jnc +                    ;

    ld FIRST_OPERAND+7       ;--------------
    addi #1
    jnc ++
    ld SECOND_OPERAND+7
    st OPERATION_RESULT+7
    jmp +++ 
+   ld FIRST_OPERAND+7       ;
++  addm SECOND_OPERAND+7    ;
    st OPERATION_RESULT+7    ;

halt:    
+++ jmp halt
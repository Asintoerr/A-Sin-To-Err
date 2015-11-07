; BCD subtraction test case

#define PLAINTEXT  0
#define KEY        1
#define CIPHERTEXT 2
#define DECODED    3
#define TEMP       4

; Plaintext 1, key 5, ciphertext (20 - 1 - 5) % 10 = 4, decrypted (20 - 4 - 5) % 10 = 1 

    lit #1          ; plaintext
    st PLAINTEXT
    lit #5          ; key
    st KEY
    
    ; Compute 10's complement of plaintext, store in TEMP
    ld PLAINTEXT
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
+   st TEMP

    ; Compute 10's complement of key
    ld KEY
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
    
    ; Add 10's complements
+   addm TEMP
    jc +
    cmpi #9
    jnc ++
+   addi #6
    
    ; Done with encryption
++  st CIPHERTEXT

    ; Compute 10's complement of ciphertext, store in TEMP
    ld CIPHERTEXT
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
+   st TEMP

    ; Compute 10's complement of key
    ld KEY
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
    
    ; Add 10's complements
+   addm TEMP
    jc +
    cmpi #9
    jnc ++
+   addi #6
    
    ; Done with decryption
++  st DECODED


; Plaintext 8, key 5, ciphertext (20 - 8 - 5) % 10 = 7, decrypted (20 - 7 - 5) % 10 = 8 

    lit #8          ; plaintext
    st PLAINTEXT
    lit #5          ; key
    st KEY
    
    ; Compute 10's complement of plaintext, store in TEMP
    ld PLAINTEXT
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
+   st TEMP

    ; Compute 10's complement of key
    ld KEY
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
    
    ; Add 10's complements
+   addm TEMP
    jc +
    cmpi #9
    jnc ++
+   addi #6
    
    ; Done with encryption
++  st CIPHERTEXT

    ; Compute 10's complement of ciphertext, store in TEMP
    ld CIPHERTEXT
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
+   st TEMP

    ; Compute 10's complement of key
    ld KEY
    nori #0         ; NOT, same as 16's complement
    addi #11
    cmpi #10
    jnz +
    lit #0
    
    ; Add 10's complements
+   addm TEMP
    jc +
    cmpi #9
    jnc ++
+   addi #6
    
    ; Done with decryption
++  st DECODED


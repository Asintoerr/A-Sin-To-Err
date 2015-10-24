; RC5 encryption

#define OPERAND_A           $0 ; 32 bits = 8 nibbles
#define OPERAND_B           $8 ; 32 bits = 8 nibbles
                               ; 32 bits = 8 nibbles empty
#define ROTL_COUNT         $18 ; 5 bits = 2 nibbles
#define BUFFER_VARIABLE    $1a ; 1 nibble
                               ; 6 nibbles empty

#define RC5_A              $20 ; 32 bits = 8 nibbles
#define RC5_B              $28 ; 32 bits = 8 nibbles

#define CTR_NONCE          $30 ; 32 bits = 8 nibbles
#define CTR_COUNTER        $38 ; 32 bits = 8 nibbles

#define TODO_LIST_A        $40 ; 21 nibbles
                               ; 11 nibbles empty
#define TODO_LIST_B        $60 ; 21 nibbles
                               ; 11 nibbles empty
#define TODO_LIST_AA       $80 ; 21 nibbles
                               ; 11 nibbles empty
#define TODO_LIST_BB       $a0 ; 21 nibbles
                               ; 11 nibbles empty

#define EXPANDED_KEY_TABLE $c0 ; 34 32 bit words = 272 nibbles
    lit #$0
    st EXPANDED_KEY_TABLE+33
    st EXPANDED_KEY_TABLE+38
    st EXPANDED_KEY_TABLE+44
    st EXPANDED_KEY_TABLE+50
    st EXPANDED_KEY_TABLE+73
    st EXPANDED_KEY_TABLE+92
    st EXPANDED_KEY_TABLE+135
    st EXPANDED_KEY_TABLE+193
    st EXPANDED_KEY_TABLE+205
    st EXPANDED_KEY_TABLE+206
    st EXPANDED_KEY_TABLE+213
    st EXPANDED_KEY_TABLE+227
    st EXPANDED_KEY_TABLE+260
    lit #$1
    st EXPANDED_KEY_TABLE+11
    st EXPANDED_KEY_TABLE+31
    st EXPANDED_KEY_TABLE+63
    st EXPANDED_KEY_TABLE+65
    st EXPANDED_KEY_TABLE+86
    st EXPANDED_KEY_TABLE+89
    st EXPANDED_KEY_TABLE+94
    st EXPANDED_KEY_TABLE+103
    st EXPANDED_KEY_TABLE+120
    st EXPANDED_KEY_TABLE+129
    st EXPANDED_KEY_TABLE+157
    st EXPANDED_KEY_TABLE+176
    st EXPANDED_KEY_TABLE+191
    st EXPANDED_KEY_TABLE+198
    st EXPANDED_KEY_TABLE+225
    st EXPANDED_KEY_TABLE+229
    st EXPANDED_KEY_TABLE+236
    st EXPANDED_KEY_TABLE+239
    st EXPANDED_KEY_TABLE+251
    st EXPANDED_KEY_TABLE+265
    lit #$2
    st EXPANDED_KEY_TABLE+0
    st EXPANDED_KEY_TABLE+23
    st EXPANDED_KEY_TABLE+40
    st EXPANDED_KEY_TABLE+64
    st EXPANDED_KEY_TABLE+91
    st EXPANDED_KEY_TABLE+105
    st EXPANDED_KEY_TABLE+106
    st EXPANDED_KEY_TABLE+114
    st EXPANDED_KEY_TABLE+119
    st EXPANDED_KEY_TABLE+121
    st EXPANDED_KEY_TABLE+172
    st EXPANDED_KEY_TABLE+177
    st EXPANDED_KEY_TABLE+184
    st EXPANDED_KEY_TABLE+201
    st EXPANDED_KEY_TABLE+247
    st EXPANDED_KEY_TABLE+254
    st EXPANDED_KEY_TABLE+270
    lit #$3
    st EXPANDED_KEY_TABLE+74
    st EXPANDED_KEY_TABLE+82
    st EXPANDED_KEY_TABLE+88
    st EXPANDED_KEY_TABLE+100
    st EXPANDED_KEY_TABLE+117
    st EXPANDED_KEY_TABLE+138
    st EXPANDED_KEY_TABLE+149
    st EXPANDED_KEY_TABLE+159
    st EXPANDED_KEY_TABLE+164
    st EXPANDED_KEY_TABLE+169
    st EXPANDED_KEY_TABLE+189
    st EXPANDED_KEY_TABLE+202
    st EXPANDED_KEY_TABLE+226
    st EXPANDED_KEY_TABLE+253
    lit #$4
    st EXPANDED_KEY_TABLE+10
    st EXPANDED_KEY_TABLE+12
    st EXPANDED_KEY_TABLE+19
    st EXPANDED_KEY_TABLE+22
    st EXPANDED_KEY_TABLE+29
    st EXPANDED_KEY_TABLE+32
    st EXPANDED_KEY_TABLE+54
    st EXPANDED_KEY_TABLE+58
    st EXPANDED_KEY_TABLE+84
    st EXPANDED_KEY_TABLE+85
    st EXPANDED_KEY_TABLE+108
    st EXPANDED_KEY_TABLE+113
    st EXPANDED_KEY_TABLE+115
    st EXPANDED_KEY_TABLE+122
    st EXPANDED_KEY_TABLE+125
    st EXPANDED_KEY_TABLE+130
    st EXPANDED_KEY_TABLE+151
    st EXPANDED_KEY_TABLE+156
    st EXPANDED_KEY_TABLE+160
    st EXPANDED_KEY_TABLE+163
    st EXPANDED_KEY_TABLE+168
    st EXPANDED_KEY_TABLE+180
    st EXPANDED_KEY_TABLE+203
    st EXPANDED_KEY_TABLE+207
    st EXPANDED_KEY_TABLE+219
    st EXPANDED_KEY_TABLE+220
    st EXPANDED_KEY_TABLE+233
    st EXPANDED_KEY_TABLE+235
    st EXPANDED_KEY_TABLE+262
    st EXPANDED_KEY_TABLE+264
    st EXPANDED_KEY_TABLE+267
    lit #$5
    st EXPANDED_KEY_TABLE+14
    st EXPANDED_KEY_TABLE+24
    st EXPANDED_KEY_TABLE+46
    st EXPANDED_KEY_TABLE+57
    st EXPANDED_KEY_TABLE+67
    st EXPANDED_KEY_TABLE+71
    st EXPANDED_KEY_TABLE+79
    st EXPANDED_KEY_TABLE+80
    st EXPANDED_KEY_TABLE+95
    st EXPANDED_KEY_TABLE+139
    st EXPANDED_KEY_TABLE+171
    st EXPANDED_KEY_TABLE+178
    st EXPANDED_KEY_TABLE+209
    st EXPANDED_KEY_TABLE+237
    st EXPANDED_KEY_TABLE+258
    st EXPANDED_KEY_TABLE+261
    lit #$6
    st EXPANDED_KEY_TABLE+4
    st EXPANDED_KEY_TABLE+15
    st EXPANDED_KEY_TABLE+27
    st EXPANDED_KEY_TABLE+36
    st EXPANDED_KEY_TABLE+143
    st EXPANDED_KEY_TABLE+155
    st EXPANDED_KEY_TABLE+170
    st EXPANDED_KEY_TABLE+174
    st EXPANDED_KEY_TABLE+175
    st EXPANDED_KEY_TABLE+194
    st EXPANDED_KEY_TABLE+195
    st EXPANDED_KEY_TABLE+245
    st EXPANDED_KEY_TABLE+259
    lit #$7
    st EXPANDED_KEY_TABLE+7
    st EXPANDED_KEY_TABLE+8
    st EXPANDED_KEY_TABLE+13
    st EXPANDED_KEY_TABLE+49
    st EXPANDED_KEY_TABLE+61
    st EXPANDED_KEY_TABLE+68
    st EXPANDED_KEY_TABLE+72
    st EXPANDED_KEY_TABLE+78
    st EXPANDED_KEY_TABLE+81
    st EXPANDED_KEY_TABLE+102
    st EXPANDED_KEY_TABLE+133
    st EXPANDED_KEY_TABLE+154
    st EXPANDED_KEY_TABLE+158
    st EXPANDED_KEY_TABLE+185
    st EXPANDED_KEY_TABLE+230
    st EXPANDED_KEY_TABLE+244
    st EXPANDED_KEY_TABLE+250
    st EXPANDED_KEY_TABLE+266
    lit #$8
    st EXPANDED_KEY_TABLE+16
    st EXPANDED_KEY_TABLE+21
    st EXPANDED_KEY_TABLE+28
    st EXPANDED_KEY_TABLE+34
    st EXPANDED_KEY_TABLE+51
    st EXPANDED_KEY_TABLE+53
    st EXPANDED_KEY_TABLE+69
    st EXPANDED_KEY_TABLE+99
    st EXPANDED_KEY_TABLE+217
    st EXPANDED_KEY_TABLE+224
    st EXPANDED_KEY_TABLE+234
    st EXPANDED_KEY_TABLE+249
    lit #$9
    st EXPANDED_KEY_TABLE+1
    st EXPANDED_KEY_TABLE+3
    st EXPANDED_KEY_TABLE+48
    st EXPANDED_KEY_TABLE+55
    st EXPANDED_KEY_TABLE+59
    st EXPANDED_KEY_TABLE+87
    st EXPANDED_KEY_TABLE+136
    st EXPANDED_KEY_TABLE+150
    st EXPANDED_KEY_TABLE+152
    st EXPANDED_KEY_TABLE+181
    st EXPANDED_KEY_TABLE+199
    st EXPANDED_KEY_TABLE+221
    st EXPANDED_KEY_TABLE+222
    st EXPANDED_KEY_TABLE+223
    st EXPANDED_KEY_TABLE+240
    st EXPANDED_KEY_TABLE+246
    st EXPANDED_KEY_TABLE+255
    st EXPANDED_KEY_TABLE+257
    st EXPANDED_KEY_TABLE+263
    lit #$a
    st EXPANDED_KEY_TABLE+30
    st EXPANDED_KEY_TABLE+93
    st EXPANDED_KEY_TABLE+97
    st EXPANDED_KEY_TABLE+111
    st EXPANDED_KEY_TABLE+123
    st EXPANDED_KEY_TABLE+131
    st EXPANDED_KEY_TABLE+134
    st EXPANDED_KEY_TABLE+142
    st EXPANDED_KEY_TABLE+186
    st EXPANDED_KEY_TABLE+196
    st EXPANDED_KEY_TABLE+216
    st EXPANDED_KEY_TABLE+243
    lit #$b
    st EXPANDED_KEY_TABLE+39
    st EXPANDED_KEY_TABLE+96
    st EXPANDED_KEY_TABLE+98
    st EXPANDED_KEY_TABLE+110
    st EXPANDED_KEY_TABLE+116
    st EXPANDED_KEY_TABLE+161
    st EXPANDED_KEY_TABLE+165
    st EXPANDED_KEY_TABLE+182
    st EXPANDED_KEY_TABLE+187
    st EXPANDED_KEY_TABLE+212
    st EXPANDED_KEY_TABLE+214
    st EXPANDED_KEY_TABLE+218
    lit #$c
    st EXPANDED_KEY_TABLE+2
    st EXPANDED_KEY_TABLE+6
    st EXPANDED_KEY_TABLE+17
    st EXPANDED_KEY_TABLE+42
    st EXPANDED_KEY_TABLE+52
    st EXPANDED_KEY_TABLE+60
    st EXPANDED_KEY_TABLE+62
    st EXPANDED_KEY_TABLE+101
    st EXPANDED_KEY_TABLE+128
    st EXPANDED_KEY_TABLE+144
    st EXPANDED_KEY_TABLE+167
    st EXPANDED_KEY_TABLE+211
    st EXPANDED_KEY_TABLE+232
    st EXPANDED_KEY_TABLE+248
    st EXPANDED_KEY_TABLE+268
    lit #$d
    st EXPANDED_KEY_TABLE+20
    st EXPANDED_KEY_TABLE+26
    st EXPANDED_KEY_TABLE+45
    st EXPANDED_KEY_TABLE+75
    st EXPANDED_KEY_TABLE+83
    st EXPANDED_KEY_TABLE+107
    st EXPANDED_KEY_TABLE+109
    st EXPANDED_KEY_TABLE+124
    st EXPANDED_KEY_TABLE+127
    st EXPANDED_KEY_TABLE+132
    st EXPANDED_KEY_TABLE+140
    st EXPANDED_KEY_TABLE+166
    st EXPANDED_KEY_TABLE+173
    st EXPANDED_KEY_TABLE+188
    st EXPANDED_KEY_TABLE+190
    st EXPANDED_KEY_TABLE+204
    st EXPANDED_KEY_TABLE+210
    st EXPANDED_KEY_TABLE+242
    st EXPANDED_KEY_TABLE+256
    st EXPANDED_KEY_TABLE+271
    lit #$e
    st EXPANDED_KEY_TABLE+18
    st EXPANDED_KEY_TABLE+47
    st EXPANDED_KEY_TABLE+66
    st EXPANDED_KEY_TABLE+70
    st EXPANDED_KEY_TABLE+76
    st EXPANDED_KEY_TABLE+112
    st EXPANDED_KEY_TABLE+126
    st EXPANDED_KEY_TABLE+137
    st EXPANDED_KEY_TABLE+145
    st EXPANDED_KEY_TABLE+147
    st EXPANDED_KEY_TABLE+148
    st EXPANDED_KEY_TABLE+153
    st EXPANDED_KEY_TABLE+162
    st EXPANDED_KEY_TABLE+179
    st EXPANDED_KEY_TABLE+192
    st EXPANDED_KEY_TABLE+208
    st EXPANDED_KEY_TABLE+228
    st EXPANDED_KEY_TABLE+231
    st EXPANDED_KEY_TABLE+238
    st EXPANDED_KEY_TABLE+252
    lit #$f
    st EXPANDED_KEY_TABLE+5
    st EXPANDED_KEY_TABLE+9
    st EXPANDED_KEY_TABLE+25
    st EXPANDED_KEY_TABLE+35
    st EXPANDED_KEY_TABLE+37
    st EXPANDED_KEY_TABLE+41
    st EXPANDED_KEY_TABLE+43
    st EXPANDED_KEY_TABLE+56
    st EXPANDED_KEY_TABLE+77
    st EXPANDED_KEY_TABLE+90
    st EXPANDED_KEY_TABLE+104
    st EXPANDED_KEY_TABLE+118
    st EXPANDED_KEY_TABLE+141
    st EXPANDED_KEY_TABLE+146
    st EXPANDED_KEY_TABLE+183
    st EXPANDED_KEY_TABLE+197
    st EXPANDED_KEY_TABLE+200
    st EXPANDED_KEY_TABLE+215
    st EXPANDED_KEY_TABLE+241
    st EXPANDED_KEY_TABLE+269

#define EXPANDED_KEY_TABLE_A0 $c0
#define EXPANDED_KEY_TABLE_A1 $d0
#define EXPANDED_KEY_TABLE_A2 $e0
#define EXPANDED_KEY_TABLE_A3 $f0
#define EXPANDED_KEY_TABLE_A4 $100
#define EXPANDED_KEY_TABLE_A5 $110
#define EXPANDED_KEY_TABLE_A6 $120
#define EXPANDED_KEY_TABLE_A7 $130
#define EXPANDED_KEY_TABLE_A8 $140
#define EXPANDED_KEY_TABLE_A9 $150
#define EXPANDED_KEY_TABLE_A10 $160
#define EXPANDED_KEY_TABLE_A11 $170
#define EXPANDED_KEY_TABLE_A12 $180
#define EXPANDED_KEY_TABLE_A13 $190
#define EXPANDED_KEY_TABLE_A14 $1a0
#define EXPANDED_KEY_TABLE_A15 $1b0
#define EXPANDED_KEY_TABLE_A16 $1c0

#define EXPANDED_KEY_TABLE_B0 $c8
#define EXPANDED_KEY_TABLE_B1 $d8
#define EXPANDED_KEY_TABLE_B2 $e8
#define EXPANDED_KEY_TABLE_B3 $f8
#define EXPANDED_KEY_TABLE_B4 $108
#define EXPANDED_KEY_TABLE_B5 $118
#define EXPANDED_KEY_TABLE_B6 $128
#define EXPANDED_KEY_TABLE_B7 $138
#define EXPANDED_KEY_TABLE_B8 $148
#define EXPANDED_KEY_TABLE_B9 $158
#define EXPANDED_KEY_TABLE_B10 $168
#define EXPANDED_KEY_TABLE_B11 $178
#define EXPANDED_KEY_TABLE_B12 $188
#define EXPANDED_KEY_TABLE_B13 $198
#define EXPANDED_KEY_TABLE_B14 $1a8
#define EXPANDED_KEY_TABLE_B15 $1b8
#define EXPANDED_KEY_TABLE_B16 $1c8

    lit #0
    st TODO_LIST_A+0
    st TODO_LIST_A+1
    st TODO_LIST_A+2
    st TODO_LIST_A+3
    st TODO_LIST_A+4
    st TODO_LIST_A+5
    st TODO_LIST_A+6
    st TODO_LIST_A+7
    st TODO_LIST_A+8
    st TODO_LIST_A+9
    st TODO_LIST_A+10
    st TODO_LIST_A+11
    st TODO_LIST_A+12
    st TODO_LIST_A+13
    st TODO_LIST_A+14
    st TODO_LIST_A+15
    st TODO_LIST_A+16
    st TODO_LIST_A+17
    st TODO_LIST_A+18
    st TODO_LIST_A+19
    st TODO_LIST_A+20

    st TODO_LIST_B+0
    st TODO_LIST_B+1
    st TODO_LIST_B+2
    st TODO_LIST_B+3
    st TODO_LIST_B+4
    st TODO_LIST_B+5
    st TODO_LIST_B+6
    st TODO_LIST_B+7
    st TODO_LIST_B+8
    st TODO_LIST_B+9
    st TODO_LIST_B+10
    st TODO_LIST_B+11
    st TODO_LIST_B+12
    st TODO_LIST_B+13
    st TODO_LIST_B+14
    st TODO_LIST_B+15
    st TODO_LIST_B+16
    st TODO_LIST_B+17
    st TODO_LIST_B+18
    st TODO_LIST_B+19
    st TODO_LIST_B+20

    st TODO_LIST_AA+0
    st TODO_LIST_AA+1
    st TODO_LIST_AA+2
    st TODO_LIST_AA+3
    st TODO_LIST_AA+4
    st TODO_LIST_AA+5
    st TODO_LIST_AA+6
    st TODO_LIST_AA+7
    st TODO_LIST_AA+8
    st TODO_LIST_AA+9
    st TODO_LIST_AA+10
    st TODO_LIST_AA+11
    st TODO_LIST_AA+12
    st TODO_LIST_AA+13
    st TODO_LIST_AA+14
    st TODO_LIST_AA+15
    st TODO_LIST_AA+16
    st TODO_LIST_AA+17
    st TODO_LIST_AA+18
    st TODO_LIST_AA+19
    st TODO_LIST_AA+20

    st TODO_LIST_BB+0
    st TODO_LIST_BB+1
    st TODO_LIST_BB+2
    st TODO_LIST_BB+3
    st TODO_LIST_BB+4
    st TODO_LIST_BB+5
    st TODO_LIST_BB+6
    st TODO_LIST_BB+7
    st TODO_LIST_BB+8
    st TODO_LIST_BB+9
    st TODO_LIST_BB+10
    st TODO_LIST_BB+11
    st TODO_LIST_BB+12
    st TODO_LIST_BB+13
    st TODO_LIST_BB+14
    st TODO_LIST_BB+15
    st TODO_LIST_BB+16
    st TODO_LIST_BB+17
    st TODO_LIST_BB+18
    st TODO_LIST_BB+19
    st TODO_LIST_BB+20

cycle_start:
;  for (uint32_t i = 1; i <= 20; i++) { // loop unrolled below

;  A = pin[0] + expaned_key_table[0]; // i = 0
    ld TODO_LIST_A+0
    jnz +

    ld CTR_NONCE+0
    st OPERAND_A+0
    ld CTR_NONCE+1
    st OPERAND_A+1
    ld CTR_NONCE+2
    st OPERAND_A+2
    ld CTR_NONCE+3
    st OPERAND_A+3
    ld CTR_NONCE+4
    st OPERAND_A+4
    ld CTR_NONCE+5
    st OPERAND_A+5
    ld CTR_NONCE+6
    st OPERAND_A+6
    ld CTR_NONCE+7
    st OPERAND_A+7

    ld EXPANDED_KEY_TABLE_A0+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A0+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A0+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A0+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A0+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A0+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A0+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A0+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+0
    jmp add32_into_rc5_a

;  B = pin[1] + expaned_key_table[1]; // i = 0
+   ld TODO_LIST_B+0
    jnz +

    ld CTR_COUNTER+0
    st OPERAND_A+0
    ld CTR_COUNTER+1
    st OPERAND_A+1
    ld CTR_COUNTER+2
    st OPERAND_A+2
    ld CTR_COUNTER+3
    st OPERAND_A+3
    ld CTR_COUNTER+4
    st OPERAND_A+4
    ld CTR_COUNTER+5
    st OPERAND_A+5
    ld CTR_COUNTER+6
    st OPERAND_A+6
    ld CTR_COUNTER+7
    st OPERAND_A+7

    ld EXPANDED_KEY_TABLE_B0+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B0+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B0+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B0+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B0+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B0+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B0+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B0+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+0
    jmp add32_into_rc5_b

;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 1 =============================
+   ld TODO_LIST_AA+1
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+1
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+1
    jnz +
    ld EXPANDED_KEY_TABLE_A1+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A1+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A1+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A1+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A1+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A1+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A1+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A1+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+1
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+1
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+1
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+1
    jnz +
    ld EXPANDED_KEY_TABLE_B1+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B1+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B1+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B1+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B1+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B1+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B1+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B1+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+1
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 2 =============================
+   ld TODO_LIST_AA+2
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+2
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+2
    jnz +
    ld EXPANDED_KEY_TABLE_A2+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A2+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A2+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A2+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A2+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A2+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A2+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A2+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+2
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+2
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+2
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+2
    jnz +
    ld EXPANDED_KEY_TABLE_B2+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B2+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B2+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B2+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B2+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B2+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B2+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B2+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+2
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 3 =============================
+   ld TODO_LIST_AA+3
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+3
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+3
    jnz +
    ld EXPANDED_KEY_TABLE_A3+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A3+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A3+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A3+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A3+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A3+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A3+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A3+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+3
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+3
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+3
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+3
    jnz +
    ld EXPANDED_KEY_TABLE_B3+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B3+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B3+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B3+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B3+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B3+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B3+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B3+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+3
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 4 =============================
+   ld TODO_LIST_AA+4
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+4
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+4
    jnz +
    ld EXPANDED_KEY_TABLE_A4+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A4+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A4+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A4+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A4+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A4+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A4+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A4+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+4
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+4
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+4
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+4
    jnz +
    ld EXPANDED_KEY_TABLE_B4+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B4+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B4+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B4+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B4+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B4+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B4+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B4+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+4
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 5 =============================
+   ld TODO_LIST_AA+5
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+5
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+5
    jnz +
    ld EXPANDED_KEY_TABLE_A5+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A5+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A5+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A5+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A5+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A5+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A5+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A5+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+5
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+5
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+5
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+5
    jnz +
    ld EXPANDED_KEY_TABLE_B5+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B5+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B5+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B5+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B5+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B5+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B5+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B5+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+5
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 6 =============================
+   ld TODO_LIST_AA+6
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+6
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+6
    jnz +
    ld EXPANDED_KEY_TABLE_A6+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A6+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A6+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A6+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A6+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A6+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A6+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A6+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+6
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+6
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+6
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+6
    jnz +
    ld EXPANDED_KEY_TABLE_B6+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B6+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B6+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B6+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B6+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B6+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B6+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B6+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+6
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 7 =============================
+   ld TODO_LIST_AA+7
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+7
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+7
    jnz +
    ld EXPANDED_KEY_TABLE_A7+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A7+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A7+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A7+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A7+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A7+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A7+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A7+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+7
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+7
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+7
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+7
    jnz +
    ld EXPANDED_KEY_TABLE_B7+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B7+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B7+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B7+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B7+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B7+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B7+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B7+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+7
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 8 =============================
+   ld TODO_LIST_AA+8
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+8
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+8
    jnz +
    ld EXPANDED_KEY_TABLE_A8+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A8+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A8+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A8+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A8+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A8+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A8+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A8+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+8
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+8
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+8
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+8
    jnz +
    ld EXPANDED_KEY_TABLE_B8+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B8+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B8+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B8+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B8+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B8+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B8+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B8+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+8
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 9 =============================
+   ld TODO_LIST_AA+9
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+9
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+9
    jnz +
    ld EXPANDED_KEY_TABLE_A9+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A9+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A9+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A9+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A9+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A9+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A9+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A9+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+9
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+9
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+9
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+9
    jnz +
    ld EXPANDED_KEY_TABLE_B9+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B9+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B9+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B9+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B9+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B9+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B9+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B9+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+9
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 10 ============================
+   ld TODO_LIST_AA+10
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+10
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+10
    jnz +
    ld EXPANDED_KEY_TABLE_A10+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A10+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A10+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A10+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A10+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A10+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A10+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A10+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+10
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+10
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+10
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+10
    jnz +
    ld EXPANDED_KEY_TABLE_B10+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B10+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B10+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B10+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B10+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B10+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B10+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B10+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+10
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 11 ============================
+   ld TODO_LIST_AA+11
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+11
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+11
    jnz +
    ld EXPANDED_KEY_TABLE_A11+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A11+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A11+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A11+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A11+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A11+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A11+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A11+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+11
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+11
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+11
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+11
    jnz +
    ld EXPANDED_KEY_TABLE_B11+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B11+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B11+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B11+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B11+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B11+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B11+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B11+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+11
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 12 ============================
+   ld TODO_LIST_AA+12
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+12
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+12
    jnz +
    ld EXPANDED_KEY_TABLE_A12+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A12+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A12+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A12+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A12+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A12+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A12+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A12+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+12
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+12
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+12
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+12
    jnz +
    ld EXPANDED_KEY_TABLE_B12+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B12+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B12+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B12+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B12+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B12+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B12+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B12+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+12
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 13 ============================
+   ld TODO_LIST_AA+13
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+13
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+13
    jnz +
    ld EXPANDED_KEY_TABLE_A13+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A13+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A13+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A13+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A13+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A13+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A13+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A13+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+13
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+13
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+13
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+13
    jnz +
    ld EXPANDED_KEY_TABLE_B13+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B13+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B13+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B13+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B13+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B13+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B13+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B13+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+13
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 14 ============================
+   ld TODO_LIST_AA+14
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+14
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+14
    jnz +
    ld EXPANDED_KEY_TABLE_A14+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A14+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A14+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A14+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A14+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A14+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A14+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A14+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+14
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+14
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+14
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+14
    jnz +
    ld EXPANDED_KEY_TABLE_B14+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B14+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B14+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B14+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B14+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B14+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B14+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B14+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+14
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 15 ============================
+   ld TODO_LIST_AA+15
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+15
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+15
    jnz +
    ld EXPANDED_KEY_TABLE_A15+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A15+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A15+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A15+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A15+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A15+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A15+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A15+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+15
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+15
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+15
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+15
    jnz +
    ld EXPANDED_KEY_TABLE_B15+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B15+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B15+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B15+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B15+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B15+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B15+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B15+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+15
    jmp add32_into_rc5_b
    
;    A = rotl(A ^ B, B) + expaned_key_table[2 * i]; // i = 16 ============================
+   ld TODO_LIST_AA+16
    jnz +

    ld RC5_B+0
    st ROTL_COUNT+0
    ld RC5_B+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_AA+16
    jmp xor_rotl_into_a

+   ld TODO_LIST_A+16
    jnz +
    ld EXPANDED_KEY_TABLE_A16+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_A16+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_A16+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_A16+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_A16+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_A16+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_A16+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_A16+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_A+16
    jmp add32_into_rc5_a

;    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
+   ld TODO_LIST_BB+16
    jnz +

    ld RC5_A+0
    st ROTL_COUNT+0
    ld RC5_A+1
    st ROTL_COUNT+1

    lit #1
    st TODO_LIST_BB+16
    jmp xor_rotl_into_a

+   ld TODO_LIST_B+16
    jnz +
    ld EXPANDED_KEY_TABLE_B16+0
    st OPERAND_B+0
    ld EXPANDED_KEY_TABLE_B16+1
    st OPERAND_B+1
    ld EXPANDED_KEY_TABLE_B16+2
    st OPERAND_B+2
    ld EXPANDED_KEY_TABLE_B16+3
    st OPERAND_B+3
    ld EXPANDED_KEY_TABLE_B16+4
    st OPERAND_B+4
    ld EXPANDED_KEY_TABLE_B16+5
    st OPERAND_B+5
    ld EXPANDED_KEY_TABLE_B16+6
    st OPERAND_B+6
    ld EXPANDED_KEY_TABLE_B16+7
    st OPERAND_B+7

    lit #1
    st TODO_LIST_B+16
    jmp add32_into_rc5_b
+    
;  } // end of unrolled round loop

    jmp halt

add32_into_rc5_a:

+++ ld OPERAND_A+0
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
    
    ld OPERAND_A+3       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+3
    st RC5_A+3
    jmp +++ 
+   ld OPERAND_A+3
++  addm OPERAND_B+3
    st RC5_A+3
    jnc +

    ld OPERAND_A+4       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+4
    st RC5_A+4
    jmp +++ 
+   ld OPERAND_A+4
++  addm OPERAND_B+4
    st RC5_A+4
    jnc +

    ld OPERAND_A+5       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+5
    st RC5_A+5
    jmp +++ 
+   ld OPERAND_A+5
++  addm OPERAND_B+5
    st RC5_A+5
    jnc +

    ld OPERAND_A+6       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+6
    st RC5_A+6
    jmp +++ 
+   ld OPERAND_A+6
++  addm OPERAND_B+6
    st RC5_A+6
    jnc +

    ld OPERAND_A+7       ;--------------
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

+++ ld OPERAND_A+0
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
    
    ld OPERAND_A+3       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+3
    st RC5_B+3
    jmp +++ 
+   ld OPERAND_A+3
++  addm OPERAND_B+3
    st RC5_B+3
    jnc +

    ld OPERAND_A+4       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+4
    st RC5_B+4
    jmp +++ 
+   ld OPERAND_A+4
++  addm OPERAND_B+4
    st RC5_B+4
    jnc +

    ld OPERAND_A+5       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+5
    st RC5_B+5
    jmp +++ 
+   ld OPERAND_A+5
++  addm OPERAND_B+5
    st RC5_B+5
    jnc +

    ld OPERAND_A+6       ;--------------
    addi #1
    jnc ++
    ld OPERAND_B+6
    st RC5_B+6
    jmp +++ 
+   ld OPERAND_A+6
++  addm OPERAND_B+6
    st RC5_B+6
    jnc +

    ld OPERAND_A+7       ;--------------
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
    
halt:
    jmp halt

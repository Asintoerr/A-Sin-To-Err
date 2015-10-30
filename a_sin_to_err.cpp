// Input: 
//   8 digit nonce followed by plaintext or cyphertext digits
//
// Output:
//   8 digit nonce followed by cyphertext or plaintext digits
//
// When called with any argument, instead of performing encryption generates Nibbler 
// assembly code for expanded key.
//
#include <stdio.h>
#include <inttypes.h>
#include <cstdint>
#include <set>

// Use different key, preferably obtained by flipping a coin 128 times
static unsigned char key[16] = { 0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
                                 0x20, 0x20, 0x20, 0xde, 0xad, 0xfa, 0xca, 0xde
                               };

std::uint32_t rotl(std::uint32_t v, std::uint32_t shift)
{
  shift =  shift % 32;
  return (v << shift) | (v >> (32 - shift));
}

const uint8_t r = 16; // rounds
const uint8_t t = 2 * (r + 1); // the number of words in the expanded key table
uint32_t expanded_key_table[t];

void rc5_setup(unsigned char *key_bytes)
{
   const uint8_t w = 32; // word length in bits. Block is two words.
   const uint8_t b = 16; // key length in bytes
   const uint8_t c = 4;  // RFC: (b + w/8 - 1) / (w/8) = (16 + 4 - 1) / 4 = 4
   
   uint32_t i, j, k, u = w/8, A, B, key_words[c];
   key_words[c - 1] = 0;
   for (i = b - 1; i != -1; i--) {
      key_words[i/u] = (key_words[i/u] << 8) + key_bytes[i];
   }
   
   expanded_key_table[0] = 0xB7E15163;
   for (i = 1; i < t; i++) {
      expanded_key_table[i] = expanded_key_table[i - 1] + 0x9E3779B9;
   }
   
   A = B = i = j = 0;

   for (k = 0; k < 3 * t; k++)
   {
      A = expanded_key_table[i] = rotl(expanded_key_table[i] + (A + B), 3);
      B = key_words[j] = rotl(key_words[j] + (A + B), (A + B));
      i = (i + 1) % t;
      j = (j + 1) % c;
   }
}

void rc5_encrypt(uint32_t *pin, uint32_t *pout)
{
  uint32_t A = pin[0] + expanded_key_table[0];
//fprintf(stderr, "A0=0x%08x+0x%08x=0x%08x\n",pin[0],expanded_key_table[0],A);
  uint32_t B = pin[1] + expanded_key_table[1];
//fprintf(stderr, "B0=0x%08x+0x%08x=0x%08x\n",pin[1],expanded_key_table[1],B);
  for (uint32_t i = 1; i <= r; i++) {
//fprintf(stderr, "A%d = rotl(0x%08x ^ 0x%08x = 0x%08x, 0x%08x) + 0x%08x = 0x%08x + 0x%08x = 0x%08x\n", 
//                   i,         A,       B,     A ^ B,  B, expanded_key_table[2 * i], rotl(A ^ B, B), expanded_key_table[2 * i], rotl(A ^ B, B) + expanded_key_table[2 * i]);
    A = rotl(A ^ B, B) + expanded_key_table[2 * i];
//fprintf(stderr, "B%d = rotl(0x%08x ^ 0x%08x= 0x%08x, 0x%08x) + 0x%08x = 0x%08x + 0x%08x = 0x%08x\n", 
//                   i,         B,       A,    B ^ A,   A, expanded_key_table[2 * i + 1], rotl(B ^ A, A), expanded_key_table[2 * i + 1], rotl(B ^ A, A) + expanded_key_table[2 * i + 1]);
    B = rotl(B ^ A, A) + expanded_key_table[2 * i + 1];
  }
  pout[0] = A;
  pout[1] = B;
//fprintf(stderr, "%08x %08x -> %08x %08x\n",pin[0],pin[1],pout[0],pout[1]);
}

void emit(char c)
{
  static int count = 0;
  if (c < '0' || c > '9') {
    fprintf(stderr, "Generated invalid character code %d\n", c);
    return;
  }
  putchar(c);
  switch (++count) {
    case  4: putchar(' '); break;
    case  8: putchar(' '); break;
    case 12: putchar(' '); break;
    case 16: putchar(' '); putchar(' '); break;
    case 20: putchar(' '); break;
    case 24: putchar(' '); break;
    case 28: putchar(' '); break;
    case 32: putchar('\n'); count = 0; break;
  }
}

int main(int argc, char* argv[])
{
  rc5_setup(&key[0]);
  
  if (argc > 1) {
    // Nibbler assembly code generation 
    printf("; Automatically generated code follows, see a_sin_to_err.cpp =============================\n"
           "\n"    
           "    ld TODO_LIST_A+0\n"
           "    jnz +\n"
           "\n");
    for (int i = 0; i < 8; i++) {
      printf("    ld CTR_NONCE+%d\n", i);
      printf("    st OPERAND_A+%d\n", i);
    }
    printf("\n");
    for (int i = 0; i < 8; i++) {
      printf("    lit #$%x\n", (expanded_key_table[0] >> (i * 4)) & 0xf);
      printf("    st OPERAND_B+%d\n", i);
    }
    printf("\n"
           "    lit #1\n"
           "    st TODO_LIST_A+0\n"
           "    jmp add32_into_rc5_a\n"
           "\n");
    printf("+   ld TODO_LIST_B+0\n"
           "    jnz +\n"
           "\n");
    for (int i = 0; i < 8; i++) {
      printf("    ld CTR_COUNTER+%d\n", i);
      printf("    st OPERAND_A+%d\n", i);
    }
    printf("\n");
    for (int i = 0; i < 8; i++) {
      printf("    lit #$%x\n", (expanded_key_table[1] >> (i * 4)) & 0xf);
      printf("    st OPERAND_B+%d\n", i);
    }
    printf("\n"
           "    lit #1\n"
           "    st TODO_LIST_B+0\n"
           "    jmp add32_into_rc5_b\n"
           "\n");
    for (int j = 1; j <= 16; j++) {
      printf("; Round %d\n"
             "\n", j);
      printf("+   ld TODO_LIST_AA+%d\n"
             "    jnz +\n"
             "\n"
             "    ld RC5_B+0\n"
             "    st ROTL_COUNT+0\n"
             "    ld RC5_B+1\n"
             "    st ROTL_COUNT+1"
             "\n"
             "    lit #1\n"
             "    st TODO_LIST_AA+%d\n"
             "    jmp xor_rotl_into_a\n"
             "\n"
             "+   ld TODO_LIST_A+%d\n"
             "    jnz +\n\n", j, j, j);
      for (int i = 0; i < 8; i++) {
        printf("    lit #$%x\n", (expanded_key_table[j * 2] >> (i * 4)) & 0xf);
        printf("    st OPERAND_B+%d\n", i);
      }
      printf("\n"
             "    lit #1\n"
             "    st TODO_LIST_A+%d\n"
             "    jmp add32_into_rc5_a\n"
             "\n", j);
      printf("+   ld TODO_LIST_BB+%d\n"
             "    jnz +\n"
             "\n"
             "    ld RC5_A+0\n"
             "    st ROTL_COUNT+0\n"
             "    ld RC5_A+1\n"
             "    st ROTL_COUNT+1"
             "\n"
             "    lit #1\n"
             "    st TODO_LIST_BB+%d\n"
             "    jmp xor_rotl_into_a\n"
             "\n"
             "+   ld TODO_LIST_B+%d\n"
             "    jnz +\n\n", j, j, j);
      for (int i = 0; i < 8; i++) {
        printf("    lit #$%x\n", (expanded_key_table[j * 2 + 1] >> (i * 4)) & 0xf);
        printf("    st OPERAND_B+%d\n", i);
      }
      printf("\n"
             "    lit #1\n"
             "    st TODO_LIST_B+%d\n"
             "    jmp add32_into_rc5_b\n"
             "\n", j);
    }
    printf("+   jmp got_next_key_digit"
           "\n"
           "; End of automatically generated code ====================================================\n");
    return 0;
  }

fprintf(stderr, "expanded key table 0: %08x %08x\n", expanded_key_table[0], expanded_key_table[1]);
fprintf(stderr, "expanded key table 1: %08x %08x\n", expanded_key_table[2], expanded_key_table[3]);
fprintf(stderr, "expanded key table 2: %08x %08x\n", expanded_key_table[4], expanded_key_table[5]);

  uint32_t text[2] = { 0 }; // text[0] is nonce, text[1] is counter for CTR mode
  int c;
  for (int i = 0; i < 8; ) {
    c = getchar();
    switch (c) {
      case EOF:
        fprintf(stderr, "Nonce too short (expected 8 digits, got %d)\n", i);
        return -3;
      case '1': case '2': case '3': case '4': case '5': 
      case '6': case '7': case '8': case '9': case '0':
        text[0] |= (c - '0') << i * 4;
        i++;
        emit(c);
        break;
      case ' ': case '\n': case '\r': case '\t':
        break;
      default:
        fprintf(stderr, "Expected nonce digit, got %c\n", c);
        return -4;
    }
  }
//  fprintf(stderr, "Nonce: %08x\n", text[0]);

  uint32_t stream[2] = { 0 };
  while ((c = getchar()) != EOF) {
    switch (c) {
      case EOF:
        putchar('\n');
        return 0;
        
      case '1': case '2': case '3': case '4': case '5': 
      case '6': case '7': case '8': case '9': case '0':
        // Generate next keystream digit: increment counter, then encrypt nonce+counter
        // with RC5. Lowest nibble of the result is next keystream digit. If it's
        // not a valid decimal, discard and repeat the process.
        //
        // This approach wastes a lot of key material, but requires less code
        // which is important for Nibbler.
        int digit;
        for (;;) {
          text[1]++;
          rc5_encrypt(text, stream);
          digit = stream[0] & 0xf;
          if (digit < 10) {
            break;
          }
        }
        
        // Encrypt plaintext digit (or decrypt ciphertext digit) by adding their 10's
        // complements modulo 10. This process is symmetric and reversible.
//fprintf(stderr, "%d %d %d\n", digit, c - '0', (20 - digit - (c - '0')) % 10);
        digit = (20 - digit - (c - '0')) % 10;
        emit(digit + '0');
        break;
        
      case ' ': case '\n': case '\r': case '\t':
        break; // Ignore whitespace
        
      default:
        fprintf(stderr, "Expected plaintext digit, got %c\n", c);
        return -5;
    }
  }
}

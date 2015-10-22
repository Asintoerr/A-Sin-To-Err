// Input: 
//   30 digit key, then
//   5 digit nonce, then
//   plaintext (cyphertext) digits
//
// Output:
//   5 digit nonce, then
//   cyphertext (plaintext) digits

#include <stdio.h>
#include <inttypes.h>
#include <cstdint>

std::uint32_t rotl(std::uint32_t v, std::uint32_t shift)
{
  shift =  shift % 32;
  return (v << shift) | (v >> (32 - shift));
}

const uint8_t r = 20; // rounds
const uint8_t t = 2 * (r + 1); // the number of words in the expanded key table
uint32_t expaned_key_table[t];

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
   
   expaned_key_table[0] = 0xB7E15163;
   for (i = 1; i < t; i++) {
      expaned_key_table[i] = expaned_key_table[i - 1] + 0x9E3779B9;
   }
   
   A = B = i = j = 0;

   for (k = 0; k < 3 * t; k++)
   {
      A = expaned_key_table[i] = rotl(expaned_key_table[i] + (A + B), 3);
      B = key_words[j] = rotl(key_words[j] + (A + B), (A + B));
      i = (i + 1) % t;
      j = (j + 1) % c;
   }
}

void rc5_encrypt(uint32_t *pin, uint32_t *pout)
{
  uint32_t A = pin[0] + expaned_key_table[0];
  uint32_t B = pin[1] + expaned_key_table[1];
  for (uint32_t i = 1; i <= r; i++) {
    A = rotl(A ^ B, B) + expaned_key_table[2 * i];
    B = rotl(B ^ A, A) + expaned_key_table[2 * i + 1];
  }
  pout[0] = A;
  pout[1] = B;
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
    case  5: putchar(' '); break;
    case 10: putchar(' '); putchar(' '); break;
    case 15: putchar(' '); break;
    case 20: putchar(' '); break;
    case 25: putchar('\n'); count = 0; break;
  }
}

int main(void)
{
  unsigned char key[16] = {0};
  int c;
  for (int i = 0; i < 30; ) {
    c = getchar();
    switch (c) {
      case EOF:
        fprintf(stderr, "Key too short (expected 30 digits, got %d)\n", i);
        return -1;
      case '1': case '2': case '3': case '4': case '5': 
      case '6': case '7': case '8': case '9': case '0':
        if (i & 1) {
          key[i >> 1] |= (c - '0') << 4;
        } else {
          key[i >> 1] |= (c - '0');
        }
        i++;
        break;
      case ' ': case '\n': case '\r': case '\t':
        break;
      default:
        fprintf(stderr, "Expected key digit, got %c\n", c);
        return -2;
    }
  }
//  fprintf(stderr, "Key: %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x %02x %02x\n",
//   key[0], key[1], key[2], key[3], key[4], key[5], key[6], key[7], key[8], key[9], key[10], key[11], key[12], key[13], key[14], key[15]
//  );
  rc5_setup(&key[0]);

  uint32_t text[2] = { 0 }; // text[0] is nonce, text[1] is counter for CTR mode
  for (int i = 0; i < 5; ) {
    c = getchar();
    switch (c) {
      case EOF:
        fprintf(stderr, "Nonce too short (expected 5 digits, got %d)\n", i);
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
  int nibbles_left = 0;
  while ((c = getchar()) != EOF) {
    switch (c) {
      case EOF:
        putchar('\n');
        return 0;
      case '1': case '2': case '3': case '4': case '5': 
      case '6': case '7': case '8': case '9': case '0':
        int digit;
        for (;;) {
          if (!nibbles_left) {
            rc5_encrypt(text, stream);
            text[1]++;
            nibbles_left = 16; // 2 32 bit words = 16 4 bit nibbles
          }
          nibbles_left--;
          if (nibbles_left > 8) {
            digit = (stream[0] >> ((nibbles_left - 8) * 4)) & 0xf;
          } else {
            digit = (stream[1] >> (nibbles_left * 4)) & 0xf;
          }
          if (digit < 10) {
            break;
          }
        } 
//fprintf(stderr, "%d %d %d\n", digit, c - '0', (20 - digit - (c - '0')) % 10);
        digit = (20 - digit - (c - '0')) % 10;
        emit(digit + '0');
        break;
      case ' ': case '\n': case '\r': case '\t':
        break;
      default:
        fprintf(stderr, "Expected plaintext digit, got %c\n", c);
        return -5;
    }
  }
}

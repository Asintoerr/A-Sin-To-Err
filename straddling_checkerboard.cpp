#include <stdio.h>
#include <string.h>

static void encrypt(int d)
{
  static unsigned pos_in_group = 0;
  printf("%d", d);
  pos_in_group++;
  if (pos_in_group % 5 == 0) {
    printf(" ");
  }
  if (pos_in_group % 25 == 10) {
    printf(" ");
  }
  if (pos_in_group % 25 == 0) {
    printf("\n");
  }
}

int main(int argc, char* argv[])
{
  bool numeral = false;

  // Straddling checkerboard
  //
  //   0 1 2 3 4 5 6 7 8 9
  //   A   S I N   T O E R
  // 1 B C D F G H J K L M
  // 5 P Q U V W X Y Z . /

  int c = getchar();
  if (c == EOF) {
    return -1;
  }
  if ('0' <= c && c <= '9') { // decrypt
    char prev_c = 0;
    do {
      if (c == ' ') continue;
      if (c == '\n') continue;
      if (c == '\r') continue;
      if (c == '\t') continue;
      if (c < '0' || c > '9') {
        printf( "Expected digit in key, got %c (0x%x)\n", c, c);
        return -2;
      }
      if (numeral) {
        if (prev_c == 0) {
          prev_c = c;
          continue;
        }
        if (c == prev_c) {
          putchar(c);
          prev_c = 0;
          continue;
        }
        if (prev_c == '5' && c == '9') {
          numeral = false;
          prev_c = 0;
          continue;
        }
        printf( "Broken numeral\n");
        break;
      }
      switch (prev_c) {
        case '1':
          if (c >= '0' || c <= '9') {
            putchar("BCDFGHJKLM"[c - '0']);
          }
          prev_c = 0;
          break;
        case '5':
          if (c == '9') {
            numeral = true;
          } else if (c >= '0' || c <= '8') {
            putchar("PQUVWXYZ."[c - '0']);
          }
          prev_c = 0;
          break;
        case 0:
          switch (c) {
            case '0': putchar('A'); break;
            case '1': prev_c = c; break;
            case '2': putchar('S'); break;
            case '3': putchar('I'); break;
            case '4': putchar('N'); break;
            case '5': prev_c = c; break;
            case '6': putchar('T'); break;
            case '7': putchar('O'); break;
            case '8': putchar('E'); break;
            case '9': putchar('R'); break;
            default: printf( "Expected number, got %c\n", c); return -3;
          }
          break;
        default:
          printf( "Unexpected internal state %c\n", prev_c); return -4;
          break;
      }
    } while ((c = getchar()) != EOF);  
  } else { // encrypt
    do {
      if (numeral && (c < '0' || c > '9')) {
        encrypt(5); encrypt(9);
        numeral = false;
      }
      switch (c) {
        case ' ': break;
        case '\n': break;
        case '\r': break;
        case '\t': break;
        case 'A': case 'a': encrypt(0); break;
        case 'B': case 'b': encrypt(1); encrypt(0); break;
        case 'C': case 'c': encrypt(1); encrypt(1); break;
        case 'D': case 'd': encrypt(1); encrypt(2); break;
        case 'E': case 'e': encrypt(8); break;
        case 'F': case 'f': encrypt(1); encrypt(3); break;
        case 'G': case 'g': encrypt(1); encrypt(4); break;
        case 'H': case 'h': encrypt(1); encrypt(5); break;
        case 'I': case 'i': encrypt(3); break;
        case 'J': case 'j': encrypt(1); encrypt(6); break;
        case 'K': case 'k': encrypt(1); encrypt(7); break;
        case 'L': case 'l': encrypt(1); encrypt(8); break;
        case 'M': case 'm': encrypt(1); encrypt(9); break;
        case 'N': case 'n': encrypt(4); break;
        case 'O': case 'o': encrypt(7); break;
        case 'P': case 'p': encrypt(5); encrypt(0); break;
        case 'Q': case 'q': encrypt(5); encrypt(1); break;
        case 'R': case 'r': encrypt(9); break;
        case 'S': case 's': encrypt(2); break;
        case 'T': case 't': encrypt(6); break;
        case 'U': case 'u': encrypt(5); encrypt(2); break;
        case 'V': case 'v': encrypt(5); encrypt(3); break;
        case 'W': case 'w': encrypt(5); encrypt(4); break;
        case 'X': case 'x': encrypt(5); encrypt(5); break;
        case 'Y': case 'y': encrypt(5); encrypt(6); break;
        case 'Z': case 'z': encrypt(5); encrypt(7); break;
        case '.':           encrypt(5); encrypt(8); break;
        case '0': case '1': case '2': case '3': case '4':
        case '5': case '6': case '7': case '8': case '9':
          if (!numeral) {
            encrypt(5); encrypt(9);
            numeral = true;
          }
          encrypt(c - '0');
          encrypt(c - '0');
          break;      
        default: printf( "Unsupported character %c (0x%x)\n", c, c); return -5;
      }
    } while ((c = getchar()) != EOF);
  } 
  printf("\n");
  return 0;
}

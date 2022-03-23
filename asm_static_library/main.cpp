#include <stdio.h>

// Assembly Function Declarations
extern "C" void asm_print_hello();

int main (int argc, char *argv[]) {
   asm_print_hello();
}

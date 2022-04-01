#include <stdio.h>
#include <stdint.h>

// jai function declarations
extern "C" int32_t foo();

// Assembly Function Declarations
extern "C" void asm_print_hello(void);
extern "C" int asm_signed_multiply(int, int);
extern "C" uint64_t asm_euler001_sum_of_multiples(uint64_t);

int main (int argc, char *argv[]) {
   asm_print_hello();

   const int a = 3;
   const int b = 5;
   int c = asm_signed_multiply(a, b);
   printf("%d * %d = %d\n\n", a, b, c);

   uint64_t loop_count = 1000;
   uint64_t result = asm_euler001_sum_of_multiples(loop_count);
   printf("001. sum of multiples of 3 and 5: %ld\n", result);

   printf("jai_lib::foo returned %d\n", foo());
}

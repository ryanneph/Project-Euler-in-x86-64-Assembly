#include <stdio.h>
#include <stdint.h>

typedef uint8_t  byte;
typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef int8_t   s8;
typedef int16_t  s16;
typedef int32_t  s32;
typedef int64_t  s64;

//
// asm function definitions
//
extern "C" u32 euler001__asm(u32 count);


int main(int arg_count, char *args[]) {
   // 001
   u32 loop_count = 1000;
   u32 result = euler001__asm(loop_count);
   printf("001. sum of multiples of 3 and 5: %u\n", result);
}

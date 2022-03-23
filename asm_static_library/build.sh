#!/bin/bash
set -eou pipefail

nasm -f elf64 \
  asm_lib.asm

g++ -static main.cpp asm_lib.o -o test

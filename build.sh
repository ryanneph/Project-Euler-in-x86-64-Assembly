#!/bin/bash
set -euo pipefail

CXX=clang++
OUT=./build_output

mkdir -p "$OUT"

# assemble library
nasm -f elf64 -g -F dwarf -O0 -wall \
  -o $OUT/libasm.a  lib.asm
echo -e "\"libasm.a\" build succeeded."

# build executable + link library
$CXX -g -Wall -Werror -static \
  -o $OUT/main  main.cpp $OUT/libasm.a
echo -e "\"main\" build succeeded."

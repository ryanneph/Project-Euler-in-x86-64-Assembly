#!/bin/bash
set -eou pipefail

OUT=./build_output

mkdir -p $OUT

nasm -f elf64 -o $OUT/libasm.a lib.asm

touch $OUT/libjai.a # TODO: remove after jai-linux update
jai first.jai

# pthread needs to be linked to make jai_lib happy
g++ -static -o $OUT/main \
  main.cpp $OUT/libasm.a $OUT/libjai.a \
  -lpthread

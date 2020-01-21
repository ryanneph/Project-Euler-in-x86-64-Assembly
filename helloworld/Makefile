

.PHONY: all test debug helloworld
all: helloworld

helloworld:
	nasm -o helloworld.o -g -felf32 helloworld.asm
	ld -m elf_i386 -o helloworld helloworld.o
	rm helloworld.o

test:
	./helloworld

debug:
	gdb -q ./helloworld

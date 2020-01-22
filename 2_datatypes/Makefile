src = $(wildcard *.asm)
obj = $(src:.asm=.o)
exe = $(obj:.o=)
NASMFLAGS = -g -felf32
LDFLAGS = -m elf_i386

.PHONY: all clean
all: $(exe)

${exe}: ${obj}
	@echo ">> linking object file $< to $@"
	ld ${LDFLAGS} -o $@ obj/$<

%.o: %.asm
	@echo ">> compiling asm file $< to $@"
	mkdir -p obj/
	nasm ${NASMFLAGS} -o obj/$@ $<

clean:
	rm -rf obj/ ${exe}

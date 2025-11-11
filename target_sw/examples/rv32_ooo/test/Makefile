all: test.out

clean:
	rm -rf test.out
	rm -rf *.o

temp.o: test.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zbb_zifencei -o temp.o test.s

entry.o: entry.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zbb_zifencei -o entry.o entry.s

test.out: entry.o temp.o
	riscv32-unknown-elf-ld --no-warn-rwx-segments -Tlinker.ld entry.o temp.o -o test.out
	rm *.o

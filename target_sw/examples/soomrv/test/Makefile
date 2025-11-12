all: add.out

clean:
	rm -rf add.out
	rm -rf *.o

temp.o: add.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zfinx_zba_zbb_zbs_zicbom_zifencei -o temp.o add.s

entry.o: entry.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zfinx_zba_zbb_zbs_zicbom_zifencei -o entry.o entry.s

add.out: entry.o temp.o
	riscv32-unknown-elf-ld --no-warn-rwx-segments -Tlinker.ld entry.o temp.o -o add.out
	rm *.o

temp_bad.o: add.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zfinx_zba_zbb_zbs_zicbom_zifencei -o temp_bad.o add_bad.s

add_bad.out: entry.o temp_bad.o
	riscv32-unknown-elf-ld --no-warn-rwx-segments -Tlinker.ld entry.o temp_bad.o -o add_bad.out
	rm *.o

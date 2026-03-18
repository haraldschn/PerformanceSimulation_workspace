NAME=manual3

all: $(NAME)

clean:
	rm -rf $(NAME).out
	rm -rf *.o

temp.o: $(NAME).s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zbb_zifencei -o temp.o $(NAME).s

entry.o: entry.s
	riscv32-unknown-elf-as -mabi=ilp32 -march=rv32ima_zicsr_zbb_zifencei -o entry.o entry.s

$(NAME): entry.o temp.o
	riscv32-unknown-elf-ld --no-warn-rwx-segments -Tlinker.ld entry.o temp.o -o $(NAME)
	rm -rf *.o
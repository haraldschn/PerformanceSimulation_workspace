_estack = 0x1FFFC;
MEMORY
{
    ram : ORIGIN = 0x00008000, LENGTH = 0x00008000
}
SECTIONS
{
    .text : { *(.text*) } > ram
    .data : ALIGN(4) { *(.bss*); *(.rodata*); *(.data*); *(.sdata*); *(.srodata*) } > ram
} 

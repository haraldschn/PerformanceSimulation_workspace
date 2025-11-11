_estack = 0x1FFFC;
MEMORY
{
    ram : ORIGIN = 0x80000000, LENGTH = 0x08000000
}

SECTIONS
{
  /* ================ ROM ================ */

  .text : {
    KEEP(*(.text._start))
    *(.text .text.* )
  }  > ram

  .rodata : ALIGN(4) {
    *(.rodata .rodata.*)
  } > ram
  .srodata : ALIGN(4) {
    *(.srodata .srodata.*)
  } > ram



  /* ================ RAM ================ */

  .init_array : ALIGN(4) {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(.init_array .init_array.*))
    PROVIDE_HIDDEN (__init_array_end = .);
  } > ram
  .fini_array : ALIGN(4) {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(.fini_array .fini_array.*))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } > ram

  .gcc_except_table : ALIGN(4) {
    *(.gcc_except_table .gcc_except_table.*)
  } > ram

  .eh_frame : ALIGN(4) {
    KEEP (*(.eh_frame))
  } > ram

  __data_start = .;
  .data : ALIGN(4) {
      *(.data .data.*)
  } > ram
  __sdata_start = .;
  .sdata : ALIGN(4) {
      *(.sdata .sdata.*)
  } > ram

  __bss_start = .;
  .sbss : ALIGN(4) {
      *(.sbss .sbss.*)
  } > ram
  .bss : ALIGN(4) {
      *(.bss .bss.*)
  } > ram
  _end = .;

  /* do not place anything after this address, because the heap starts here! */

  /* point the global pointer so it can access sdata, sbss, data and bss */
  __global_pointer$ = MIN(__sdata_start + 0x800, MAX(__data_start + 0x800, _end - 0x800));

  # Stack region
  . = ALIGN(16);
  PROVIDE(_init_stack_top = . + 0x1000);

  # Heap region
  PROVIDE(_kernel_heap_bottom = _init_stack_top);
  PROVIDE(_kernel_heap_top = ORIGIN(RAM) + LENGTH(RAM));
  PROVIDE(_kernel_heap_size = _kernel_heap_top - _kernel_heap_bottom);
}

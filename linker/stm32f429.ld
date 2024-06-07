/*
 * STM32F429 Linker file
 */

ENTRY(Reset_Handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 2M
  RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 192K
  CCM (xrw)  : ORIGIN = 0x10000000, LENGTH = 64K
}

__ram_start = ORIGIN(RAM);
__ram_size = LENGTH(RAM);
__ram_end = __ram_start + __ram_size;

__stack_size = 0x2000;

SECTIONS
{
    . = 0;
    __mem_begin = .;

    .text : {
        KEEP(*(.vectors .vectors.*))
        *(.text)
        *(.text.*)
    } >FLASH

    .bss (NOLOAD) : {
        __bss_begin = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    } >RAM

    .data : {
        *(.data*)
    } >RAM AT >FLASH

    .stack (NOLOAD) : {
        . = ALIGN(8);
        __stack_begin = .;
        /* Allocate space for stack */
        . = . + __stack_size;
        __stack_end = .;
        . = ALIGN(8);
    } >RAM

    __mem_end = .;
}

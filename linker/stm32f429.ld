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

SECTIONS
{
    .text : {
        *(.VectorTable)
        *(.text)
    } >FLASH

    .data : {
        . = . + 0x400;
        _stack_end = .;
        *(.data)
    } >RAM
}

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

/* highest address of user mode stack */
_stack_end = ORIGIN(RAM) + LENGTH(RAM);

_heap_size = 0x200;
_stack_size = 0x400;

SECTIONS
{
    .isr_vector : {
        KEEP(*(.isr_vector))
    } >FLASH

    .text : {
        . = ALIGN(4);
        *(.text)           /* .text sections (code) */
        *(.text*)          /* .text* sections (code) */
        *(.glue_7)         /* glue arm to thumb code */
        *(.glue_7t)        /* glue thumb to arm code */
        *(.eh_frame)

        KEEP (*(.init))
        KEEP (*(.fini))

        . = ALIGN(4);
        _text_end = .;        /* define a global symbols at end of code */
    } >FLASH

    /* Constant data into "ROM" Rom type memory */
    .rodata : {
        . = ALIGN(4);
        *(.rodata)         /* .rodata sections (constants, strings, etc.) */
        *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
        . = ALIGN(4);
    } >FLASH

    /* ARM extensions */

    .ARM.extab : {
        . = ALIGN(4);
        *(.ARM.extab* .gnu.linkonce.armextab.*)
        . = ALIGN(4);
    } >FLASH

    .ARM : {
        . = ALIGN(4);
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
        . = ALIGN(4);
    } >FLASH

    .preinit_array : {
        . = ALIGN(4);
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP (*(.preinit_array*))
        PROVIDE_HIDDEN (__preinit_array_end = .);
        . = ALIGN(4);
    } >FLASH

    .init_array : {
        . = ALIGN(4);
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP (*(SORT(.init_array.*)))
        KEEP (*(.init_array*))
        PROVIDE_HIDDEN (__init_array_end = .);
        . = ALIGN(4);
    } >FLASH

    .fini_array : {
        . = ALIGN(4);
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP (*(SORT(.fini_array.*)))
        KEEP (*(.fini_array*))
        PROVIDE_HIDDEN (__fini_array_end = .);
        . = ALIGN(4);
    } >FLASH

    _init_data = LOADADDR(.data);

    .data : {
        . = ALIGN(4);
        _data_begin = .;

        *(.data)
        *(.data*)

        _data_end = .;
        . = ALIGN(4);
    } >RAM AT >FLASH

    .ccmram : {
        . = ALIGN(4);
        _ccm_start = .;       /* create a global symbol at ccmram start */

        *(.ccmram)
        *(.ccmram*)

        . = ALIGN(4);
        _ccm_end = .;       /* create a global symbol at ccmram end */
    } >CCM AT> FLASH

    /* Uninitialized data section into "RAM" Ram type memory */
    . = ALIGN(4);
    .bss : {
        /* This is used by the startup in order to initialize the .bss section */
        _bss_begin = .;         /* define a global symbol at bss start */
        __bss_start__ = _bss_begin;
        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        _bss_end = .;         /* define a global symbol at bss end */
        __bss_end__ = _bss_end;
    } >RAM

    /* User_heap_stack section, used to check that there is enough "RAM" Ram  type memory left */
    ._user_heap_stack : {
        . = ALIGN(8);
        PROVIDE ( end = . );
        PROVIDE ( _end = . );
        . = . + _heap_size;
        . = . + _stack_size;
        . = ALIGN(8);
    } >RAM

    /* Remove information from the compiler libraries */
    /DISCARD/ :
    {
        libc.a ( * )
        libm.a ( * )
        libgcc.a ( * )
    }

    .ARM.attributes 0 : { *(.ARM.attributes) }
}

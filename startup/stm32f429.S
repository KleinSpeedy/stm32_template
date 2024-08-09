/*
 * Startup file STM32F429 microcontroller
 */

#define STACK_FILL_PATTERN  0xDEADBEEF

#define CPACR_ADDR 0xE000ED88

#define CPACR_SET_CP10 (1 << 21) | (1 << 20)
#define CPACR_SET_CP11 (1 << 23) | (1 << 22)

#define FPCCR_ASPEN (1 << 31)
#define FPCCR_LSPEN (1 << 30)

.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.word __stack_end
.word Reset_Handler

.section .text.Reset_Handler
.type Reset_Handler, %function
.global Reset_Handler
Reset_Handler:

    /* Mask interrupts initially */
    cpsid   i

    /* set stack pointer */
    ldr sp, =__stack_end

    /* Initialize core system modules */

    /* activate unpriviliged mode for FPU  */
    ldr r0, =CPACR_ADDR
    ldr r1, [r0]
    orr r1, r1, #(CPACR_SET_CP10 | CPACR_SET_CP11)
    str r1, [r0]
    dsb
    isb // reset pipeline now that FPU is enabled

    /* RCC is not configured */
    /* Vector table isnt placed in SRAM, offset is 0 */

    /* Fill stack with pattern */
    ldr r0, =STACK_FILL_PATTERN
    ldr r1, =__stack_begin
    ldr r2, =__stack_end

/* Stack fill loop */
sfloop:
    cmp r1, r2
    itt lo
    strlo r0, [r1], #4
    blo sfloop

   /* Zero out bss section */
    movs r0, #0
    ldr r1, =__bss_begin
    ldr r2, =__bss_end

/* bss section zeroing loop */
bssfloop:
    cmp r1, r2
    itt lo
    strlo r0, [r1], #4
    blo bssfloop

    /* Enable interrupts */
    cpsie i

    /* Main function call */
    bl main

    /* Default exit handler */
    b __exit

.size Reset_Handler, .-Reset_Handler

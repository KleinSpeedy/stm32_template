.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.word _stack_end
.word Reset_Handler
.space 0xe4

.text
.type Reset_Handler, %function
.global Reset_Handler
Reset_Handler:
    /*
        TODO Stack init
        TODO Interrupt mask
        TODO Early and late init
        TODO Exit handler
    */

    /* Mask interrupts */
    cpsid   i

    bl main

    b __exit

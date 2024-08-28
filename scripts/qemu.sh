#!/bin/sh

#
# Run qemu and print UART to serial console
#

set +eux

QEMU=qemu-system-arm

if ! command -v $QEMU >/dev/null 2>&1
then
    echo "Requires $QEMU"
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Wrong usage, pass firmware file argument"
    exit 1
fi

FIRMWARE=$1

if [ ! -f $FIRMWARE ]; then
    echo "$FIRMWARE not found"
    exit 1
fi

$QEMU -nographic \
    -serial mon:stdio \
    -chardev socket,id=c1,path=/tmp/qemuc1.sock,server=on,wait=off,mux=on \
    -serial chardev:c1 \
    -serial chardev:c1 \
    -serial chardev:c1 \
    -d guest_errors,trace:stm32f429_gpio_read,trace:stm32f429_gpio_write,trace:stm32f429_gpio_update_lckr \
    -M stm32f429-thesis-device -kernel $FIRMWARE

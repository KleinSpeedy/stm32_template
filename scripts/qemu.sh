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

$QEMU -nodefaults -nographic \
    -serial mon:stdio \
    -s -S \
    -M stm32f429-thesis-device -kernel $FIRMWARE

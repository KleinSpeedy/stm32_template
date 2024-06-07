#!/bin/sh

#
# Helper script for running project configured gdb
#

set +eux

if ! command -v gdb-multiarch >/dev/null 2>&1
then
    echo "Requires gdb-multiarch"
    exit 1
fi

SRC_DIR=$(pwd)

if [ $# -ne 1 ]; then
    echo "Specify symbols file"
    exit 1
fi

ELF_FILE="$1"
OPTS_FILE="$SRC_DIR/util/gdbopts.init"

if [ ! -f $ELF_FILE ]; then
    echo "Could not load firmware"
    exit 1
fi

if [ ! -f $OPTS_FILE ]; then
    echo "Could not load gdb options"
    exit 1
fi

gdb-multiarch $ELF_FILE --command="$OPTS_FILE" -ex="target remote localhost:1234"

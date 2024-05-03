#!/bin/sh

set +eux

meson --cross-file stm32f429_cross_file.txt build

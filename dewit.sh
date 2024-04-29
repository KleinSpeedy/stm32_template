#!/bin/sh

set +eux

meson --cross-file cross_compile.txt build

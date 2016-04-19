#!/bin/bash

# Settings for the get-env.sh and setup-env.sh scripts

TOOLCHAIN_DIR=$TOP_DIR/toolchain
THIRD_DIR=$TOP_DIR/third_party
CONDA_DIR=$TOOLCHAIN_DIR/conda

ARCH=${ARCH:-lm32}

BINUTILS_VERSION=2.26
GCC_VERSION=4.9.3
SDCC_VERSION=3.5.0
OPENOCD_VERSION=0.10.0-dev

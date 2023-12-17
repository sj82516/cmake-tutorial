#!/bin/bash

BUILD_DIR=/tmp/build_external_lib_calc

rm -rf $BUILD_DIR

# compile external lib first
EXTERNAL_CALC_BUILD_DIR="$BUILD_DIR/external_calc"
mkdir -p $EXTERNAL_CALC_BUILD_DIR
cmake -B $EXTERNAL_CALC_BUILD_DIR -S ./external_calc
cmake --build $EXTERNAL_CALC_BUILD_DIR
cmake --install $EXTERNAL_CALC_BUILD_DIR\
    --prefix "$BUILD_DIR/external_calc_install"

# find the external package in main program
EXTERNAL_MAIN_BUILD_DIR="$BUILD_DIR/main"
mkdir -p $EXTERNAL_MAIN_BUILD_DIR
cmake -B $EXTERNAL_MAIN_BUILD_DIR -S ./main\
    -DEXTERNAL_CALC_INSTALL_DIR="$BUILD_DIR/external_calc_install"
cmake --build $EXTERNAL_MAIN_BUILD_DIR
cmake --install $EXTERNAL_MAIN_BUILD_DIR --prefix "$BUILD_DIR/main_install"
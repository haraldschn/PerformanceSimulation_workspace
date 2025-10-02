#!/bin/bash

# Iterate over all files in the test_programs directory
TARGET=rv32_4issue
#TARGET=cv32e40p
#TARGET=cva6

rm -rf temp
rm -rf asm_trace
rm -rf timing_trace

mkdir temp
mkdir asm_trace
mkdir timing_trace

PROGRAM=./scripts/run.sh
directory=target_sw/examples/$TARGET/embench/*
for file in $directory; do
    # Get the base name of the file
    base=$(basename "$file")

    echo "Running $PROGRAM with $base"
    #$PROGRAM em:"$base" "$TARGET" > "temp/${base}.log" 2>&1
    $PROGRAM em:"$base" "$TARGET" "-ta=asm_trace" "-tp=timing_trace" > "temp/${base}.log" 2>&1
    mkdir temp/${base}
    mv asm_trace temp/${base}/asm_trace
    rm timing_trace/*trace*
    mv timing_trace temp/${base}/timing_trace
    mkdir asm_trace
    mkdir timing_trace
    # read -p "Press enter to continue"
done
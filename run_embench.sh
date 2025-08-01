#!/bin/bash

# Iterate over all files in the test_programs directory
TARGET=rv32_4issue
#TARGET=cv32e40p
#TARGET=cva6

PROGRAM=./scripts/run.sh
directory=target_sw/examples/$TARGET/embench/*
for file in $directory; do
    # Get the base name of the file
    base=$(basename "$file")

    echo "Running $PROGRAM with $base"
    $PROGRAM em:"$base" "$TARGET" > "temp/${base}.log" 2>&1
done
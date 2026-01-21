#!/bin/bash

echo "1. Compile separate units to Bitcode..."
clang -emit-llvm -c library.c -o library.bc
clang -emit-llvm -c main.c -o main.bc

echo "2. Link them together using llvm-link..."
# This is how Link Time Optimization (LTO) starts - merging modules.
llvm-link main.bc library.bc -o linked.bc

echo "3. Run the linked bitcode..."
lli linked.bc
echo "Exit code: $?"

echo "4. (Optional) Disassemble to see the merged IR..."
llvm-dis linked.bc -o linked.ll
echo "Check linked.ll to see that main() and math_func() are now in one file!"

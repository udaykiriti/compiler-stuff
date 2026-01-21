#!/bin/bash

# 1. Compile C to human-readable LLVM IR
echo "Generating LLVM IR from C..."
clang -S -emit-llvm source.c -o source.ll

# 2. Compile C to binary bitcode
echo "Generating Bitcode..."
clang -c -emit-llvm source.c -o source.bc

# 3. Optimize the IR
# Watch how the IR changes (e.g., look for the removal of 'z = x * 0')
echo "Optimizing..."
opt -S -O2 source.ll -o optimized.ll

# 4. Run the handwritten IR directly (using the interpreter)
echo "Running manual.ll..."
lli manual.ll
echo "Exit code (should be 15): $?"

# 5. Convert manual IR to assembly for your machine
echo "Compiling manual IR to Assembly..."
llc manual.ll -o manual.s

echo "Done! Check the 'examples' folder for the generated files."

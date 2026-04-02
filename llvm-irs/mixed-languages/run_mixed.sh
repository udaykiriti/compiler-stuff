#!/bin/bash

echo "--- Generating LLVM IR for C ---"
clang -S -emit-llvm example.c -o example_c.ll
echo "Generated example_c.ll"

echo ""
echo "--- Generating LLVM IR for C++ ---"
clang++ -S -emit-llvm example.cpp -o example_cpp.ll
echo "Generated example_cpp.ll"

echo ""
echo "--- Generating LLVM IR for Rust ---"
if command -v rustc &> /dev/null; then
    rustc --emit=llvm-ir example.rs -o example_rust.ll
    echo "Generated example_rust.ll"
else
    echo "Rust compiler (rustc) not found. Skipping Rust."
fi

echo ""
echo "--- Java & Python Information ---"
echo "Java (javac) produces JVM Bytecode (.class), NOT LLVM IR by default."
echo "To get LLVM IR from Java, you need tools like GraalVM."
echo ""
echo "Python is interpreted. To get LLVM IR, you need JIT compilers like Numba."
echo "See example.py comments for Numba usage."

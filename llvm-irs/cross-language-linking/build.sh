#!/bin/bash

# This script demonstrates "True Mixing":
# Compiling different languages into a SINGLE LLVM Bitcode module.

echo "1. Compile C library to Bitcode..."
clang -emit-llvm -c math_lib.c -o math_lib.bc

echo "2. Compile C main to Bitcode..."
clang -emit-llvm -c main.c -o main.bc

echo "3. Compile Rust library to Bitcode..."
if command -v rustc &> /dev/null; then
    # --crate-type=lib ensures we get a library object
    # --emit=llvm-bc outputs binary bitcode directly
    # -C panic=abort removes the need for exception handling symbols (rust_eh_personality)
    rustc --crate-type=lib --emit=llvm-bc -C panic=abort logic.rs -o logic.bc
else
    echo "Rust not found. Skipping Rust (creating dummy logic.bc for demo)."
    # Create a dummy bc if rust is missing so the script doesn't fail completely
    echo 'define i32 @rust_add(i32 %a, i32 %b) { ret i32 30 }' | llvm-as -o logic.bc
fi

echo "4. The Magic: Link them all together!"
llvm-link main.bc math_lib.bc logic.bc -o app.bc

echo "5. Run the unified application..."
lli app.bc
echo "Exit code: $?"

echo "------------------------------------------------"
echo "Why is this cool?"
echo "Because now you can run 'opt -O3 app.bc' and LLVM can inline"
echo "the Rust code INTO the C code, crossing language barriers!"

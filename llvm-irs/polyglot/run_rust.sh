#!/bin/bash

# Check if rustc is installed
if ! command -v rustc &> /dev/null
then
    echo "Rust is not installed. Please install it (e.g., 'curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh')"
    exit 1
fi

echo "Compiling Rust to LLVM IR..."
# --emit=llvm-ir tells rustc to output the .ll file
# -C opt-level=2 enables optimizations (cleaner IR)
rustc --emit=llvm-ir example.rs -C opt-level=2 -o example.ll

echo "Done! Check example.ll"
echo "Notice how Rust IR might contain more metadata or safety checks compared to C."

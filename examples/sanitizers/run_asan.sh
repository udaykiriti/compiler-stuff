#!/bin/bash

echo "1. Compile WITHOUT Sanitizer..."
clang buggy.c -o buggy_normal
echo "Running buggy_normal (might crash, might not)..."
./buggy_normal
echo "Exit code: $?"

echo ""
echo "---------------------------------------------------"
echo "2. Compile WITH AddressSanitizer (ASan)..."
# -fsanitize=address instructs Clang/LLVM to instrument the IR
# with checks for every memory access.
clang -fsanitize=address -g buggy.c -o buggy_asan

echo "Running buggy_asan (should report error)..."
./buggy_asan

echo ""
echo "Notice the detailed error report above!"

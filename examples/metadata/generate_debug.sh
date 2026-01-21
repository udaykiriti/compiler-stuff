#!/bin/bash

# 1. Compile with -g (debug info)
clang -S -emit-llvm -g debug_me.c -o debug_me.ll

echo "Generated debug_me.ll"
echo "Search for '!DICompileUnit' or '!DILocalVariable' in the file."
echo "These lines map IR instructions back to 'debug_me.c' line numbers."

#!/bin/bash
echo "Dumping the Clang Abstract Syntax Tree (AST)..."
echo "Look for 'FunctionDecl', 'ParmVarDecl', and 'IfStmt'."
echo "---------------------------------------------------"

# -Xclang -ast-dump tells Clang to print the internal tree
clang -Xclang -ast-dump -fsyntax-only ast_demo.c

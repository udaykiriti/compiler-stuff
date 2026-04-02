#!/bin/bash

# Check if llvm-tblgen is installed
if ! command -v llvm-tblgen &> /dev/null
then
    echo "llvm-tblgen not found. It might be in /usr/lib/llvm-<version>/bin/"
    echo "Trying to find it..."
    TBLGEN=$(find /usr/lib/llvm* -name llvm-tblgen 2>/dev/null | head -n 1)
    
    if [ -z "$TBLGEN" ]; then
        echo "Could not find llvm-tblgen. Please install llvm-dev."
        exit 1
    fi
else
    TBLGEN="llvm-tblgen"
fi

echo "Using: $TBLGEN"
echo "Processing target.td..."

echo "------------------------------------------------"
echo "1. Print Records:"
$TBLGEN target.td

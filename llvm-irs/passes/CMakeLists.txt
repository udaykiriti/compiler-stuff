cmake_minimum_required(VERSION 3.13)
project(HelloPass)

# Find the LLVM libraries
find_package(LLVM REQUIRED CONFIG)

# Add the location of LLVM's CMake modules to the path
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)

# Add preprocessor definitions and include directories from LLVM
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

# Define the shared library (the Pass)
# MODULE means it's a plugin loaded at runtime
add_llvm_library(HelloPass MODULE
  HelloPass.cpp
  PLUGIN_TOOL opt
)

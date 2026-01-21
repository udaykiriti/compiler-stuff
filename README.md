# LLVM Deep Dive

A structured repository for learning the internals of the LLVM compiler infrastructure. This project covers core concepts, the three-phase architecture, LLVM Intermediate Representation (IR) syntax, and practical examples of optimization and control flow.

## Project Structure

### Documentation (docs/)
- **[llvm.txt](docs/llvm.txt)**: Essential commands for `clang`, `opt`, `llc`, and more.
- **[how_llvm_works.txt](docs/how_llvm_works.txt)**: Deep dive into the Frontend, Middle-end, and Backend architecture.
- **[llvm_ir_syntax.txt](docs/llvm_ir_syntax.txt)**: A guide to LLVM IR types, memory models, and SSA (Static Single Assignment).
- **[textbooks.txt](docs/textbooks.txt)**: Recommended reading list for mastering LLVM and compiler design.

### Practical Examples (examples/)
The examples are categorized to guide your learning from basic to advanced:

1.  **[basics/](examples/basics/)**: The standard compilation pipeline.
    - `source.c`: C code with optimization opportunities.
    - `run.sh`: Automates the generation of `.ll`, `.bc`, and `.s` files.
2.  **[control-flow/](examples/control-flow/)**: Branching and Loops.
    - `loop.ll`: Demonstrates the use of `phi` nodes in SSA form.
3.  **[structs/](examples/structs/)**: Memory Layout.
    - `structs.ll`: Detailed look at `getelementptr` (GEP) and global structs.
4.  **[vectorization/](examples/vectorization/)**: Performance.
    - `vectorize_me.c`: Example for exploring auto-vectorization and SIMD.
5.  **[passes/](examples/passes/)**: Extensibility.
    - `HelloPass.cpp`: Source code for a custom LLVM Function Pass.
6.  **[frontend/](examples/frontend/)**: Clang Internals.
    - `ast_demo.c` & `dump_ast.sh`: Visualize the Abstract Syntax Tree (AST) that Clang builds before generating IR.
7.  **[intrinsics/](examples/intrinsics/)**: Built-in Functions.
    - `intrinsics.ll`: Using `llvm.ctpop` (population count) and `llvm.memcpy`.
8.  **[metadata/](examples/metadata/)**: Debug Information.
    - `debug_me.c`: Generating IR with DWARF debug metadata (`-g`).
9.  **[linking-lto/](examples/linking-lto/)**: Link Time Optimization.
    - `run_lto.sh`: Shows how to use `llvm-link` to merge multiple bitcode files into one module before optimization.
10. **[inline-asm/](examples/inline-asm/)**: Low-Level Access.
    - `asm.ll`: How to embed native assembly (like `rdtsc`) directly inside LLVM IR.
11. **[polyglot/](examples/polyglot/)**: Other Languages.
    - `example.rs` & `run_rust.sh`: Demonstrating how Rust generates LLVM IR (`rustc --emit=llvm-ir`).
12. **[mixed-languages/](examples/mixed-languages/)**: Multi-Language Setup.
    - `example.c`, `example.cpp`, `example.rs`: Comparison of IR generated from different compiled languages.
    - `example.py`, `Example.java`: Explanations of how interpreted/JVM languages relate to LLVM.
13. **[cross-language-linking/](examples/cross-language-linking/)**: Project Integration.
    - `build.sh`: A complete example of linking C and Rust code into a single executable module.
    - `integration_guide.txt`: High-level vs Low-level (IR Linking) integration strategies.
14. **[sanitizers/](examples/sanitizers/)**: Instrumentation.
    - `buggy.c`: A C program with a memory leak/overflow.
    - `run_asan.sh`: Using `-fsanitize=address` to automatically detect memory bugs.
15. **[tablegen/](examples/tablegen/)**: Backend Definitions.
    - `target.td`: An example of TableGen language used to define Registers and Instructions in LLVM backends.

---

## Getting Started

### Prerequisites
You will need the LLVM toolchain installed (LLVM, Clang).

**Option A: Local Installation (Ubuntu/Debian)**
```bash
sudo apt-get install llvm clang cmake build-essential
```

**Option B: Docker (Recommended if you don't want to install locally)**
I have included a Dockerfile to create a ready-to-use environment.
```bash
# Build the image
docker build -t llvm-box .

# Run the container (mounting your current folder)
docker run -it -v $(pwd):/llvm-learning llvm-box
```

### Exploring the Code
1.  **Understand the Flow**: Read `docs/how_llvm_works.txt`.
2.  **Run the Basics**:
    ```bash
    cd examples/basics
    ./run.sh
    ```
3.  **Build the Custom Pass (Advanced)**:
    ```bash
    cd examples/passes
    mkdir build && cd build
    cmake ..
    make
    # Run the pass:
    # opt -load ./HelloPass.so -hello < ../../basics/source.bc > /dev/null
    ```

---

## Learning Objectives
- **Architecture**: Grasp why the modular design allows LLVM to support many languages and architectures.
- **IR Proficiency**: Learn to read and write LLVM IR, the "assembly" of compilers.
- **Optimizations**: See how the optimizer transforms code to improve performance.
- **Customization**: Learn the basics of writing your own compiler passes.

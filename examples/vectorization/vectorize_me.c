// A simple C program designed to be auto-vectorized by LLVM.
// Vectorization turns scalar operations (1 add at a time) into vector operations (4 or 8 adds at a time).

// To see vectorization in action:
// 1. Compile to IR:     clang -S -emit-llvm vectorize_me.c -o vec.ll -O1
// 2. Run Optimizer:     opt -S -p loop-vectorize vec.ll -o vec_opt.ll
// 3. Look at vec_opt.ll: Search for instructions like <4 x float>

void add_arrays(float* a, float* b, float* c, int n) {
    // The 'restrict' keyword (or __restrict__) tells the compiler 
    // that pointers do not overlap, making it safe to vectorize.
    for (int i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
}

// Complex example: Math logic that might get vectorized
void math_heavy(float* data, int n) {
    for (int i = 0; i < n; ++i) {
        data[i] = (data[i] * 0.5f) + 2.0f;
    }
}

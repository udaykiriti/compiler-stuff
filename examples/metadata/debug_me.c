// Compile this with debug info to see Metadata in IR
// Command: clang -S -emit-llvm -g debug_me.c -o debug_me.ll

int main() {
    int secret_value = 42;
    return secret_value;
}

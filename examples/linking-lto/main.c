// main.c
// Declares the external function but doesn't define it.
int math_func(int);

int main() {
    return math_func(10); // Should return 20
}

// main.c
#include <stdio.h>

// Declare external functions
int c_multiply(int a, int b);
int rust_add(int a, int b);

int main() {
    int sum = rust_add(10, 20);
    int product = c_multiply(sum, 2);
    
    printf("Result: (10 + 20) * 2 = %d\n", product);
    return 0;
}

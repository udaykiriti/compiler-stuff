#include <stdio.h>

// A simple function to demonstrate arithmetic and optimization potential
int calculate(int a, int b) {
    int x = a + 5;
    int y = b * 2;
    // Dead code example (opt should remove this if unused)
    int z = x * 0; 
    
    if (x > y) {
        return x - y;
    } else {
        return y - x;
    }
}

int main() {
    int result = calculate(10, 20);
    printf("Result: %d\n", result);
    return 0;
}


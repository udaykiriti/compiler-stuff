#include <stdio.h>
#include <stdlib.h>

int main() {
    int *array = (int*)malloc(10 * sizeof(int));
    
    // BUG: Writing to index 10 (out of bounds, 0..9)
    // This is a "Heap Buffer Overflow"
    array[10] = 42; 

    printf("Value: %d\n", array[10]);
    
    free(array);
    return 0;
}


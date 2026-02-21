#include <stdio.h>

int calculate(int a, int b) {
   int x = a + 5;
   int y = b * 2;
   // Dead code example (opt should remove this if unused)
   // even if we dont remove it the llvm will take care of it 
   // it optimizes it...
   int z = x * 0; 
    
   if (x > y) {
     return x - y;
   } else {
     return y - x;
   }

   // return (x > y) ? (x - 5) : (y - x);
}

/*unsigned*/int main() {
    int res = calculate(10, 20);
    printf("Result: %d\n", res);
    return 0;
}


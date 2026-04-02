#include <stdio.h>

/*Its terrible */
int factorial(int n) {

  if(n < 0) return -1;

  return (n == 0 || n == 1) ? 1 : n * factorial(n - 1);
}

int main() {
    int num = 5;
    printf("Factorial of %d is %d\n", num, factorial(num));
    return 0;
}

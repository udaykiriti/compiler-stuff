#include <stdio.h>

int calculate(int a, int b) {
  int x = a + 5;
  int y = b * 2;
  int dead = x * 0;
  (void)dead;

  if (x > y) {
    return x - y;
  }

  return y - x;
}

int factorial(int n) {
  if (n < 0) {
    return -1;
  }

  return (n == 0 || n == 1) ? 1 : n * factorial(n - 1);
}

int main(void) {
  int calc_result = calculate(10, 20);
  int num = 5;

  printf("Result: %d\n", calc_result);
  printf("Factorial of %d is %d\n", num, factorial(num));

  return 0;
}

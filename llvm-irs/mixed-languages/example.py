def python_function():
    print("Hello from Python")

# To see LLVM IR from Python, you typically use Numba:
#
# from numba import jit
#
# @jit(nopython=True)
# def add(a, b):
#     return a + b
#
# print(add.inspect_llvm())

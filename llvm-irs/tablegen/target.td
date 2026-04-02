// TableGen (.td) is a language for defining records.
// LLVM uses it to define Instructions, Registers, and Attributes.

// Define a class 'Register'
class Register<string name, int idx> {
  string Name = name;
  int Index = idx;
}

// Define specific instances (Records)
def R0 : Register<"rax", 0>;
def R1 : Register<"rcx", 1>;
def R2 : Register<"rdx", 2>;

// Define an Instruction class
class Instruction<string mnemonic, Register dst, Register src> {
  string Mnemonic = mnemonic;
  Register Destination = dst;
  Register Source = src;
}

// Define an 'Add' instruction
def ADD_Reg : Instruction<"add", R0, R1>;

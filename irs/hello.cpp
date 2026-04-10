#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;


int main() {
  LLVMContext C;

  Module M("Hello World", C);

  Function *Main = Function::Create(
      FunctionType::get(Type::getInt32Ty(C), false),
      GlobalValue::ExternalLinkage, "main", M);

  IRBuilder<> B(C);

  // Instructions .
  BasicBlock *entry = BasicBlock::Create(C, "entry", Main);
  B.SetInsertPoint(entry);

  FunctionCallee puts = M.getOrInsertFunction(
      "puts",
      FunctionType::get(Type::getInt32Ty(C),
                        {PointerType::getUnqual(C)},
                        false));

  Value *String = B.CreateGlobalString("Hello World");

  B.CreateCall(puts, {String});

  B.CreateRet(B.getInt32(0));

  M.print(outs(), nullptr);
  return 0;
}

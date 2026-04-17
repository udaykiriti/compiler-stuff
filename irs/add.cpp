#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

int main() {
  LLVMContext C;
  Module M("Add Module", C);
  IRBuilder<> B(C);

  Function *AddNumbers = Function::Create(
      FunctionType::get(Type::getInt32Ty(C),
                        {Type::getInt32Ty(C), Type::getInt32Ty(C)}, false),
      GlobalValue::ExternalLinkage, "add_numbers", M);

  BasicBlock *addEntry = BasicBlock::Create(C, "entry", AddNumbers);
  B.SetInsertPoint(addEntry);

  auto argIt = AddNumbers->arg_begin();
  Value *a = argIt++;
  a->setName("a");
  Value *b = argIt++;
  b->setName("b");

  Value *sum = B.CreateAdd(a, b, "sum");
  B.CreateRet(sum);

  Function *Main = Function::Create(
      FunctionType::get(Type::getInt32Ty(C), false),
      GlobalValue::ExternalLinkage, "main", M);

  BasicBlock *mainEntry = BasicBlock::Create(C, "entry", Main);
  B.SetInsertPoint(mainEntry);

  Value *result = B.CreateCall(AddNumbers, {B.getInt32(10), B.getInt32(32)},
                               "result");
  B.CreateRet(result);

  M.print(outs(), nullptr);
  return 0;
}

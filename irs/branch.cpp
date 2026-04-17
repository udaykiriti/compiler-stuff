#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

int main() {
  LLVMContext C;
  Module M("Branch Module", C);
  IRBuilder<> B(C);

  Function *MaxValue = Function::Create(
      FunctionType::get(Type::getInt32Ty(C),
                        {Type::getInt32Ty(C), Type::getInt32Ty(C)}, false),
      GlobalValue::ExternalLinkage, "max_value", M);

  auto argIt = MaxValue->arg_begin();
  Value *a = argIt++;
  a->setName("a");
  Value *b = argIt++;
  b->setName("b");

  BasicBlock *entry = BasicBlock::Create(C, "entry", MaxValue);
  BasicBlock *thenBlock = BasicBlock::Create(C, "then", MaxValue);
  BasicBlock *elseBlock = BasicBlock::Create(C, "else", MaxValue);
  BasicBlock *mergeBlock = BasicBlock::Create(C, "merge", MaxValue);

  B.SetInsertPoint(entry);
  Value *cond = B.CreateICmpSGT(a, b, "is_a_greater");
  B.CreateCondBr(cond, thenBlock, elseBlock);

  B.SetInsertPoint(thenBlock);
  B.CreateBr(mergeBlock);

  B.SetInsertPoint(elseBlock);
  B.CreateBr(mergeBlock);

  B.SetInsertPoint(mergeBlock);
  PHINode *result = B.CreatePHI(Type::getInt32Ty(C), 2, "result");
  result->addIncoming(a, thenBlock);
  result->addIncoming(b, elseBlock);
  B.CreateRet(result);

  Function *Main = Function::Create(
      FunctionType::get(Type::getInt32Ty(C), false),
      GlobalValue::ExternalLinkage, "main", M);

  BasicBlock *mainEntry = BasicBlock::Create(C, "entry", Main);
  B.SetInsertPoint(mainEntry);
  Value *maxResult =
      B.CreateCall(MaxValue, {B.getInt32(17), B.getInt32(29)}, "max_result");
  B.CreateRet(maxResult);

  M.print(outs(), nullptr);
  return 0;
}

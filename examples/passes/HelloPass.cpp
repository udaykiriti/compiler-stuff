#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

// This is a minimal "Hello World" LLVM Pass.
// It prints the name of every function it compiles.

namespace {
  struct HelloPass : public FunctionPass {
    static char ID;
    HelloPass() : FunctionPass(ID) {}

    // runOnFunction is called for every function defined in the module
    bool runOnFunction(Function &F) override {
      if (F.hasName()) {
        errs() << "Hello: " << F.getName() << "\n";
      }
      // Return false because we didn't modify the code
      return false;
    }
  };
}

// Register the pass so it can be used by the 'opt' tool
char HelloPass::ID = 0;
static RegisterPass<HelloPass> X("hello", "Hello World Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);


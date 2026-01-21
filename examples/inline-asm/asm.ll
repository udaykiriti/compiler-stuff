; Inline Assembly in LLVM IR
; This allows you to embed target-specific assembly instructions directly.

define i32 @read_cycle_counter() {
entry:
  ; Call the 'rdtsc' instruction on x86 (Read Time-Stamp Counter)
  ; Syntax: call <return_type> asm [sideeffect] "assembly", "constraints"
  ; "=A" constraint means return value in EAX:EDX registers
  %tick = call i64 asm sideeffect "rdtsc", "=A,~{dirflag},~{fpsr},~{flags}"()
  
  ; Truncate 64-bit result to 32-bit just for this example
  %tick_32 = trunc i64 %tick to i32
  ret i32 %tick_32
}

define i32 @main() {
  %t1 = call i32 @read_cycle_counter()
  ret i32 %t1
}

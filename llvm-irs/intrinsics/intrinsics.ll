; LLVM Intrinsics are built-in functions provided by the compiler.
; They often map directly to special hardware instructions.

declare i32 @llvm.ctpop.i32(i32)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1)

define i32 @count_set_bits(i32 %n) {
  ; calls the hardware 'popcnt' instruction on x86
  %count = call i32 @llvm.ctpop.i32(i32 %n)
  ret i32 %count
}

define void @fast_copy(ptr %dest, ptr %src) {
  ; calls hardware optimized copy (like 'rep movs' on x86)
  ; args: dest, src, size (16 bytes), is_volatile (false)
  call void @llvm.memcpy.p0.p0.i64(ptr %dest, ptr %src, i64 16, i1 0)
  ret void
}

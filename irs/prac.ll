@s = private unnamed_addr constant [13 x i8] c"Hello World\0A\00"

declare i32 @printf(ptr, ...)

define i32 @add(i32 %x, i32 %y) {
a:
  %z = add i32 %x, %y
  ret i32 %z
}

define i32 @sub(i32 %x, i32 %y) {
a:
  %z = sub i32 %x, %y
  ret i32 %z
}

define i32 @mul(i32 %x, i32 %y) {
a:
  %z = mul i32 %x, %y
  ret i32 %z
}

define i32 @main() {
a:
  %p = getelementptr inbounds [13 x i8], ptr @s, i32 0, i32 0
  call i32 (ptr, ...) @printf(ptr %p)

  %b = call i32 @add(i32 10, i32 5)
  %c = call i32 @sub(i32 10, i32 5)
  %d = call i32 @mul(i32 10, i32 5)
  %e = add i32 %b, %c
  %f = add i32 %e, %d

  ret i32 %f
}

@message = private unnamed_addr constant [13 x i8] c"Hello World\0A\00"

declare i32 @printf(ptr, ...)

define i32 @add_numbers(i32 %a, i32 %b) {
entry:
  %c = add i32 %a, %b
  ret i32 %c
}

define i32 @subtract_numbers(i32 %a, i32 %b) {
entry:
  %c = sub i32 %a, %b
  ret i32 %c
}

define i32 @multiply_numbers(i32 %a, i32 %b) {
entry:
  %c = mul i32 %a, %b
  ret i32 %c
}

define i32 @main() {
entry:
  %p = getelementptr inbounds [13 x i8], ptr @message, i32 0, i32 0
  call i32 (ptr, ...) @printf(ptr %p)

  %x = call i32 @add_numbers(i32 10, i32 5)
  %y = call i32 @subtract_numbers(i32 10, i32 5)
  %z = call i32 @multiply_numbers(i32 10, i32 5)

  %m = add i32 %x, %y
  %n = add i32 %m, %z

  ret i32 %n
}

; Define a module
; This is a comment

define i32 @my_add(i32 %a, i32 %b) {
entry:
  ; %result = %a + %b
  %result = add i32 %a, %b
  ret i32 %result
}

define i32 @main() {
entry:
  ; Call my_add(10, 5)
  %call = call i32 @my_add(i32 10, i32 5)
  ret i32 %call
}

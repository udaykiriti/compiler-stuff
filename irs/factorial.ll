declare i32 @printf(i8*, ...)

@fmt = constant [4 x i8] c"%d\0A\00"

define i32 @factorial(i32 %n) {
entry:
    %is_small = icmp sle i32 %n, 1
    br i1 %is_small, label %base, label %recurse

base:
    ret i32 1

recurse:
    %next = sub i32 %n, 1
    %partial = call i32 @factorial(i32 %next)
    %result = mul i32 %n, %partial
    ret i32 %result
}

define i32 @main() {
entry:
    %value = call i32 @factorial(i32 5)
    %fmtptr = getelementptr [4 x i8], [4 x i8]* @fmt, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %fmtptr, i32 %value)
    ret i32 0
}

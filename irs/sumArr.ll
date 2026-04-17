declare i32 @printf(i8*, ...)

@numbers = global [4 x i32] [i32 4, i32 8, i32 15, i32 16]
@fmt = constant [4 x i8] c"%d\0A\00"

define i32 @main() {
entry:
    %a_ptr = getelementptr [4 x i32], [4 x i32]* @numbers, i32 0, i32 0
    %b_ptr = getelementptr [4 x i32], [4 x i32]* @numbers, i32 0, i32 1
    %c_ptr = getelementptr [4 x i32], [4 x i32]* @numbers, i32 0, i32 2
    %d_ptr = getelementptr [4 x i32], [4 x i32]* @numbers, i32 0, i32 3

    %a = load i32, i32* %a_ptr
    %b = load i32, i32* %b_ptr
    %c = load i32, i32* %c_ptr
    %d = load i32, i32* %d_ptr

    %ab = add i32 %a, %b
    %cd = add i32 %c, %d
    %sum = add i32 %ab, %cd

    %fmtptr = getelementptr [4 x i8], [4 x i8]* @fmt, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %fmtptr, i32 %sum)

    ret i32 0
}

;puts function from C
declare i32 @puts(i8*)

;main func
define i32 @main() {
entry:
    ;str"Hello World"
    %str = getelementptr [12 x i8], [12 x i8]* @msg, i32 0, i32 0

    ;puts
    call i32 @puts(i8* %str)

    ; Return 0
    ret i32 0
}

; Global string
@msg = private constant [12 x i8] c"Hello World\00"

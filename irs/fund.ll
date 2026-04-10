@global = global i32 0


; @ -> global 
; % -> local (register)
; %x = add i32 5,3
; i32 -- 32-bit integer
; i64 -- 64-bit integer
; i8  -- char 
; i1  -- boolean
; float,double -- same 
; void -- no return


; i32* -> pointer to 32 bit integer
; i8*  -> pointer to char

; declaring puts function.
declare i32 @printf(i8* , ...)

; In string format 
; %d refers to integer like lang
; \0A newline
; \00 null terminator

@fmt = constant [4 x i8] c"%d\0A\00"


define i32 @main() {
entry:
    ; compute 5 + 3
    %sum = add i32 5, 3

    ; get pointer to format string
    %fmtptr = getelementptr [4 x i8], [4 x i8]* @fmt, i32 0, i32 0

    ; call printf
    call i32 (i8*, ...) @printf(i8* %fmtptr, i32 %sum)

    ret i32 0
}

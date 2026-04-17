define i32 @max_value(i32 %a, i32 %b) {
entry:
    %cond = icmp sgt i32 %a, %b
    br i1 %cond, label %then, label %else

then:
    br label %merge

else:
    br label %merge

merge:
    %result = phi i32 [ %a, %then ], [ %b, %else ]
    ret i32 %result
}

define i32 @main() {
entry:
    %value = call i32 @max_value(i32 17, i32 29)
    ret i32 %value
}

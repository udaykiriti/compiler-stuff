; Combined LLVM IR practice file
; Contains a simple add function, a loop example, and a main entry point.

define i32 @my_add(i32 %a, i32 %b) {
entry:
  %result = add i32 %a, %b
  ret i32 %result
}

define i32 @sum_loop(i32 %count) {
entry:
  %cmp_initial = icmp sle i32 %count, 0
  br i1 %cmp_initial, label %done, label %loop_header

loop_header:
  br label %loop_body

loop_body:
  %idx = phi i32 [ 0, %loop_header ], [ %next_idx, %loop_body ]
  %running_sum = phi i32 [ 0, %loop_header ], [ %next_sum, %loop_body ]
  %next_sum = add i32 %running_sum, %idx
  %next_idx = add i32 %idx, 1
  %continue = icmp slt i32 %next_idx, %count
  br i1 %continue, label %loop_body, label %done

done:
  %final_result = phi i32 [ 0, %entry ], [ %next_sum, %loop_body ]
  ret i32 %final_result
}

define i32 @main() {
entry:
  %add_result = call i32 @my_add(i32 10, i32 5)
  %loop_result = call i32 @sum_loop(i32 10)
  %total = add i32 %add_result, %loop_result
  ret i32 %total
}

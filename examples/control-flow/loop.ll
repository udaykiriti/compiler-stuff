; A complete example of a loop in LLVM IR
; Logic: Calculates the sum of numbers from 0 to %count

define i32 @sum_loop(i32 %count) {
entry:
  ; Check if count is <= 0 initially to handle edge case
  %cmp_initial = icmp sle i32 %count, 0
  br i1 %cmp_initial, label %done, label %loop_header

loop_header:
  ; Initialize accumulators
  ; current_sum = 0
  ; current_index = 0
  br label %loop_body

loop_body:
  ; PHI NODES ARE REQUIRED AT THE START OF A BLOCK
  ; %idx tracks the loop counter (i)
  %idx = phi i32 [ 0, %loop_header ], [ %next_idx, %loop_body ]
  
  ; %running_sum tracks the total
  %running_sum = phi i32 [ 0, %loop_header ], [ %next_sum, %loop_body ]

  ; Calculate new sum: running_sum + idx
  %next_sum = add i32 %running_sum, %idx

  ; Increment counter: idx + 1
  %next_idx = add i32 %idx, 1

  ; Check exit condition: is next_idx < count?
  %continue = icmp slt i32 %next_idx, %count
  br i1 %continue, label %loop_body, label %done

done:
  ; Result depends on where we came from
  ; If we jumped straight here from entry, result is 0
  ; If we came from loop_body, result is %next_sum
  %final_result = phi i32 [ 0, %entry ], [ %next_sum, %loop_body ]
  ret i32 %final_result
}

define i32 @main() {
  ; Calculate sum of 0..9 (count=10)
  %result = call i32 @sum_loop(i32 10)
  ret i32 %result
}

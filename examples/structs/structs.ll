; Demonstrating Structs and the confusing 'getelementptr' (GEP) instruction

; Define a structure type: MyPoint { i32 x, i32 y }
%MyPoint = type { i32, i32 }

; Define a global variable of this type
@g_point = global %MyPoint { i32 10, i32 20 }

define i32 @main() {
entry:
  ; Get a pointer to the global struct
  ; @g_point is a pointer to the global memory
  
  ; ---------------------------------------------------------
  ; ACCESSING STRUCT MEMBERS
  ; Instruction: getelementptr
  ; Logic: BasePointer + Index1 + Index2 ...
  ;
  ; GEP is just math on pointers. It does NOT touch memory.
  ;
  ; 1. First Index (0):  Offset from the BasePointer itself.
  ;    Since we just want the struct at that pointer, offset is 0.
  ; 2. Second Index (1): Offset inside the struct (field index).
  ;    0 = x, 1 = y
  ; ---------------------------------------------------------

  ; Get pointer to 'y' (index 1)
  %ptr_y = getelementptr %MyPoint, ptr @g_point, i32 0, i32 1
  
  ; Load the value at that address
  %val_y = load i32, ptr %ptr_y
  
  ; Get pointer to 'x' (index 0)
  %ptr_x = getelementptr %MyPoint, ptr @g_point, i32 0, i32 0
  %val_x = load i32, ptr %ptr_x
  
  ; Add x + y
  %sum = add i32 %val_x, %val_y
  
  ret i32 %sum
}

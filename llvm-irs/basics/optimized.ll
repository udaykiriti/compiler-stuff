; ModuleID = 'source.ll'
source_filename = "source.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calculate(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %9, 5
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %7, align 4
  %13 = load i32, ptr %6, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %2
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %7, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %3, align 4
  br label %25

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %3, align 4
  br label %25

25:                                               ; preds = %21, %17
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %3 = call i32 @calculate(i32 noundef 10, i32 noundef 20)
  store i32 %3, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 21.1.8 (Fedora 21.1.8-1.fc43)"}

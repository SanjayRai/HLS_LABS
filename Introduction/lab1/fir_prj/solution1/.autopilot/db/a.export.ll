; ModuleID = 'C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@shift_reg = internal unnamed_addr global [11 x i32] zeroinitializer, align 4
@fir_str = internal unnamed_addr constant [4 x i8] c"fir\00"
@p_str = private unnamed_addr constant [17 x i8] c"Shift_Accum_Loop\00", align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @fir(i32* %y, [11 x i32]* %c, i32 %x) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %y) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([11 x i32]* %c) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecTopModule([4 x i8]* @fir_str) nounwind
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind
  br label %1

; <label>:1                                       ; preds = %5, %0
  %acc = phi i32 [ 0, %0 ], [ %acc_1, %5 ]
  %i = phi i5 [ 10, %0 ], [ %i_1, %5 ]
  %i_cast = sext i5 %i to i32
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i5.i32(i5 %i, i32 4)
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) nounwind
  br i1 %tmp, label %6, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([17 x i8]* @p_str) nounwind
  %tmp_1 = icmp eq i5 %i, 0
  br i1 %tmp_1, label %3, label %4

; <label>:3                                       ; preds = %2
  store i32 %x_read, i32* getelementptr inbounds ([11 x i32]* @shift_reg, i32 0, i32 0), align 4
  br label %5

; <label>:4                                       ; preds = %2
  %tmp_2 = add i5 %i, -1
  %tmp_2_cast = zext i5 %tmp_2 to i32
  %shift_reg_addr = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %tmp_2_cast
  %data = load i32* %shift_reg_addr, align 4
  %shift_reg_addr_1 = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %i_cast
  store i32 %data, i32* %shift_reg_addr_1, align 4
  br label %5

; <label>:5                                       ; preds = %4, %3
  %data1 = phi i32 [ %x_read, %3 ], [ %data, %4 ]
  %c_addr = getelementptr [11 x i32]* %c, i32 0, i32 %i_cast
  %c_load = load i32* %c_addr, align 4
  %tmp_3 = mul nsw i32 %c_load, %data1
  %acc_1 = add nsw i32 %tmp_3, %acc
  %i_1 = add i5 %i, -1
  br label %1

; <label>:6                                       ; preds = %1
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %y, i32 %acc) nounwind
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i1 @_ssdm_op_BitSelect.i1.i5.i32(i5, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i5
  %empty_2 = shl i5 1, %empty
  %empty_3 = and i5 %0, %empty_2
  %empty_4 = icmp ne i5 %empty_3, 0
  ret i1 %empty_4
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"data_t*", metadata !"coef_t*", metadata !"data_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"y", metadata !"c", metadata !"x"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"y", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"c", metadata !17, metadata !"int", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 10, i32 1}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"x", metadata !23, metadata !"int", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 0, i32 0}

; ModuleID = 'C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@shift_reg = internal unnamed_addr global [11 x i32] zeroinitializer, align 4 ; [#uses=3 type=[11 x i32]*]
@fir_str = internal unnamed_addr constant [4 x i8] c"fir\00" ; [#uses=1 type=[4 x i8]*]
@p_str = private unnamed_addr constant [17 x i8] c"Shift_Accum_Loop\00", align 1 ; [#uses=1 type=[17 x i8]*]

; [#uses=8]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @fir(i32* %y, [11 x i32]* %c, i32 %x) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %y) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([11 x i32]* %c) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecTopModule([4 x i8]* @fir_str) nounwind
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %x_read}, i64 0, metadata !25), !dbg !37 ; [debug line = 51:10] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32* %y}, i64 0, metadata !38), !dbg !39 ; [debug line = 49:11] [debug variable = y]
  call void @llvm.dbg.value(metadata !{[11 x i32]* %c}, i64 0, metadata !40), !dbg !44 ; [debug line = 50:10] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !25), !dbg !37 ; [debug line = 51:10] [debug variable = x]
  br label %1, !dbg !45                           ; [debug line = 60:26]

; <label>:1                                       ; preds = %5, %0
  %acc = phi i32 [ 0, %0 ], [ %acc_1, %5 ]        ; [#uses=2 type=i32]
  %i = phi i5 [ 10, %0 ], [ %i_1, %5 ]            ; [#uses=5 type=i5]
  %i_cast = sext i5 %i to i32, !dbg !45           ; [#uses=2 type=i32] [debug line = 60:26]
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i5.i32(i5 %i, i32 4), !dbg !45 ; [#uses=1 type=i1] [debug line = 60:26]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) nounwind ; [#uses=0 type=i32]
  br i1 %tmp, label %6, label %2, !dbg !45        ; [debug line = 60:26]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([17 x i8]* @p_str) nounwind, !dbg !48 ; [debug line = 60:45]
  %tmp_1 = icmp eq i5 %i, 0, !dbg !50             ; [#uses=1 type=i1] [debug line = 61:2]
  br i1 %tmp_1, label %3, label %4, !dbg !50      ; [debug line = 61:2]

; <label>:3                                       ; preds = %2
  store i32 %x_read, i32* getelementptr inbounds ([11 x i32]* @shift_reg, i32 0, i32 0), align 4, !dbg !51 ; [debug line = 62:4]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !53), !dbg !54 ; [debug line = 63:7] [debug variable = data]
  br label %5, !dbg !55                           ; [debug line = 64:5]

; <label>:4                                       ; preds = %2
  %tmp_2 = add i5 %i, -1, !dbg !56                ; [#uses=1 type=i5] [debug line = 65:4]
  %tmp_2_cast = zext i5 %tmp_2 to i32, !dbg !56   ; [#uses=1 type=i32] [debug line = 65:4]
  %shift_reg_addr = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %tmp_2_cast, !dbg !56 ; [#uses=1 type=i32*] [debug line = 65:4]
  %data = load i32* %shift_reg_addr, align 4, !dbg !56 ; [#uses=2 type=i32] [debug line = 65:4]
  %shift_reg_addr_1 = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %i_cast, !dbg !56 ; [#uses=1 type=i32*] [debug line = 65:4]
  store i32 %data, i32* %shift_reg_addr_1, align 4, !dbg !56 ; [debug line = 65:4]
  call void @llvm.dbg.value(metadata !{i32 %data}, i64 0, metadata !53), !dbg !58 ; [debug line = 66:4] [debug variable = data]
  br label %5

; <label>:5                                       ; preds = %4, %3
  %data1 = phi i32 [ %x_read, %3 ], [ %data, %4 ] ; [#uses=1 type=i32]
  %c_addr = getelementptr [11 x i32]* %c, i32 0, i32 %i_cast, !dbg !59 ; [#uses=1 type=i32*] [debug line = 68:5]
  %c_load = load i32* %c_addr, align 4, !dbg !59  ; [#uses=1 type=i32] [debug line = 68:5]
  %tmp_3 = mul nsw i32 %c_load, %data1, !dbg !59  ; [#uses=1 type=i32] [debug line = 68:5]
  %acc_1 = add nsw i32 %tmp_3, %acc, !dbg !59     ; [#uses=1 type=i32] [debug line = 68:5]
  call void @llvm.dbg.value(metadata !{i32 %acc_1}, i64 0, metadata !60), !dbg !59 ; [debug line = 68:5] [debug variable = acc]
  %i_1 = add i5 %i, -1, !dbg !62                  ; [#uses=1 type=i5] [debug line = 60:39]
  call void @llvm.dbg.value(metadata !{i5 %i_1}, i64 0, metadata !63), !dbg !62 ; [debug line = 60:39] [debug variable = i]
  br label %1, !dbg !62                           ; [debug line = 60:39]

; <label>:6                                       ; preds = %1
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %y, i32 %acc) nounwind, !dbg !64 ; [debug line = 70:3]
  ret void, !dbg !65                              ; [debug line = 71:1]
}

; [#uses=1]
define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=1]
define weak i1 @_ssdm_op_BitSelect.i1.i5.i32(i5, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i5                     ; [#uses=1 type=i5]
  %empty_2 = shl i5 1, %empty                     ; [#uses=1 type=i5]
  %empty_3 = and i5 %0, %empty_2                  ; [#uses=1 type=i5]
  %empty_4 = icmp ne i5 %empty_3, 0               ; [#uses=1 type=i1]
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
!25 = metadata !{i32 786689, metadata !26, metadata !"x", metadata !27, i32 50331699, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 786478, i32 0, metadata !27, metadata !"fir", metadata !"fir", metadata !"", metadata !27, i32 48, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !35, i32 52} ; [ DW_TAG_subprogram ]
!27 = metadata !{i32 786473, metadata !"fir.c", metadata !"C:\5CData\5Cinfo_HLS\5Cdoc_2017.2\5Cug871-design-files\5Cug871-design-files\5CIntroduction\5Clab1", null} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{null, metadata !30, metadata !33, metadata !31}
!30 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 786454, null, metadata !"data_t", metadata !27, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 786454, null, metadata !"coef_t", metadata !27, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!37 = metadata !{i32 51, i32 10, metadata !26, null}
!38 = metadata !{i32 786689, metadata !26, metadata !"y", metadata !27, i32 16777265, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!39 = metadata !{i32 49, i32 11, metadata !26, null}
!40 = metadata !{i32 786689, metadata !26, metadata !"c", null, i32 50, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !34, metadata !42, i32 0, i32 0} ; [ DW_TAG_array_type ]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ]
!44 = metadata !{i32 50, i32 10, metadata !26, null}
!45 = metadata !{i32 60, i32 26, metadata !46, null}
!46 = metadata !{i32 786443, metadata !47, i32 60, i32 21, metadata !27, i32 1} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 786443, metadata !26, i32 52, i32 5, metadata !27, i32 0} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 60, i32 45, metadata !49, null}
!49 = metadata !{i32 786443, metadata !46, i32 60, i32 44, metadata !27, i32 2} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 61, i32 2, metadata !49, null}
!51 = metadata !{i32 62, i32 4, metadata !52, null}
!52 = metadata !{i32 786443, metadata !49, i32 61, i32 12, metadata !27, i32 3} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 786688, metadata !47, metadata !"data", metadata !27, i32 56, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 63, i32 7, metadata !52, null}
!55 = metadata !{i32 64, i32 5, metadata !52, null}
!56 = metadata !{i32 65, i32 4, metadata !57, null}
!57 = metadata !{i32 786443, metadata !49, i32 64, i32 12, metadata !27, i32 4} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 66, i32 4, metadata !57, null}
!59 = metadata !{i32 68, i32 5, metadata !49, null}
!60 = metadata !{i32 786688, metadata !47, metadata !"acc", metadata !27, i32 55, metadata !61, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 786454, null, metadata !"acc_t", metadata !27, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!62 = metadata !{i32 60, i32 39, metadata !46, null}
!63 = metadata !{i32 786688, metadata !47, metadata !"i", metadata !27, i32 57, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 70, i32 3, metadata !47, null}
!65 = metadata !{i32 71, i32 1, metadata !47, null}

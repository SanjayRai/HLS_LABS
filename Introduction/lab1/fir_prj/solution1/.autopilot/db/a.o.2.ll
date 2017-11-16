; ModuleID = 'C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@shift_reg = internal unnamed_addr global [11 x i32] zeroinitializer, align 4 ; [#uses=3 type=[11 x i32]*]
@fir.str = internal unnamed_addr constant [4 x i8] c"fir\00" ; [#uses=1 type=[4 x i8]*]
@.str = private unnamed_addr constant [17 x i8] c"Shift_Accum_Loop\00", align 1 ; [#uses=1 type=[17 x i8]*]

; [#uses=7]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @fir(i32* %y, [11 x i32]* %c, i32 %x) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %y) nounwind, !map !25
  call void (...)* @_ssdm_op_SpecBitsMap([11 x i32]* %c) nounwind, !map !31
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !37
  call void (...)* @_ssdm_op_SpecTopModule([4 x i8]* @fir.str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %y}, i64 0, metadata !43), !dbg !44 ; [debug line = 49:11] [debug variable = y]
  call void @llvm.dbg.value(metadata !{[11 x i32]* %c}, i64 0, metadata !45), !dbg !47 ; [debug line = 50:10] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !48), !dbg !49 ; [debug line = 51:10] [debug variable = x]
  br label %1, !dbg !50                           ; [debug line = 60:26]

; <label>:1                                       ; preds = %6, %0
  %acc = phi i32 [ 0, %0 ], [ %acc.1, %6 ]        ; [#uses=2 type=i32]
  %i = phi i5 [ 10, %0 ], [ %i.1, %6 ]            ; [#uses=5 type=i5]
  %i.cast = sext i5 %i to i32, !dbg !50           ; [#uses=2 type=i32] [debug line = 60:26]
  %tmp = icmp sgt i5 %i, -1, !dbg !50             ; [#uses=1 type=i1] [debug line = 60:26]
  %2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) nounwind ; [#uses=0 type=i32]
  br i1 %tmp, label %3, label %7, !dbg !50        ; [debug line = 60:26]

; <label>:3                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([17 x i8]* @.str) nounwind, !dbg !53 ; [debug line = 60:45]
  %tmp.1 = icmp eq i5 %i, 0, !dbg !55             ; [#uses=1 type=i1] [debug line = 61:2]
  br i1 %tmp.1, label %4, label %5, !dbg !55      ; [debug line = 61:2]

; <label>:4                                       ; preds = %3
  store i32 %x, i32* getelementptr inbounds ([11 x i32]* @shift_reg, i32 0, i32 0), align 4, !dbg !56 ; [debug line = 62:4]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !58), !dbg !59 ; [debug line = 63:7] [debug variable = data]
  br label %6, !dbg !60                           ; [debug line = 64:5]

; <label>:5                                       ; preds = %3
  %tmp.2 = add i5 %i, -1, !dbg !61                ; [#uses=1 type=i5] [debug line = 65:4]
  %tmp.2.cast = zext i5 %tmp.2 to i32, !dbg !61   ; [#uses=1 type=i32] [debug line = 65:4]
  %shift_reg.addr = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %tmp.2.cast, !dbg !61 ; [#uses=1 type=i32*] [debug line = 65:4]
  %data = load i32* %shift_reg.addr, align 4, !dbg !61 ; [#uses=2 type=i32] [debug line = 65:4]
  %shift_reg.addr.1 = getelementptr inbounds [11 x i32]* @shift_reg, i32 0, i32 %i.cast, !dbg !61 ; [#uses=1 type=i32*] [debug line = 65:4]
  store i32 %data, i32* %shift_reg.addr.1, align 4, !dbg !61 ; [debug line = 65:4]
  call void @llvm.dbg.value(metadata !{i32 %data}, i64 0, metadata !58), !dbg !63 ; [debug line = 66:4] [debug variable = data]
  br label %6

; <label>:6                                       ; preds = %5, %4
  %data1 = phi i32 [ %x, %4 ], [ %data, %5 ]      ; [#uses=1 type=i32]
  %c.addr = getelementptr [11 x i32]* %c, i32 0, i32 %i.cast, !dbg !64 ; [#uses=1 type=i32*] [debug line = 68:5]
  %c.load = load i32* %c.addr, align 4, !dbg !64  ; [#uses=1 type=i32] [debug line = 68:5]
  %tmp.3 = mul nsw i32 %data1, %c.load, !dbg !64  ; [#uses=1 type=i32] [debug line = 68:5]
  %acc.1 = add nsw i32 %acc, %tmp.3, !dbg !64     ; [#uses=1 type=i32] [debug line = 68:5]
  call void @llvm.dbg.value(metadata !{i32 %acc.1}, i64 0, metadata !65), !dbg !64 ; [debug line = 68:5] [debug variable = acc]
  %i.1 = add i5 %i, -1, !dbg !67                  ; [#uses=1 type=i5] [debug line = 60:39]
  call void @llvm.dbg.value(metadata !{i5 %i.1}, i64 0, metadata !68), !dbg !67 ; [debug line = 60:39] [debug variable = i]
  br label %1, !dbg !67                           ; [debug line = 60:39]

; <label>:7                                       ; preds = %1
  %acc.lcssa = phi i32 [ %acc, %1 ]               ; [#uses=1 type=i32]
  store i32 %acc.lcssa, i32* %y, align 4, !dbg !69 ; [debug line = 70:3]
  ret void, !dbg !70                              ; [debug line = 71:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=3]
declare void @_ssdm_op_SpecBitsMap(...)

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}
!llvm.dbg.cu = !{!7}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"data_t*", metadata !"coef_t*", metadata !"data_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"y", metadata !"c", metadata !"x"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{i32 786449, i32 0, i32 1, metadata !"C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/fir.pragma.2.c", metadata !"C:\5CData\5Cinfo_HLS\5Cdoc_2017.2\5Cug871-design-files\5Cug871-design-files\5CIntroduction\5Clab1", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, null, null, null, metadata !8} ; [ DW_TAG_compile_unit ]
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786484, i32 0, metadata !11, metadata !"shift_reg", metadata !"shift_reg", metadata !"", metadata !12, i32 54, metadata !22, i32 1, i32 1, [11 x i32]* @shift_reg} ; [ DW_TAG_variable ]
!11 = metadata !{i32 786478, i32 0, metadata !12, metadata !"fir", metadata !"fir", metadata !"", metadata !12, i32 48, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !20, i32 52} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 786473, metadata !"fir.c", metadata !"C:\5CData\5Cinfo_HLS\5Cdoc_2017.2\5Cug871-design-files\5Cug871-design-files\5CIntroduction\5Clab1", null} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{null, metadata !15, metadata !18, metadata !16}
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 786454, null, metadata !"data_t", metadata !12, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!17 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 786454, null, metadata !"coef_t", metadata !12, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!22 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 352, i64 32, i32 0, i32 0, metadata !16, metadata !23, i32 0, i32 0} ; [ DW_TAG_array_type ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"y", metadata !29, metadata !"int", i32 0, i32 31}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 0, i32 1}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 0, i32 31, metadata !33}
!33 = metadata !{metadata !34}
!34 = metadata !{metadata !"c", metadata !35, metadata !"int", i32 0, i32 31}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 10, i32 1}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 31, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"x", metadata !41, metadata !"int", i32 0, i32 31}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 0, i32 0}
!43 = metadata !{i32 786689, metadata !11, metadata !"y", metadata !12, i32 16777265, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 49, i32 11, metadata !11, null}
!45 = metadata !{i32 786689, metadata !11, metadata !"c", null, i32 50, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !19, metadata !23, i32 0, i32 0} ; [ DW_TAG_array_type ]
!47 = metadata !{i32 50, i32 10, metadata !11, null}
!48 = metadata !{i32 786689, metadata !11, metadata !"x", metadata !12, i32 50331699, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 51, i32 10, metadata !11, null}
!50 = metadata !{i32 60, i32 26, metadata !51, null}
!51 = metadata !{i32 786443, metadata !52, i32 60, i32 21, metadata !12, i32 1} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 786443, metadata !11, i32 52, i32 5, metadata !12, i32 0} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 60, i32 45, metadata !54, null}
!54 = metadata !{i32 786443, metadata !51, i32 60, i32 44, metadata !12, i32 2} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 61, i32 2, metadata !54, null}
!56 = metadata !{i32 62, i32 4, metadata !57, null}
!57 = metadata !{i32 786443, metadata !54, i32 61, i32 12, metadata !12, i32 3} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 786688, metadata !52, metadata !"data", metadata !12, i32 56, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 63, i32 7, metadata !57, null}
!60 = metadata !{i32 64, i32 5, metadata !57, null}
!61 = metadata !{i32 65, i32 4, metadata !62, null}
!62 = metadata !{i32 786443, metadata !54, i32 64, i32 12, metadata !12, i32 4} ; [ DW_TAG_lexical_block ]
!63 = metadata !{i32 66, i32 4, metadata !62, null}
!64 = metadata !{i32 68, i32 5, metadata !54, null}
!65 = metadata !{i32 786688, metadata !52, metadata !"acc", metadata !12, i32 55, metadata !66, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 786454, null, metadata !"acc_t", metadata !12, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!67 = metadata !{i32 60, i32 39, metadata !51, null}
!68 = metadata !{i32 786688, metadata !52, metadata !"i", metadata !12, i32 57, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 70, i32 3, metadata !52, null}
!70 = metadata !{i32 71, i32 1, metadata !52, null}

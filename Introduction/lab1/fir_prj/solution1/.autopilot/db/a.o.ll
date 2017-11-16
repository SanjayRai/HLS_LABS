; ModuleID = 'C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@fir.shift_reg = internal global [11 x i32] zeroinitializer, align 4 ; [#uses=4 type=[11 x i32]*]
@.str = private unnamed_addr constant [17 x i8] c"Shift_Accum_Loop\00", align 1 ; [#uses=1 type=[17 x i8]*]

; [#uses=0]
define void @fir(i32* %y, i32* %c, i32 %x) nounwind {
  %1 = alloca i32*, align 4                       ; [#uses=2 type=i32**]
  %2 = alloca i32*, align 4                       ; [#uses=3 type=i32**]
  %3 = alloca i32, align 4                        ; [#uses=3 type=i32*]
  %acc = alloca i32, align 4                      ; [#uses=4 type=i32*]
  %data = alloca i32, align 4                     ; [#uses=3 type=i32*]
  %i = alloca i32, align 4                        ; [#uses=9 type=i32*]
  store i32* %y, i32** %1, align 4
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !29), !dbg !30 ; [debug line = 49:11] [debug variable = y]
  store i32* %c, i32** %2, align 4
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !31), !dbg !32 ; [debug line = 50:10] [debug variable = c]
  store i32 %x, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !33), !dbg !34 ; [debug line = 51:10] [debug variable = x]
  %4 = load i32** %2, align 4, !dbg !35           ; [#uses=1 type=i32*] [debug line = 52:6]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void (i32*, i32)*)(i32* %4, i32 11) nounwind, !dbg !35 ; [debug line = 52:6]
  call void @llvm.dbg.declare(metadata !{i32* %acc}, metadata !37), !dbg !39 ; [debug line = 55:9] [debug variable = acc]
  call void @llvm.dbg.declare(metadata !{i32* %data}, metadata !40), !dbg !41 ; [debug line = 56:10] [debug variable = data]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !42), !dbg !43 ; [debug line = 57:7] [debug variable = i]
  store i32 0, i32* %acc, align 4, !dbg !44       ; [debug line = 59:3]
  br label %5, !dbg !44                           ; [debug line = 59:3]

; <label>:5                                       ; preds = %0
  store i32 10, i32* %i, align 4, !dbg !45        ; [debug line = 60:26]
  br label %6, !dbg !45                           ; [debug line = 60:26]

; <label>:6                                       ; preds = %34, %5
  %7 = load i32* %i, align 4, !dbg !45            ; [#uses=1 type=i32] [debug line = 60:26]
  %8 = icmp sge i32 %7, 0, !dbg !45               ; [#uses=1 type=i1] [debug line = 60:26]
  br i1 %8, label %9, label %37, !dbg !45         ; [debug line = 60:26]

; <label>:9                                       ; preds = %6
  call void bitcast (void (...)* @_ssdm_op_SpecLoopName to void (i8*)*)(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !47 ; [debug line = 60:45]
  call void bitcast (void (...)* @_ssdm_RegionBegin to void (i8*)*)(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !47 ; [debug line = 60:45]
  %10 = load i32* %i, align 4, !dbg !49           ; [#uses=1 type=i32] [debug line = 61:2]
  %11 = icmp eq i32 %10, 0, !dbg !49              ; [#uses=1 type=i1] [debug line = 61:2]
  br i1 %11, label %12, label %15, !dbg !49       ; [debug line = 61:2]

; <label>:12                                      ; preds = %9
  %13 = load i32* %3, align 4, !dbg !50           ; [#uses=1 type=i32] [debug line = 62:4]
  store i32 %13, i32* getelementptr inbounds ([11 x i32]* @fir.shift_reg, i32 0, i32 0), align 4, !dbg !50 ; [debug line = 62:4]
  %14 = load i32* %3, align 4, !dbg !52           ; [#uses=1 type=i32] [debug line = 63:7]
  store i32 %14, i32* %data, align 4, !dbg !52    ; [debug line = 63:7]
  br label %25, !dbg !53                          ; [debug line = 64:5]

; <label>:15                                      ; preds = %9
  %16 = load i32* %i, align 4, !dbg !54           ; [#uses=1 type=i32] [debug line = 65:4]
  %17 = sub nsw i32 %16, 1, !dbg !54              ; [#uses=1 type=i32] [debug line = 65:4]
  %18 = getelementptr inbounds [11 x i32]* @fir.shift_reg, i32 0, i32 %17, !dbg !54 ; [#uses=1 type=i32*] [debug line = 65:4]
  %19 = load i32* %18, align 4, !dbg !54          ; [#uses=1 type=i32] [debug line = 65:4]
  %20 = load i32* %i, align 4, !dbg !54           ; [#uses=1 type=i32] [debug line = 65:4]
  %21 = getelementptr inbounds [11 x i32]* @fir.shift_reg, i32 0, i32 %20, !dbg !54 ; [#uses=1 type=i32*] [debug line = 65:4]
  store i32 %19, i32* %21, align 4, !dbg !54      ; [debug line = 65:4]
  %22 = load i32* %i, align 4, !dbg !56           ; [#uses=1 type=i32] [debug line = 66:4]
  %23 = getelementptr inbounds [11 x i32]* @fir.shift_reg, i32 0, i32 %22, !dbg !56 ; [#uses=1 type=i32*] [debug line = 66:4]
  %24 = load i32* %23, align 4, !dbg !56          ; [#uses=1 type=i32] [debug line = 66:4]
  store i32 %24, i32* %data, align 4, !dbg !56    ; [debug line = 66:4]
  br label %25

; <label>:25                                      ; preds = %15, %12
  %26 = load i32* %data, align 4, !dbg !57        ; [#uses=1 type=i32] [debug line = 68:5]
  %27 = load i32* %i, align 4, !dbg !57           ; [#uses=1 type=i32] [debug line = 68:5]
  %28 = load i32** %2, align 4, !dbg !57          ; [#uses=1 type=i32*] [debug line = 68:5]
  %29 = getelementptr inbounds i32* %28, i32 %27, !dbg !57 ; [#uses=1 type=i32*] [debug line = 68:5]
  %30 = load i32* %29, align 4, !dbg !57          ; [#uses=1 type=i32] [debug line = 68:5]
  %31 = mul nsw i32 %26, %30, !dbg !57            ; [#uses=1 type=i32] [debug line = 68:5]
  %32 = load i32* %acc, align 4, !dbg !57         ; [#uses=1 type=i32] [debug line = 68:5]
  %33 = add nsw i32 %32, %31, !dbg !57            ; [#uses=1 type=i32] [debug line = 68:5]
  store i32 %33, i32* %acc, align 4, !dbg !57     ; [debug line = 68:5]
  call void bitcast (void (...)* @_ssdm_RegionEnd to void (i8*)*)(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !58 ; [debug line = 69:3]
  br label %34, !dbg !58                          ; [debug line = 69:3]

; <label>:34                                      ; preds = %25
  %35 = load i32* %i, align 4, !dbg !59           ; [#uses=1 type=i32] [debug line = 60:39]
  %36 = add nsw i32 %35, -1, !dbg !59             ; [#uses=1 type=i32] [debug line = 60:39]
  store i32 %36, i32* %i, align 4, !dbg !59       ; [debug line = 60:39]
  br label %6, !dbg !59                           ; [debug line = 60:39]

; <label>:37                                      ; preds = %6
  %38 = load i32* %acc, align 4, !dbg !60         ; [#uses=1 type=i32] [debug line = 70:3]
  %39 = load i32** %1, align 4, !dbg !60          ; [#uses=1 type=i32*] [debug line = 70:3]
  store i32 %38, i32* %39, align 4, !dbg !60      ; [debug line = 70:3]
  ret void, !dbg !61                              ; [debug line = 71:1]
}

; [#uses=6]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_RegionBegin(...) nounwind

; [#uses=1]
declare void @_ssdm_RegionEnd(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!22}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"C:/Data/info_HLS/doc_2017.2/ug871-design-files/ug871-design-files/Introduction/lab1/fir_prj/solution1/.autopilot/db/fir.pragma.2.c", metadata !"C:\5CData\5Cinfo_HLS\5Cdoc_2017.2\5Cug871-design-files\5Cug871-design-files\5CIntroduction\5Clab1", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !16} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"fir", metadata !"fir", metadata !"", metadata !6, i32 48, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32)* @fir, null, null, metadata !14, i32 52} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"fir.c", metadata !"C:\5CData\5Cinfo_HLS\5Cdoc_2017.2\5Cug871-design-files\5Cug871-design-files\5CIntroduction\5Clab1", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !12, metadata !10}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786454, null, metadata !"data_t", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 786454, null, metadata !"coef_t", metadata !6, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786484, i32 0, metadata !5, metadata !"shift_reg", metadata !"shift_reg", metadata !"", metadata !6, i32 54, metadata !19, i32 1, i32 1, [11 x i32]* @fir.shift_reg} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 352, i64 32, i32 0, i32 0, metadata !10, metadata !20, i32 0, i32 0} ; [ DW_TAG_array_type ]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ]
!22 = metadata !{void (i32*, i32*, i32)* @fir, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28}
!23 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!24 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"data_t*", metadata !"coef_t*", metadata !"data_t"}
!26 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"y", metadata !"c", metadata !"x"}
!28 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!29 = metadata !{i32 786689, metadata !5, metadata !"y", metadata !6, i32 16777265, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 49, i32 11, metadata !5, null}
!31 = metadata !{i32 786689, metadata !5, metadata !"c", metadata !6, i32 33554482, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 50, i32 10, metadata !5, null}
!33 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 50331699, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!34 = metadata !{i32 51, i32 10, metadata !5, null}
!35 = metadata !{i32 52, i32 6, metadata !36, null}
!36 = metadata !{i32 786443, metadata !5, i32 52, i32 5, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!37 = metadata !{i32 786688, metadata !36, metadata !"acc", metadata !6, i32 55, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!38 = metadata !{i32 786454, null, metadata !"acc_t", metadata !6, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 55, i32 9, metadata !36, null}
!40 = metadata !{i32 786688, metadata !36, metadata !"data", metadata !6, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 56, i32 10, metadata !36, null}
!42 = metadata !{i32 786688, metadata !36, metadata !"i", metadata !6, i32 57, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!43 = metadata !{i32 57, i32 7, metadata !36, null}
!44 = metadata !{i32 59, i32 3, metadata !36, null}
!45 = metadata !{i32 60, i32 26, metadata !46, null}
!46 = metadata !{i32 786443, metadata !36, i32 60, i32 21, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 60, i32 45, metadata !48, null}
!48 = metadata !{i32 786443, metadata !46, i32 60, i32 44, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 61, i32 2, metadata !48, null}
!50 = metadata !{i32 62, i32 4, metadata !51, null}
!51 = metadata !{i32 786443, metadata !48, i32 61, i32 12, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 63, i32 7, metadata !51, null}
!53 = metadata !{i32 64, i32 5, metadata !51, null}
!54 = metadata !{i32 65, i32 4, metadata !55, null}
!55 = metadata !{i32 786443, metadata !48, i32 64, i32 12, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 66, i32 4, metadata !55, null}
!57 = metadata !{i32 68, i32 5, metadata !48, null}
!58 = metadata !{i32 69, i32 3, metadata !48, null}
!59 = metadata !{i32 60, i32 39, metadata !46, null}
!60 = metadata !{i32 70, i32 3, metadata !36, null}
!61 = metadata !{i32 71, i32 1, metadata !36, null}

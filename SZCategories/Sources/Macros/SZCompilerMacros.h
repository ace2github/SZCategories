//
//  SZCompilerMacros.h
//  SZCategories
//
//  Created by ChaohuiChen on 2019/2/14.
//  Copyright © 2019 ChaohuiChen. All rights reserved.
//

#ifndef SZCompilerMacros_h
#define SZCompilerMacros_h

/**
 * #pragma 与 _Pragma；_Pragma可以用于宏定义中，前者#pragma编译器会将指令中的数字符号（“#”）解释为字符串化运算符 (#)。
 */
#define SZClangDiagnosticPush() _Pragma("clang diagnostic push")

#define SZClangDiagnosticPod() _Pragma("clang diagnostic pod")

//忽略警告：循环引用
#define SZClangDiagnosticIgnoredRetainCycles() \
    SZClangDiagnosticPush() \
    _Pragma("clang diagnostic ignored \"-Warc-retain-cycles\"")

//忽略警告：未使用变量
#define SZClangDiagnosticIgnoredUnusedVariable() \
    SZClangDiagnosticPush() \
    _Pragma("clang diagnostic ignored \"-Wunused-variable\"")

//忽略警告：api废弃
#define SZClangDiagnosticIgnoredDeprecatedDeclarations() \
    SZClangDiagnosticPush() \
    _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")

//忽略警告：不兼容指针类型
#define SZClangDiagnosticIgnoredIncompleteImplementation() \
    SZClangDiagnosticPush() \
    _Pragma("clang diagnostic ignored \"-Wincomplete-implementation\"")
#endif /* SZCompilerMacros_h */

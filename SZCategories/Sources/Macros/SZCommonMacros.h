//
//  SZCommonMacros.h
//  SZCategories
//
//  Created by ChaohuiChen on 2019/2/12.
//  Copyright © 2019 ChaohuiChen. All rights reserved.
//

#ifndef SZCommonMacros_h
#define SZCommonMacros_h

/* 对象类型检查，提高安全性 */
#ifndef SZDynamicCast
#define SZDynamicCast(object, klass) ([(object) isKindOfClass: [klass class]] ? (klass*) object : nil)
#endif

/* 字符串常量定义和声明 */
#if !defined(SZY_CONST_STRING)
#   if defined(__cplusplus)
#       define SZY_CONST_STRING extern "C"
#   else
#       define SZY_CONST_STRING NSString * const
#   endif
#endif

#if !defined(SZY_EXTERN_CONST_STRING)
#   if defined(__cplusplus)
#       define SZY_EXTERN_CONST_STRING extern "C"
#   else
#       define SZY_EXTERN_CONST_STRING extern NSString * const
#   endif
#endif

/**
 Copy From YYKit
 *
 Synthsize a weak or strong reference.
 Example:
 @weakify(self)
 [self doSomething^{
    @strongify(self)
    if (!self) return;
    ...
 }];
 */
#ifndef weakify
#if DEBUG
    #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
    #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
    #endif
#else
    #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
    #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
    #endif
#endif
#endif

#ifndef strongify
#if DEBUG
    #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
    #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
    #endif
#else
    #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
    #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
    #endif
#endif
#endif

#endif /* SZCommonMacros_h */

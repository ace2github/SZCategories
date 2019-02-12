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

#endif /* SZCommonMacros_h */

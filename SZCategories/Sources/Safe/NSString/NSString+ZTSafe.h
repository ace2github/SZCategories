//
//  NSString+ZTSafe.h
//  ztjyyd
//
//  Created by yzl on 2017/9/13.
//  Copyright © 2017年 szy. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ZTSafeString(_src_) [NSString zt_safeString:_src_]

@interface NSString (ZTSafe)
/*
 *  src==nil，返回@""；否则返回src
 */
+ (NSString *)zt_safeString:(NSString *)src;

/*
 *  srcStr和toStr都为空（nil或者@""），视为相等
 *  srcStr和toStr的Unicode编码一致，视为相等
 */
+ (BOOL)zt_safeString:(NSString *)srcStr equalTo:(NSString *)toStr;


/**
 *  字符串是否为空nil or @""
 *
 *  @param str
 *
 *  @return YES 为空，NO不为空
 */
+ (BOOL)zt_isEmptyStr:(NSString *)str;

//是否全部为空格
+ (BOOL)zt_isBlankString:(NSString *)string;

//是否包含有空格
+ (BOOL)zt_containBlankString:(NSString *)string;

+ (NSString *)zt_safeCheckURLString:(NSString *)urlString ;

- (NSString*)zt_safeCheckURL;

- (BOOL)szy_isEmpty;

/**
 安全字符串过滤
 这个是老的php接口使用的过滤，会对接口中返回的 null <null> 过滤成空字符串 ""
 和 zt_safeString 这个方法实现不一样

 @param string 要过滤的字符串
 @return NSString
 */
+ (NSString*)safeString:(id)string;

@end

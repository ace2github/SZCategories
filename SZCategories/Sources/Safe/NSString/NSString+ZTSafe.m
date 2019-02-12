//
//  NSString+ZTSafe.m
//  ztjyyd
//
//  Created by yzl on 2017/9/13.
//  Copyright © 2017年 szy. All rights reserved.
//

#import "NSString+ZTSafe.h"
#import "NSObject+Common.h"

@implementation NSString (ZTSafe)
+ (NSString *)zt_safeString:(NSString *)src{
    return nil!=src ? src : @"";
}

+ (BOOL)zt_safeString:(NSString *)srcStr equalTo:(NSString *)toStr {
    if ([NSString zt_isEmptyStr:srcStr] && [NSString zt_isEmptyStr:toStr]) {
        return YES;
        
    } else if (srcStr && toStr && [srcStr isEqualToString:toStr]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)zt_isEmptyStr:(NSString *)str {
    if (str && [str isKindOfClass:[NSString class]] && str.length) {
        return NO;
    }
    else {
        return YES;
    }
}

+ (BOOL)zt_isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSString class]] &&
        [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }

    return NO;
}

+ (BOOL)zt_containBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }

    return ([string rangeOfString:@" "].location != NSNotFound);
}



+ (NSString *)zt_safeCheckURLString:(NSString *)urlString{
    //先解码，再编码，防止二次编码导致图片下载不了
    NSString *urlStringDecode = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStringEncode = [urlStringDecode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlStringEncode;
}

- (NSString*)zt_safeCheckURL{
    if (!self) {
        return @"";
    }
    //先解码，再编码，防止二次编码导致图片下载不了
    NSString* urlStringDecode = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* urlStringEncode = [urlStringDecode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlStringEncode;
}

- (BOOL) szy_isEmpty;
{
    return nil == self
    || 0 == [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length];
}

+ (NSString*)safeString:(id)string
{
    if([string isKindOfClass:[NSNumber class]])
    {
        NSNumber *num = (NSNumber *)string;
        return num.stringValue;
    }
    else if ([NSObject empty:string] || [string isEqualToString:@"null"] || [string isEqualToString:@"<null>"]) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@", string];
}


@end

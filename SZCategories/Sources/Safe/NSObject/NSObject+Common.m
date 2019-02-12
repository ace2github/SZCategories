//
//  NSObject+Common.m
//  ztjyyd
//
//  Created by zhang on 2018/11/5.
//  Copyright © 2018 szy. All rights reserved.
//

#import "NSObject+Common.h"
#import "NSString+ZTSafe.h"

@implementation NSObject (Common)

+ (BOOL)empty:(NSObject *)o{
    if (o==nil) {
        return YES;
    }
    if (o==NULL) {
        return YES;
    }
    if (o==[NSNull new]) {
        return YES;
    }
    if ([o isKindOfClass:[NSString class]]) {
        return [NSString zt_isBlankString:(NSString *)o];
    }
    if ([o isKindOfClass:[NSData class]]) {
        return [((NSData *)o) length]<=0;
    }
    if ([o isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSArray class]]) {
        return [((NSArray *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSSet class]]) {
        return [((NSSet *)o) count]<=0;
    }
    return NO;
}

@end

//
//  NSObject+ZTSafe.m
//  ztjyyd
//
//  Created by ChaohuiChen on 13/09/2017.
//  Copyright © 2017 szy. All rights reserved.
//

#import "NSObject+ZTSafe.h"

@implementation NSObject (ZTSafe)
+ (BOOL)zt_isNull:(id)obj {
    if (!obj || [obj isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}
@end

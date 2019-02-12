//
//  NSDictionary+ZTSafe.m
//  ztjyyd
//
//  Created by yzl on 2017/9/7.
//  Copyright © 2017年 szy. All rights reserved.
//

#import "NSDictionary+ZTSafe.h"

@implementation NSDictionary (ZTSafe)
+ (BOOL)zt_isValid:(NSDictionary *)dic {
    if (nil!=dic && [dic isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    
    return NO;
}

- (id)zt_safeObjectForKey:(id)key{
    if (!key || ![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    id obj = [self objectForKey:key];
    
    //确保返回对象不为NSNull
    if(obj && ![obj isKindOfClass:[NSNull class]]) return obj;
    return nil;
}

- (int)zt_intValueForKey:(id)key{
    id obj = [self zt_safeObjectForKey:key];
    return [obj intValue];
}

- (double)zt_doubleValueForKey:(id)key{
    id obj = [self zt_safeObjectForKey:key];
    return [obj doubleValue];
}

- (NSString *)zt_stringValueForKey:(id)key{
    id obj = [self zt_safeObjectForKey:key];
    if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj stringValue];
    }
    
    return nil;
}

@end

@implementation NSMutableDictionary (ZTSafe)
- (void)zt_safeSetObject:(id)object forKey:(id)key{
    if (!object || !key || ![key isKindOfClass:[NSString class]]) {
        return;
    }
    
    [self setValue:object forKey:key];
}

- (void)zt_setIntValue:(int)value forKey:(id)aKey{
    [self zt_safeSetObject:[[NSNumber numberWithInt:value] stringValue] forKey:aKey];
}

- (void)zt_setDoubleValue:(double)value forKey:(id)aKey{
    [self zt_safeSetObject:[[NSNumber numberWithDouble:value] stringValue] forKey:aKey];
    
}

- (void)zt_setStringValueForKey:(NSString*)string forKey:(id)aKey{
    [self zt_safeSetObject:string forKey:aKey];
}


- (void)zt_safeRemoveObjectForKey:(id)key {
    if (!key || ![key isKindOfClass:[NSString class]]) {
        return;
    }
    [self removeObjectForKey:key];
}
@end

//
//  NSDictionary+ZTSafe.h
//  ztjyyd
//
//  Created by yzl on 2017/9/7.
//  Copyright © 2017年 szy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZTSafe)
+ (BOOL)zt_isValid:(NSDictionary *)dic;

- (id)zt_safeObjectForKey:(id)key;

- (int)zt_intValueForKey:(id)key;

- (double)zt_doubleValueForKey:(id)key;

- (NSString *)zt_stringValueForKey:(id)key;
@end


@interface NSMutableDictionary (ZTSafe)
- (void)zt_safeSetObject:(id)object forKey:(id)key;

- (void)zt_setIntValue:(int)value forKey:(id)aKey;

- (void)zt_setDoubleValue:(double)value forKey:(id)aKey;

- (void)zt_setStringValueForKey:(NSString*)string forKey:(id)aKey;

- (void)zt_safeRemoveObjectForKey:(id)key;
@end

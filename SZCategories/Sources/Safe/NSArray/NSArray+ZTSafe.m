//
//  NSArray+ZTSafe.m
//  ztjyyd
//
//  Created by yzl on 2017/9/7.
//  Copyright © 2017年 szy. All rights reserved.
//

#import "NSArray+ZTSafe.h"

@implementation NSArray (ZTSafe)
+ (BOOL)zt_isValid:(NSArray *)arr {
    if (nil!=arr && [arr isKindOfClass:[NSArray class]]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)zt_isValid:(NSArray *)arr index:(NSUInteger)index {
    if ([NSArray zt_isValid:arr] && index < arr.count) {
        return YES;
    }
    
    return NO;
}

- (id)zt_safeObjectAtIndex:(NSUInteger)index {
    if (![NSArray zt_isValid:self index:index]) {
        return nil;
    }
    
    id obj = [self objectAtIndex:index];
    
    //确保返回对象不为NSNull
    if(obj && ![obj isKindOfClass:[NSNull class]]) return obj;
    return nil;
}

@end


@implementation NSMutableArray (ZTSafe)
- (void)zt_safeAddObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)zt_safeRemoveObject:(id)anObject {
    if (anObject) {
        [self removeObject:anObject];
    }
}

- (void)zt_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (![NSArray zt_isValid:self index:index]) {
        return;
    }
    
    [self removeObjectAtIndex:index];
}

- (void)zt_safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    BOOL isInsertValid = [NSArray zt_isValid:self] && index <= self.count;
    if (!isInsertValid || !anObject) {
        return;
    }
    
    [self insertObject:anObject atIndex:index];
}

- (void)zt_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (![NSArray zt_isValid:self index:index] || !anObject) {
        return;
    }
    
    [self replaceObjectAtIndex:index withObject:anObject];
}

- (void)zt_safeInsertOrAddObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        return;
    }
    
    if ([NSArray zt_isValid:self index:index]) {
        [self insertObject:anObject atIndex:index];
    } else if ([NSArray zt_isValid:self]) {
        [self addObject:anObject];
    }
}

- (instancetype)initWithObjectsCapacity:(NSUInteger)numItems {
    if (self = [self initWithCapacity:numItems]) {
        for (NSInteger i = 0; i < numItems; i++) {
            [self addObject:[NSObject new]];
        }
    }
    
    return self;
}

@end

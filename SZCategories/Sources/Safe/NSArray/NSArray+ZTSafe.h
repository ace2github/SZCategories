//
//  NSArray+ZTSafe.h
//  ztjyyd
//
//  Created by yzl on 2017/9/7.
//  Copyright © 2017年 szy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZTSafe)
+ (BOOL)zt_isValid:(NSArray *)arr;

+ (BOOL)zt_isValid:(NSArray *)arr index:(NSUInteger)index;

- (id)zt_safeObjectAtIndex:(NSUInteger)index ;
@end

@interface NSMutableArray (ZTSafe)
- (void)zt_safeAddObject:(id)anObject ;

- (void)zt_safeRemoveObject:(id)anObject ;

- (void)zt_safeRemoveObjectAtIndex:(NSUInteger)index ;

- (void)zt_safeInsertObject:(id)anObject atIndex:(NSUInteger)index ;

- (void)zt_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

- (void)zt_safeInsertOrAddObject:(id)anObject atIndex:(NSUInteger)index;

- (instancetype)initWithObjectsCapacity:(NSUInteger)numItems;
@end

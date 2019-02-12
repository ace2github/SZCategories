//
//  NSObject+ZTThread.h
//  ztjyyd
//
//  Created by ChaohuiChen on 13/09/2017.
//  Copyright © 2017 szy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZTThread)
+ (void)zt_runInMainThread:(dispatch_block_t)block;

+ (void)zt_asyncRunInMainThread:(dispatch_block_t)block;

+ (void)zt_runInMainThread:(dispatch_block_t)block delay:(double)second;

+ (void)zt_runInGlobalQueue:(dispatch_block_t)block;

+ (void)zt_runInGlobalQueue:(dispatch_block_t)block delay:(double)second;

+ (void)zt_runInQueue:(dispatch_block_t)block queue:(dispatch_queue_t)queue delay:(double)second;

+ (void)zt_lock:(float)timeout;
+ (void)zt_unlock;
@end

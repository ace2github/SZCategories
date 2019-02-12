//
//  NSObject+ZTThread.m
//  ztjyyd
//
//  Created by ChaohuiChen on 13/09/2017.
//  Copyright © 2017 szy. All rights reserved.
//

#import "NSObject+ZTThread.h"

@implementation NSObject (ZTThread)
+ (void)zt_runInMainThread:(dispatch_block_t)block {
    if (!block) return;
    
    if ([[NSThread currentThread] isMainThread]) {
        block();
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (void)zt_asyncRunInMainThread:(dispatch_block_t)block {
    if (!block) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

+ (void)zt_runInMainThread:(dispatch_block_t)block delay:(double)second {
    if (!block) return;
    [NSObject zt_runInQueue:block queue:dispatch_get_main_queue() delay:second];
}

+ (void)zt_runInGlobalQueue:(dispatch_block_t)block {
    if (!block) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+ (void)zt_runInGlobalQueue:(dispatch_block_t)block delay:(double)second {
    if (!block) return;
    
    [NSObject zt_runInQueue:block queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) delay:second];
}

+ (void)zt_runInQueue:(dispatch_block_t)block queue:(dispatch_queue_t)queue delay:(double)second {
    if (!block || !queue) return;
    
    dispatch_time_t after = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC));
    dispatch_after(after, queue, block);
}


+ (void)zt_lock:(float)timeout {
    dispatch_semaphore_wait([self syncLock], timeout > 0.0 ? timeout * NSEC_PER_SEC : DISPATCH_TIME_FOREVER);
}
+ (void)zt_unlock {
    dispatch_semaphore_signal([self syncLock]);
}

#pragma mark - private
+ (dispatch_semaphore_t)syncLock {
    static dispatch_once_t _onceToken = 0;
    static id _syncLock = nil;
    dispatch_once (&_onceToken, ^ () {
        _syncLock = dispatch_semaphore_create(1);
    });
    return _syncLock;
}
@end

//
//  SZCodeMacros.h
//  SZCategories
//
//  Created by ChaohuiChen on 2019/2/14.
//  Copyright © 2019 ChaohuiChen. All rights reserved.
//

#ifndef SZCodeMacros_h
#define SZCodeMacros_h

#define SZ_DECLARE_SINGLETON() \
+ (instancetype)defaultSingleton;

#define SZ_IMPLEMENT_SINGLETON() \
+ (instancetype)defaultSingleton { \
    static dispatch_once_t _onceToken = 0; \
    static id _defaultSingleton = nil; \
    dispatch_once (&_onceToken, ^ () { \
        _defaultSingleton = [[self alloc] init]; \
    }); \
    return _defaultSingleton; \
}

#endif /* SZCodeMacros_h */

//
//  ZProgressStyle.m
//  ZProgress
//
//  Created by zhuayi on 9/13/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import "ZProgressStyle.h"

static ZProgressStyle *sharedAccountManagerInstance = nil;

@implementation ZProgressStyle

+ (ZProgressStyle *)sharedManager {
    
    @synchronized (self)
    {
        if (sharedAccountManagerInstance == nil)
        {
            sharedAccountManagerInstance = [[self alloc] init];
        }
    }
    return sharedAccountManagerInstance;
}


+ (void)dellocInstance {
    sharedAccountManagerInstance = nil;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

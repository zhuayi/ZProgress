//
//  RoundProgressView.h
//  rehab
//
//  Created by zhuayi on 8/8/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZProgressKit.h"
#import "ZProgressStyle.h"

@interface ZProgressView : UIView

/**
 *  进度条样式
 */
@property(nonatomic, strong) ZProgressStyle *style;

/**
 *  进度
 */
@property (nonatomic, assign) CGFloat progress;


- (void)setProgress:(CGFloat)progress animated:(BOOL)animated duration:(CFTimeInterval)duration;

@property (nonatomic, weak) id<ZProgressDelegate> delegate;


@end

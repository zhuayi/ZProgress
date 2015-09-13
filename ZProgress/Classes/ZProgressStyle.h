//
//  ZProgressStyle.h
//  ZProgress
//
//  Created by zhuayi on 9/13/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZProgressType) {
    
    // 圆形进度条
    ScrollToRound,
    
    // 进度条, X 轴滑行
    ScrollToX,
    
    // 进度条, Y 轴滑行
    ScrollToY
};

@interface ZProgressStyle : NSObject

/**
 *  单例方法
 *
 *  @return
 */
+ (ZProgressStyle *)sharedManager;

/**
 *  释放单例
 */
+ (void)dellocInstance;

/**
 *  进度条类型
 */
@property (nonatomic, assign) ZProgressType zprogressType;

/**
 *  进度条宽度, 横向滚动时则为高度.
 */
@property (nonatomic, assign) CGFloat progressWidth;

/**
 *  进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;

/**
 *  背景色
 */
@property(nonatomic, strong) UIColor *trackTintColor;


@end

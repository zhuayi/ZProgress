//
//  RoundProgressLayer.h
//  rehab
//
//  Created by zhuayi on 8/19/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "ZProgressKit.h"

@interface ZProgressLayer : CALayer

///**
// *  进度条宽度
// */
//@property (nonatomic, assign) CGFloat progressWidth;


/**
 *  进度
 */
@property (nonatomic, assign) CGFloat progress;




/**
 *  进度条类型
 */
//@property (nonatomic, assign) ZProgressType zprogressType;

@property (nonatomic, weak) id<ZProgressDelegate> progressDelegate;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) CAGradientLayer *gradientLayer1;

@property (nonatomic, strong) CAGradientLayer *gradientLayer2;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

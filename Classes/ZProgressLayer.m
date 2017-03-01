//
//  RoundProgressLayer.m
//  rehab
//
//  Created by zhuayi on 8/19/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import "ZProgressLayer.h"
#define PI 3.14159265358979323846

@implementation ZProgressLayer

@dynamic progress;

@dynamic progressDelegate;

@dynamic gradientLayer;
@dynamic gradientLayer1;
@dynamic gradientLayer2;
@dynamic progressLayer;


+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.gradientLayer = [CALayer layer];
        [self addSublayer:self.gradientLayer];
        
        self.gradientLayer1 = [CAGradientLayer layer];
//
        self.gradientLayer1.colors = @[(__bridge id)[UIColor colorWithRed:63/255. green:118/255. blue:247/255. alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:83/255. green:176/255. blue:255/255. alpha:1.].CGColor];
        self.gradientLayer1.startPoint = CGPointMake(0, 0);
        self.gradientLayer1.endPoint = CGPointMake(0, 1);
        [self.gradientLayer addSublayer:self.gradientLayer1];
        
        self.gradientLayer2 = [CAGradientLayer layer];
        self.gradientLayer2.colors = @[(__bridge id)[UIColor colorWithRed:83/255. green:237/255. blue:230/255. alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:83/255. green:176/255. blue:255/255. alpha:1.].CGColor];
        self.gradientLayer2.startPoint = CGPointMake(0, 0);
        self.gradientLayer2.endPoint = CGPointMake(0, 1);
        [self.gradientLayer addSublayer:self.gradientLayer2];
        
        self.progressLayer = [CAShapeLayer layer];
//        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor redColor].CGColor;

        self.gradientLayer.mask = self.progressLayer;
        
    }
    return self;
}


/**
 *  绘制矩形
 *
 *  @param context
 */
- (void)drawRectangle:(CGContextRef)context rect:(CGRect)rect {
 
    CGContextSetLineWidth(context, 0.0);// 线的宽度
    
    // 先绘制背景
    CGContextSetFillColorWithColor(context, [ZProgressStyle sharedManager].trackTintColor.CGColor);

    // 横向滚动
    if ([ZProgressStyle sharedManager].zprogressType == ScrollToX) {
        CGContextAddRect(context,CGRectMake(0,
                                            (rect.size.height - [ZProgressStyle sharedManager].progressWidth) / 2,
                                            rect.size.width,
                                            [ZProgressStyle sharedManager].progressWidth));
    } else {
        
        CGContextAddRect(context,CGRectMake((rect.size.width - [ZProgressStyle sharedManager].progressWidth) / 2,
                                            0,
                                            [ZProgressStyle sharedManager].progressWidth,
                                            rect.size.height));
    }
    CGContextDrawPath(context, kCGPathFillStroke);// 绘画路径
    
    
    CGContextSetFillColorWithColor(context, [ZProgressStyle sharedManager].progressColor.CGColor);
    
    // 横向滚动
    if ([ZProgressStyle sharedManager].zprogressType == ScrollToX) {
     
        CGContextAddRect(context,CGRectMake(0,
                                            (rect.size.height - [ZProgressStyle sharedManager].progressWidth) / 2,
                                            rect.size.width * self.progress,
                                            [ZProgressStyle sharedManager].progressWidth));
    } else {
        CGContextAddRect(context,CGRectMake(
                                            (rect.size.width - [ZProgressStyle sharedManager].progressWidth) / 2,
                                            rect.size.height - rect.size.height * self.progress,
                                            [ZProgressStyle sharedManager].progressWidth,
                                            rect.size.height));
        
    }
    CGContextDrawPath(context, kCGPathFillStroke);// 绘画路径
}

- (void)drawInContext:(CGContextRef)context {
    
    CGRect rect = self.bounds;
    
    // 先绘制背景
    CGContextSetFillColorWithColor(context, self.backgroundColor);
    
    if ([ZProgressStyle sharedManager].zprogressType == ScrollToRound) {
        
        
        
        
//        CGContextFillEllipseInRect(context, CGRectMake([ZProgressStyle sharedManager].progressWidth / 2,
//                                                       [ZProgressStyle sharedManager].progressWidth / 2,
//                                                       rect.size.width - [ZProgressStyle sharedManager].progressWidth,
//                                                       rect.size.height - [ZProgressStyle sharedManager].progressWidth));
        
        
        CGContextSetLineCap(context, kCGLineCapRound);
        
        CGFloat xCenter = rect.size.width * 0.5;
        
        CGContextSetLineWidth(context, [ZProgressStyle sharedManager].progressWidth);
        CGFloat to = -M_PI_2 + M_PI * 2 * self.progress; // 初始值0.05
        CGFloat radius = (rect.size.width  - [ZProgressStyle sharedManager].progressWidth * 2) / 2;
        
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer1.frame = CGRectMake(xCenter, 0, xCenter,  rect.size.width);
        self.gradientLayer2.frame = CGRectMake(0, 0, xCenter, rect.size.width);
        self.progressLayer.frame = self.bounds;
        
        self.progressLayer.lineWidth = [ZProgressStyle sharedManager].progressWidth;

        CGMutablePathRef path = CGPathCreateMutable();

        CGPathAddArc(path, nil, xCenter, xCenter, radius, - M_PI_2, to, NO);
        self.progressLayer.path = path;
        CGPathRelease(path);

        
        CGContextSetStrokeColorWithColor(context, [ZProgressStyle sharedManager].trackTintColor.CGColor);
        CGContextAddArc(context, xCenter, xCenter, radius, - M_PI_2, M_PI * 2, 0);
        CGContextStrokePath(context);//绘画路径

        
    } else {
        
        [self drawRectangle:context rect:rect];
        
    }
    
    [self.progressDelegate didDrawInContext:self.progress rect:rect];
    
}

@end

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


+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
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
    
    if ([ZProgressStyle sharedManager].zprogressType == ScrollToRound) {
        
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextFillEllipseInRect(context, CGRectMake([ZProgressStyle sharedManager].progressWidth / 2,
                                                       [ZProgressStyle sharedManager].progressWidth / 2,
                                                       rect.size.width - [ZProgressStyle sharedManager].progressWidth,
                                                       rect.size.height - [ZProgressStyle sharedManager].progressWidth));
        
        
        CGContextSetStrokeColorWithColor(context, [ZProgressStyle sharedManager].progressColor.CGColor);
        CGFloat xCenter = rect.size.width * 0.5;
        CGFloat yCenter = rect.size.height * 0.5;
        
        CGContextSetLineWidth(context, 6);
        CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2; // 初始值0.05
        CGFloat radius = rect.size.width / 2 - ([ZProgressStyle sharedManager].progressWidth / 2) / 2;
        
        CGContextAddArc(context, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
        CGContextStrokePath(context);//绘画路径
        
    } else {
        
        [self drawRectangle:context rect:rect];
        
    }
    
    [self.progressDelegate didDrawInContext:self.progress rect:rect];
    
}

@end

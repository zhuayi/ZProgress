//
//  ZProgressKit.h
//  IOSLib
//
//  Created by zhuayi on 8/24/15.
//  Copyright (c) 2015 zhuayi. All rights reserved.
//


//typedef NS_ENUM(NSInteger, ZProgressType) {
//    
//    // 圆形进度条
//    ZProgressTypeTypeRound,
//    
//    // 举行进度条, X 轴滑行
//    ZProgressTypeTyperectangleX,
//    
//    // 举行进度条, Y 轴滑行
//    ZProgressTypeTyperectangleY
//};

@class ZProgressView;

@protocol ZProgressDelegate <NSObject>

- (void)didDrawInContext:(CGFloat)progress rect:(CGRect)rect;

@end

#import "ZProgressView.h"

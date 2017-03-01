//
//  RoundProgressView.m
//  rehab
//
//  Created by zhuayi on 8/8/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import "ZProgressView.h"
#import "ZProgressLayer.h"

@implementation ZProgressView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

+ (Class)layerClass {
    return [ZProgressLayer class];
}

- (CGFloat)progress {
    
    NSLog(@"self.roundProgresslayer.progress is %f", self.roundProgresslayer.progress);
    return self.roundProgresslayer.progress;
}


- (ZProgressLayer *)roundProgresslayer {
    
    return (ZProgressLayer *)self.layer;
}

- (void)setProgress:(CGFloat)progress {
    
    [self setProgress:progress animated:NO duration:0.0];
}


- (void)setProgress:(CGFloat)progress animated:(BOOL)animated duration:(CFTimeInterval)duration {
    [self.roundProgresslayer removeAnimationForKey:@"progress"];
    
    CGFloat pinnedProgress = MIN(MAX(progress, 0.0f), 1.0f);
    if (animated) {

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fillMode=kCAFillModeForwards;
        animation.fromValue = [NSNumber numberWithFloat:self.progress];
        animation.toValue = [NSNumber numberWithFloat:pinnedProgress];
        animation.beginTime = CACurrentMediaTime();
        animation.delegate = self;
        [self.roundProgresslayer addAnimation:animation forKey:@"progress"];
        
    } else {
        [self.roundProgresslayer setNeedsDisplay];
        self.roundProgresslayer.progress = pinnedProgress;
    }
}

- (void)setZprogressType:(ZProgressType)zprogressType {
    
    if (zprogressType == ScrollToRound) {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.masksToBounds = YES;
    }
}

- (ZProgressStyle *)style {
    return [ZProgressStyle sharedManager];
}


- (void)setDelegate:(id<ZProgressDelegate>)delegate {
    _delegate = delegate;
    self.roundProgresslayer.progressDelegate = delegate;
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    NSNumber *pinnedProgressNumber = [animation valueForKey:@"toValue"];
    self.roundProgresslayer.progress = [pinnedProgressNumber floatValue];
}



- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    if ([ZProgressStyle sharedManager].zprogressType == ScrollToRound) {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.masksToBounds = YES;
    }
    
    CGFloat windowContentsScale = self.window.screen.scale;
    self.layer.contentsScale = windowContentsScale;
    [self.layer setNeedsDisplay];
}

- (void)dealloc {
    
    [ZProgressStyle dellocInstance];
    NSLog(@"%s", __func__);
}
@end

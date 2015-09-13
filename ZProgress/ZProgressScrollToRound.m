//
//  ZProgressScrollToRound.m
//  ZProgress
//
//  Created by zhuayi on 9/13/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import "ZProgressScrollToRound.h"
#import "ZProgressView.h"

@interface ZProgressScrollToRound ()<ZProgressDelegate>

@end

@implementation ZProgressScrollToRound {
    
    UILabel *_textLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    ZProgressView *roundProgessView = [[ZProgressView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    
    // 进度条宽度
    roundProgessView.style.progressWidth = 12.0;
    [roundProgessView setProgress:30 / 100.0 animated:YES duration:1.2];
    roundProgessView.delegate = self;
    roundProgessView.style.zprogressType = ScrollToRound;
    roundProgessView.style.progressColor = [UIColor redColor];
    roundProgessView.style.trackTintColor = [UIColor greenColor];
    roundProgessView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:roundProgessView];
    
    
    // 自定义滑块
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _textLabel.center = roundProgessView.center;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.backgroundColor = [UIColor blackColor];
    _textLabel.textColor = [UIColor redColor];
    [self.view addSubview:_textLabel];
}

- (void)didDrawInContext:(CGFloat)progress rect:(CGRect)rect {
    
    _textLabel.text = [NSString stringWithFormat:@"%0.f%%", progress * 100];
    NSLog(@"progress is %f, %@", progress, NSStringFromCGRect(rect));
}

@end

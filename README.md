# ZProgress

[![CI Status](http://img.shields.io/travis/zhuayi/ZProgress.svg?style=flat)](https://travis-ci.org/zhuayi/ZProgress)
[![Version](https://img.shields.io/cocoapods/v/ZProgress.svg?style=flat)](http://cocoapods.org/pods/ZProgress)
[![License](https://img.shields.io/cocoapods/l/ZProgress.svg?style=flat)](http://cocoapods.org/pods/ZProgress)
[![Platform](https://img.shields.io/cocoapods/p/ZProgress.svg?style=flat)](http://cocoapods.org/pods/ZProgress)

## Usage

ZProgress是一款自定义非常方便的进度条控件

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Style

进度条类型
```objective-c
typedef NS_ENUM(NSInteger, ZProgressType) {
// 圆形进度条
ScrollToRound,
// 进度条, X 轴滑行
ScrollToX,
// 进度条, Y 轴滑行
ScrollToY
};
```

进度条类型
```objective-c
@property (nonatomic, assign) ZProgressType zprogressType;
```

进度条宽度, 横向滚动时则为高度.
```objective-c
@property (nonatomic, assign) CGFloat progressWidth;
```

进度条颜色
```objective-c
@property (nonatomic, strong) UIColor *progressColor;
```

进度条背景色
```objective-c
@property(nonatomic, strong) UIColor *trackTintColor;
```

## Example

```
ZProgressView *roundProgessView = [[ZProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
[roundProgessView setProgress:30 / 100.0 animated:YES duration:1.2]; // 动画
roundProgessView.delegate = self; // 代理
roundProgessView.style.progressWidth = 50.0; // 进度条宽度
roundProgessView.style.zprogressType = ScrollToX; // 滚动方向
roundProgessView.style.progressColor = [UIColor redColor];  // 进度条颜色值
roundProgessView.style.trackTintColor = [UIColor greenColor]; // 进度条背景色
roundProgessView.backgroundColor = [UIColor grayColor];
[self.view addSubview:roundProgessView];
```
![](https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_1.gif)![](https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_2.gif)![](https://raw.githubusercontent.com/zhuayi/ZProgress/master/screenshots/screenshots_3.gif)


## Installation

ZProgress is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ZProgress"
```

## Author

zhuayi, 2179942@qq.com

## License

ZProgress is available under the MIT license. See the LICENSE file for more info.

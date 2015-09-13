//
//  ViewController.m
//  ZProgress
//
//  Created by zhuayi on 9/13/15.
//  Copyright (c) 2015 renxin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

static NSString *reuseIdetify = @"Cell";

@implementation ViewController {
    
    NSArray *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    dataArray = @[
                  @{
                      @"name": @"横向滚动",
                      @"Class": @"ZProgressScrollToX",
                      },
                  @{
                      @"name": @"纵向滚动",
                      @"Class": @"ZProgressScrollToY",
                      },
                  @{
                      @"name": @"圆",
                      @"Class": @"ZProgressScrollToRound",
                      },
                  ];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdetify];
    [self.view addSubview:tableView];

}


#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    cell.textLabel.text = dataArray[indexPath.row][@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    NSString *className = dataArray[indexPath.row][@"Class"];
    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

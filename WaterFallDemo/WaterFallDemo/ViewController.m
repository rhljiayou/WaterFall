//
//  ViewController.m
//  WaterFallDemo
//
//  Created by blue on 13-4-25.
//  Copyright (c) 2013年 blue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //解析数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
    NSString *string = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [string objectFromJSONString];
    NSMutableArray *arrayImage = [[NSMutableArray alloc]init];
    
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dataD = [array objectAtIndex:i];
        if (dataD) {
            ImageInfo *imageInfo = [[ImageInfo alloc]initWithDictionary:dataD];
            [arrayImage addObject:imageInfo];
        }
    }
    NSLog(@"%@",arrayImage);
    
    self.waterView = [[ImageWaterView alloc]initWithDataArray:arrayImage withFrame:CGRectMake(0, 0, 320, 460)];

    //添加上拉加载更多
    __weak ViewController *blockSelf = self;
    [self.waterView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"上拉刷新");
        //使用GCD开启一个线程，使圈圈转2秒
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView loadNextPage:arrayImage];
            [blockSelf.waterView.infiniteScrollingView stopAnimating];
        });
    }];
    //添加下拉刷新
    [self.waterView addPullToRefreshWithActionHandler:^{
        NSLog(@"下拉更新");
        //使用GCD开启一个线程，使圈圈转2秒
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView refreshView:arrayImage];
            [blockSelf.waterView.pullToRefreshView stopAnimating];
        });
    }];
    [self.view addSubview:self.waterView];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

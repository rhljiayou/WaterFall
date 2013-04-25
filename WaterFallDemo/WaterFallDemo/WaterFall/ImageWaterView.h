//
//  ImageWaterView.h
//  hlrenTest
//
//  Created by blue on 13-4-23.
//  Copyright (c) 2013年 blue. All rights reserved.
//
/*
思路：在scrollview上面放三个UIView代表每一个列，
     然后在每个UIview上添加图片，每次都是挑最短的UIView把图片添加上去；
 */
#import <UIKit/UIKit.h>
#import "SelfImageVIew.h"
#define SPACE 4
#define WIDTH [UIScreen mainScreen].applicationFrame.size.width/3
@interface ImageWaterView : UIScrollView<ImageDelegate>
{
    //第一列,第二列,第三列
    UIView *firstView,*secondView,*thridView;
    //最高列，最低列,行数
    int higher,lower,row;
    //最高列高度
    float highValue;
    //记录多少图片
    int countImage;
}
//图像对象数组
@property (nonatomic,strong)NSArray *arrayImage;
//初始化瀑布流，array图片对象数组
-(id)initWithDataArray:(NSArray*)array withFrame:(CGRect)rect;
//刷新瀑布流
-(void)refreshView:(NSArray*)array;
//加载下一页瀑布流
-(void)loadNextPage:(NSArray*)array;

@end

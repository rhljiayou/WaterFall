//
//  SelfImageVIew.m
//  hlrenTest
//
//  Created by blue on 13-4-23.
//  Copyright (c) 2013年 blue. All rights reserved.
//

#import "SelfImageVIew.h"

@implementation SelfImageVIew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithImageInfo:(ImageInfo*)imageInfo y:(float)y  withA:(int)a
{
    
    float imageW = imageInfo.width;
    float imageH = imageInfo.height;
    //缩略图宽度和宽度
    float width = WIDTH - SPACE;
    float height = width * imageH / imageW;

    self = [super initWithFrame:CGRectMake(0, y, WIDTH, height + SPACE)];
    if (self) {
        self.data = imageInfo;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SPACE / 2 , SPACE / 2 , width, height)];
        NSURL *url = [NSURL URLWithString:imageInfo.thumbURL];
        [imageView setImageWithURL:url placeholderImage:nil];
        imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:imageView];
        //如果想加别的信息在此可加
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(SPACE / 2, height - 20 + SPACE, width, 20)];
        labe.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        labe.text = [NSString stringWithFormat:@"第%i个图片",a];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:labe];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate clickImage:self.data];
}
@end

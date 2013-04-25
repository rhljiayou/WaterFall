//
//  ImageInfo.h
//  hlrenTest
//
//  Created by blue on 13-4-23.
//  Copyright (c) 2013年 blue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfo : NSObject

@property float width;
@property float height;
@property (nonatomic,strong)NSString *thumbURL;

-(id)initWithDictionary:(NSDictionary*)dictionary;
@end

//
//  HMTg.m
//  CustomizeCell
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMTg.h"

@implementation HMTg


+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


@end

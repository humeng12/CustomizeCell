//
//  HMTg.h
//  CustomizeCell
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMTg : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;
/**
 *  图片
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  购买人数
 */
@property (nonatomic, copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

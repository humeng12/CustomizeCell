//
//  ViewController.m
//  CustomizeCell
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "ViewController.h"
#import "HMTg.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *tgs;

@end

@implementation ViewController



/**
 *  数据的懒加载
 */
- (NSArray *)tgs
{
    if (_tgs == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            HMTg *tg = [HMTg tgWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [tgArray addObject:tg];
        }
        
        // 4.赋值
        _tgs = tgArray;
    }
    return _tgs;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

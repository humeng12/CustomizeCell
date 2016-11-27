//
//  ViewController.m
//  CustomizeCell
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "ViewController.h"
#import "HMTg.h"
#import "HMTgCell.h"
#import "MJTgFooterView.h"
#import "MJTgHeaderView.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *tgs;

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
    
    // 设置每一行cell的高度
    self.tableView.rowHeight = 80;
    
    // 设置headerView
    self.tableView.tableHeaderView = [MJTgHeaderView headerView];
    
    // 设置footerView
    MJTgFooterView *footer = [MJTgFooterView footerView];
    self.tableView.tableFooterView = footer;
    
}



#pragma mark - MJTgFooterViewDelegate方法
/**
 *  加载更多的数据
 */
- (void)tgFooterViewDidClickedLoadBtn:(MJTgFooterView *)tgFooterView
{
#warning 正常开发:发送网络请求给远程的服务器
    // 1.添加更多的模型数据
    HMTg *tg = [[HMTg alloc] init];
    tg.icon = @"ad_01";
    tg.title = @"新增加的团购数据..";
    tg.price = @"100";
    tg.buyCount = @"0";
    [self.tgs addObject:tg];
    
    // 2.刷新表格(告诉tableView重新加载模型数据, 调用tableView的reloadData)
    [self.tableView reloadData];
}




#pragma mark - 数据源方法
/**
 *  一共有多少行数据
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    HMTgCell *cell = [HMTgCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.tg = self.tgs[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

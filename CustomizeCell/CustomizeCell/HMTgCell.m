//
//  HMTgCell.m
//  CustomizeCell
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMTgCell.h"
#import "HMTg.h"


@interface HMTgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end

@implementation HMTgCell



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"tg";
    HMTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HMTgCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setTg:(HMTg *)tg
{
    _tg = tg;
    
    // 1.图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    
    // 2.标题
    self.titleView.text = tg.title;
    
    // 3.价格
    self.priceView.text = [NSString stringWithFormat:@"￥%@", tg.price];
    
    // 4.购买数
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

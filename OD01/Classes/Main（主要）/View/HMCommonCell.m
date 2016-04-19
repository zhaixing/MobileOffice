//
//  HMCommonCell.m
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMCommonCell.h"
#import "HMCommonItem.h"

@implementation HMCommonCell
#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"common";
    HMCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMCommonCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置标题的字体
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

#pragma mark - 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //调整标题的位置
    self.textLabel.y=2;
    // 调整子标题的x
//    self.detailTextLabel.x = CGRectGetMaxX(self.textLabel.frame) + 10;
    self.detailTextLabel.x=CGRectGetMaxX(self.imageView.frame)*1.3;
    self.detailTextLabel.y=CGRectGetMaxY(self.textLabel.frame)+5;
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y -= (35 - HMStatusCellMargin);
//    [super setFrame:frame];
//
//    HMLog(@"%f", self.y);
//}

#pragma mark - setter
- (void)setItem:(HMCommonItem *)item
{
    _item = item;
    
    // 1.设置基本数据
    self.imageView.image = [UIImage imageWithName:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
}
@end

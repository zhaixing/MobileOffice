//
//  HMCommonCell.h
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//  “设置”中的cell样式，标题垂直居中

#import <UIKit/UIKit.h>
@class HMCommonItem;

@interface HMCommonCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(int)rows;

/** cell对应的item数据 */
@property (nonatomic, strong) HMCommonItem *item;
@end

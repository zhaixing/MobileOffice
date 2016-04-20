//
//  HMSettingCell.h
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//  专门给“应用”用的cell格式，其样式特殊

#import <UIKit/UIKit.h>
@class HMCommonItem;
@interface HMSettingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(int)rows;
/** cell对应的item数据 */
@property (nonatomic, strong) HMCommonItem *item;
@end


//
//  HMCommonCell.h
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMCommonItem;

@interface HMCommonCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** cell对应的item数据 */
@property (nonatomic, strong) HMCommonItem *item;
@end

//
//  HMSettingViewController.m
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMSettingViewController.h"
#import "HMCommonGroup.h"
#import "HMCommonItem.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"
#import "HMCommonLabelItem.h"
#import "HMGeneralSettingViewController.h"

@interface HMSettingViewController ()

@end

@implementation HMSettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroups];
    
    [self setupFooter];
}

- (void)setupFooter
{
    // 1.创建按钮
    UIButton *logout = [[UIButton alloc] init];
    
    // 2.设置属性
    logout.titleLabel.font = [UIFont systemFontOfSize:14];
    [logout setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    [logout setTitleColor:HMColor(255, 10, 10,1.0) forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage resizedImage:@"common_card_background"] forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage resizedImage:@"common_card_background_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置尺寸(tableFooterView和tableHeaderView的宽度跟tableView的宽度一样)
    logout.height = 35;
    
    self.tableView.tableFooterView = logout;
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

- (void)setupGroup0
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
//    group.footer = @"tail部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *accountSetting = [HMCommonArrowItem itemWithTitle:@"帐号设置"];
    
    group.items = @[accountSetting];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *news = [HMCommonArrowItem itemWithTitle:@"消息通知"];
    
    HMCommonArrowItem *general=[HMCommonArrowItem itemWithTitle:@"通用"];
    general.destVcClass = [HMGeneralSettingViewController class];
    
    HMCommonArrowItem *appSetting=[HMCommonArrowItem itemWithTitle:@"应用设置"];
    
    group.items = @[news,general,appSetting];
}

- (void)setupGroup2
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
//    group.header = @"头部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *about = [HMCommonArrowItem itemWithTitle:@"关于"];
    
    group.items = @[about];
}

@end

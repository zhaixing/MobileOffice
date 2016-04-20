//
//  HMProfileViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMProfileViewController.h"
#import "HMCommonGroup.h"
#import "HMCommonItem.h"
#import "HMSettingCell.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"
#import "HMCommonLabelItem.h"
#import "HMSettingViewController.h"

@interface HMProfileViewController ()
@end

@implementation HMProfileViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化模型数据
    [self setupGroups];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"客服" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
}

- (void)setting
{
    HMSettingViewController *setting = [[HMSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

- (void)setupGroup0
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *manager = [HMCommonArrowItem itemWithTitle:@"程鹏远（管理员）" icon:@"PRModelOutGoing"];
//    manager.badgeValue = @"5";
    
    group.items = @[manager];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *company = [HMCommonArrowItem itemWithTitle:@"公司管理" icon:@"me_company"];
    
    HMCommonArrowItem *webManage = [HMCommonArrowItem itemWithTitle:@"登录网页版" icon:@"me_webManage"];
//    collect.subtitle = @"(10)";
//    collect.badgeValue = @"1";
    
//    HMCommonArrowItem *like = [HMCommonArrowItem itemWithTitle:@"赞" icon:@"like"];
//    like.subtitle = @"(36)";
//    like.badgeValue = @"10";
    
    group.items = @[company, webManage];
}

- (void)setupGroup2
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *setting = [HMCommonArrowItem itemWithTitle:@"设置" icon:@"me_setting"];
//    newFriend.badgeValue = @"5";
    
    HMCommonArrowItem *collection=[HMCommonArrowItem itemWithTitle:@"收藏" icon:@"me_collection"];
    
    HMCommonArrowItem *help=[HMCommonArrowItem itemWithTitle:@"帮助和反馈" icon:@"me_help"];
    
    group.items = @[setting, collection, help];
}

- (void)setupGroup3
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *recommend = [HMCommonArrowItem itemWithTitle:@"推荐给好友" icon:@"Recommend"];
//    newFriend.badgeValue = @"5";
    
    group.items = @[recommend];
}

@end
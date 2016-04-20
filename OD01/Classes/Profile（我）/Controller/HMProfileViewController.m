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
#import "HMCustomerServeViewController.h"

#import "HMPersonalInfoViewController.h"
#import "HMGeneralSettingViewController.h"
#import "HMHelpViewController.h"
@interface HMProfileViewController ()
@end

@implementation HMProfileViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化模型数据
    [self setupGroups];
    
    [self setupNavBar];
}

-(void)setupNavBar
{
    //右上角的客服
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitle:@"客服" forState:UIControlStateNormal];
    [buttonRight setTitleColor:themeColor forState:UIControlStateNormal];
    [buttonRight setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [buttonRight setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    buttonRight.sizeToFit;
    
    // 监听按钮点击
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];
    [buttonRight addTarget:self action:@selector(CustomerServe) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  客服
 */
-(void)CustomerServe
{
    HMCustomerServeViewController *cs=[[HMCustomerServeViewController alloc] init];
    [self.navigationController pushViewController:cs animated:YES];
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
    manager.destVcClass=[HMPersonalInfoViewController class];
    
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
    setting.destVcClass=[HMSettingViewController class];
    
    HMCommonArrowItem *collection=[HMCommonArrowItem itemWithTitle:@"收藏" icon:@"me_collection"];
    
    HMCommonArrowItem *help=[HMCommonArrowItem itemWithTitle:@"帮助和反馈" icon:@"me_help"];
    help.destVcClass=[HMHelpViewController class];
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
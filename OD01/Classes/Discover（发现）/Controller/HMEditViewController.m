//
//  HMEditViewController.m
//  猫头鹰助理
//
//  Created by sam on 16/4/20.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEditViewController.h"
#import "HMCommonGroup.h"
#import "HMCommonSwitchItem.h"

@interface HMEditViewController ()

@end

@implementation HMEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"应用管理";
    
    // 初始化模型数据
    [self setupGroups];
    
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
    [self.groups addObject:group];
    
    // 2.设置组的基本数据
    group.header = @"工作";
    group.footer=@"CRM";
    //    group.footer = @"第0组尾部的详细信息";
    
    // 3.设置组的所有行数据
    HMCommonSwitchItem *notice = [HMCommonSwitchItem itemWithTitle:@"通知" icon:@"AppNotice"];
//    notice.badgeValue=@"17777";
    notice.subtitle = @"一呼百应，支持投票功能";
    
    HMCommonSwitchItem *attendance = [HMCommonSwitchItem itemWithTitle:@"考勤" icon:@"AppAttendance"];
    attendance.subtitle = @"上下班打卡";
    
    HMCommonSwitchItem *process=[HMCommonSwitchItem itemWithTitle:@"流程" icon:@"AppProcess"];
    process.subtitle=@"请假、加班等，各种申请";
    
    HMCommonSwitchItem *task=[HMCommonSwitchItem itemWithTitle:@"任务" icon:@"AppTask"];
    task.subtitle=@"分配任务，逐一跟踪";
    
    HMCommonSwitchItem *legwork=[HMCommonSwitchItem itemWithTitle:@"客户拜访" icon:@"AppLegwork"];
    legwork.subtitle=@"外出拜访需现场定位，并提交总结";
    
    HMCommonSwitchItem *workReport=[HMCommonSwitchItem itemWithTitle:@"工作汇报" icon:@"AppWorkReport"];
    workReport.subtitle=@"日报、周报、月报";
    
    group.items = @[notice, attendance, process, task, legwork, workReport];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    group.footer=@"工具";
    // 2.设置组的所有行数据
    HMCommonSwitchItem *customer = [HMCommonSwitchItem itemWithTitle:@"客户" icon:@"AppCustomer"];
    customer.subtitle=@"管理客户信息，记录沟通细节";
    
    HMCommonSwitchItem *salesChance = [HMCommonSwitchItem itemWithTitle:@"销售机会" icon:@"AppSalesChance"];
    salesChance.subtitle=@"管理商机，跟踪销售过程";
    
    group.items = @[customer, salesChance];
}

- (void)setupGroup2
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonSwitchItem *cloudDisk = [HMCommonSwitchItem itemWithTitle:@"应用" icon:@"AppCloudDisk"];
    cloudDisk.subtitle=@"公司文件共享，个人文件存储";
    group.items = @[cloudDisk];
}
@end

//
//  HMDiscoverViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMDiscoverViewController.h"
#import "UIImage+Extension.h"
#import "HMSettingCell.h"
#import "HMCommonItem.h"
#import "HMCommonGroup.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"
#import "HMCommonLabelItem.h"

#import "HMHelpViewController.h"
#import "HMEditViewController.h"
#import "HMJiaBanViewController.h"
#import "HMNoticeViewController.h"
#import "HMAttendanceViewController.h"
#import "HMProcessViewController.h"
#import "HMTaskViewController.h"
#import "HMLegworkViewController.h"
#import "HMWorkReportTableViewController.h"
#import "HMCloudDiskViewController.h"

#import "SwipableViewController.h"
#import "HMDayReportViewController.h"
#import "HMWeekReportViewController.h"
#import "HMMounthReportViewController.h"
#import "HMDiscoverViewController.h"

@interface HMDiscoverViewController ()
{
    HMDayReportViewController *dayR;
    HMWeekReportViewController *weekR;
    HMMounthReportViewController *mounthR;
}
@end

@implementation HMDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //搜索框
//    UISearchBar *bar=[[UISearchBar alloc] init];
//    bar.frame=CGRectMake(0, 0, 300, 35);
//    bar.backgroundImage=[UIImage resizedImage:@"navigationbar_button_background"];
//    self.navigationItem.titleView=bar;
    
    // 初始化模型数据
    [self setupGroups];
    
    //    HMLog(@"viewDidLoad--%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
    
    [self setNavBar];
}

-(void)setNavBar
{
    //左上角的帮助
    UIButton *buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLeft setTitle:@"帮助" forState:UIControlStateNormal];
    [buttonLeft setTitleColor:themeColor forState:UIControlStateNormal];
    [buttonLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [buttonLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    buttonLeft.sizeToFit;
    
    // 监听按钮点击
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonLeft];
    [buttonLeft addTarget:self action:@selector(help) forControlEvents:UIControlEventTouchUpInside];
    
    //右上角的写私信
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitle:@"编辑" forState:UIControlStateNormal];
    [buttonRight setTitleColor:themeColor forState:UIControlStateNormal];
    [buttonRight setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [buttonRight setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    buttonRight.sizeToFit;
    
    // 监听按钮点击
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];
    [buttonRight addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
}
/**
 *  帮助控制器跳转事件
 */
-(void)help
{
//    HMLog(@"点击了---帮助");
    HMHelpViewController *help=[[HMHelpViewController alloc] init];
    [self.navigationController pushViewController:help animated:YES];
}
/**
 *  编辑控制器
 */
-(void)edit
{
//    HMLog(@"点击了---编辑");
    HMEditViewController *edit=[[HMEditViewController alloc] init];
    [self.navigationController pushViewController:edit animated:YES];

}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//
//    HMLog(@"viewDidAppear--%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
//}

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
    HMCommonArrowItem *notice = [HMCommonArrowItem itemWithTitle:@"通知" icon:@"AppNotice"];
    notice.destVcClass=[HMNoticeViewController class];
//    notice.badgeValue=@"17777";
    notice.subtitle = @"一呼百应，支持投票功能";
    
    HMCommonArrowItem *attendance = [HMCommonArrowItem itemWithTitle:@"考勤" icon:@"AppAttendance"];
    attendance.destVcClass=[HMAttendanceViewController class];
    attendance.subtitle = @"上下班打卡";
    
    HMCommonArrowItem *process=[HMCommonArrowItem itemWithTitle:@"流程" icon:@"AppProcess"];
    process.destVcClass=[HMProcessViewController class];
    process.subtitle=@"请假、加班等，各种申请";
    
    HMCommonArrowItem *task=[HMCommonArrowItem itemWithTitle:@"任务" icon:@"AppTask"];
    task.destVcClass=[HMTaskViewController class];
    task.subtitle=@"分配任务，逐一跟踪";
    
    HMCommonArrowItem *legwork=[HMCommonArrowItem itemWithTitle:@"客户拜访" icon:@"AppLegwork"];
    legwork.destVcClass=[HMLegworkViewController class];
    legwork.subtitle=@"外出拜访需现场定位，并提交总结";
    
    HMCommonArrowItem *workReport=[HMCommonArrowItem itemWithTitle:@"工作汇报" icon:@"AppWorkReport"];
//    workReport.destVcClass=[HMWorkReportTableViewController class];
    workReport.operation= ^{
        dayR=[[HMDayReportViewController alloc]init];
        weekR=[[HMWeekReportViewController alloc] init];
        mounthR=[[HMMounthReportViewController alloc] init];
        
        //使用框架Swipable
        SwipableViewController *viewController=[[SwipableViewController alloc] initWithTitle:@"工作汇报" andSubTitles:@[@"日报",@"周报",@"月报"] andControllers:@[dayR,weekR,mounthR]];
//        viewController.view.backgroundColor=[UIColor whiteColor];
//        viewController.tabBarController.tabBar.translucent=NO;    // tabbar 是否半透明
//        self.tabBar.translucent = NO;
//        navigationController.navigationBar.alpha=0.5; 
//        viewController.tabBarController.tabBar.backgroundColor=[UIColor whiteColor];
//        viewController.navigationController.navigationBar.alpha=1.0;
        
        viewController.navigationController.navigationBar.alpha=0.5;
        viewController.navigationController.navigationBar.backgroundColor=[UIColor yellowColor];
        viewController.view.backgroundColor=[UIColor greenColor];
//        viewController.ta
        [self.navigationController pushViewController:viewController animated:YES];
    };
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
    HMCommonArrowItem *customer = [HMCommonArrowItem itemWithTitle:@"客户" icon:@"AppCustomer"];
    customer.subtitle=@"管理客户信息，记录沟通细节";
    
    HMCommonArrowItem *salesChance = [HMCommonArrowItem itemWithTitle:@"销售机会" icon:@"AppSalesChance"];
    salesChance.subtitle=@"管理商机，跟踪销售过程";
    
    group.items = @[customer, salesChance];
}

- (void)setupGroup2
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *cloudDisk = [HMCommonArrowItem itemWithTitle:@"云盘" icon:@"AppCloudDisk"];
    cloudDisk.subtitle=@"公司文件共享，个人文件存储";
    cloudDisk.destVcClass=[HMCloudDiskViewController class];
    group.items = @[cloudDisk];
}

@end

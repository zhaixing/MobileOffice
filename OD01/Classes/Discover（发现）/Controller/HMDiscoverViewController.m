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
#import "HMCommonCell.h"
#import "HMCommonItem.h"
#import "HMCommonGroup.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"
#import "HMCommonLabelItem.h"

@interface HMDiscoverViewController ()
@property (nonatomic,strong) NSMutableArray *groups;
@end

@implementation HMDiscoverViewController

/**
 用一个模型来描述每组的信息：组头、组尾、这组的所有行模型
 用一个模型来描述每行的信息：图标、标题、子标题、右边的样式（箭头、文字、数字、开关、打钩）
 */

-(NSMutableArray *)groups
{
    if (_groups==nil) {
        self.groups=[NSMutableArray array];
    }
    return  _groups;
}

/** 屏蔽tableView的样式 */
- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //搜索框
//    UISearchBar *bar=[[UISearchBar alloc] init];
//    bar.frame=CGRectMake(0, 0, 300, 35);
//    bar.backgroundImage=[UIImage resizedImage:@"navigationbar_button_background"];
//    self.navigationItem.titleView=bar;
    
    // 设置tableView属性
    self.tableView.backgroundColor = HMGlobalBg;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = HMStatusCellMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(HMStatusCellMargin - 35, 0, 0, 0);
    
    // 初始化模型数据
    [self setupGroups];
    
    //    HMLog(@"viewDidLoad--%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
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
    group.header = @"第0组头部";
    group.footer = @"第0组尾部的详细信息";
    
    // 3.设置组的所有行数据
    HMCommonArrowItem *notice = [HMCommonArrowItem itemWithTitle:@"通知" icon:@"AppNotice"];
    notice.badgeValue=@"17777";
    notice.subtitle = @"一呼百应，支持投票功能";
    
    HMCommonArrowItem *attendance = [HMCommonArrowItem itemWithTitle:@"考勤" icon:@"AppAttendance"];
    attendance.subtitle = @"上下班打卡";
    
    HMCommonArrowItem *process=[HMCommonArrowItem itemWithTitle:@"流程" icon:@"AppProcess"];
    process.subtitle=@"请假、加班等，各种申请";
    
    HMCommonArrowItem *task=[HMCommonArrowItem itemWithTitle:@"任务" icon:@"AppTask"];
    task.subtitle=@"分配任务，逐一跟踪";
    
    HMCommonArrowItem *legwork=[HMCommonArrowItem itemWithTitle:@"客户拜访" icon:@"AppLegwork"];
    legwork.subtitle=@"外出拜访需现场定位，并提交总结";
    
    HMCommonArrowItem *workReport=[HMCommonArrowItem itemWithTitle:@"工作汇报" icon:@"AppWorkReport"];
    workReport.subtitle=@"日报、周报、月报";
    
    group.items = @[notice, attendance, process, task, legwork, workReport];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
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
    HMCommonArrowItem *cloudDisk = [HMCommonArrowItem itemWithTitle:@"应用" icon:@"AppCloudDisk"];
    cloudDisk.subtitle=@"公司文件共享，个人文件存储";
    group.items = @[cloudDisk];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HMCommonGroup *group=self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMCommonCell *cell = [HMCommonCell cellWithTableView:tableView];
    HMCommonGroup *group = self.groups[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end

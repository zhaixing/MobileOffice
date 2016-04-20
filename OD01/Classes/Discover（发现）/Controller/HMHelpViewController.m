//
//  HMHelpViewController.m
//  猫头鹰助理
//
//  Created by sam on 16/4/20.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMHelpViewController.h"
#import "HMCommonArrowItem.h"
#import "HMCommonGroup.h"
#import "HMurlStr.h"
#import "HMGeneralViewController.h"
@interface HMHelpViewController ()

@end

@implementation HMHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"使用帮助";
    
    [self setupGroup];
}

-(void)setupGroup
{
    //1.创建组
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    
    //2、设置组的所有行数据
    HMCommonArrowItem *addMember=[HMCommonArrowItem itemWithTitle:@"怎么添加员工"];
//    addMember.destVcClass=[HMGeneralViewController class];
//    addMember.urlStr=@"http://kd77.cn/help/AddUsers.html";
//    addMember.title=@"怎么添加员工";
    addMember.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/AddUsers.html";
        NSLog(@"1111%@",userEntity.urlStr);
        addMemberUrl.title=@"怎么添加员工";
        addMemberUrl.userEntity=userEntity;
    };

    HMCommonArrowItem *useNotice=[HMCommonArrowItem itemWithTitle:@"怎么使用通知"];
    useNotice.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/SendNotification.html";
        addMemberUrl.title=@"怎么使用通知";
        addMemberUrl.userEntity=userEntity;
    };
    HMCommonArrowItem *setKaoqin=[HMCommonArrowItem itemWithTitle:@"怎么设置考勤"];
    setKaoqin.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/Attendance.html";
        addMemberUrl.title=@"怎么设置考勤";
        addMemberUrl.userEntity=userEntity;
    };
    HMCommonArrowItem *addLiucheng=[HMCommonArrowItem itemWithTitle:@"怎么创建流程"];
    addLiucheng.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/Process.html";
        addMemberUrl.title=@"怎么创建流程";
        addMemberUrl.userEntity=userEntity;
    };
    HMCommonArrowItem *useTask=[HMCommonArrowItem itemWithTitle:@"怎么使用任务"];
    useTask.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/Task.html";
        addMemberUrl.title=@"怎么使用任务";
        addMemberUrl.userEntity=userEntity;
    };
    
    HMCommonArrowItem *workHuibao=[HMCommonArrowItem itemWithTitle:@"怎么使用工作汇报"];
    workHuibao.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/WorkReport.html";
        addMemberUrl.title=@"怎么使用工作汇报";
        addMemberUrl.userEntity=userEntity;
    };
    
    HMCommonArrowItem *MemberManage=[HMCommonArrowItem itemWithTitle:@"怎么使用客户管理"];
    MemberManage.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/CustomerManagement.html";
        addMemberUrl.title=@"怎么使用客户管理";
        addMemberUrl.userEntity=userEntity;
    };
    
    HMCommonArrowItem *MemberVisit=[HMCommonArrowItem itemWithTitle:@"怎么使用客户拜访"];
    MemberVisit.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/CustomerVisit.html";
        addMemberUrl.title=@"怎么使用客户拜访";
        addMemberUrl.userEntity=userEntity;
    };
    
    HMCommonArrowItem *customChance=[HMCommonArrowItem itemWithTitle:@"怎么销售机会"];
    customChance.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/SalesOpportunities.html";
        addMemberUrl.title=@"怎么销售机会";
        addMemberUrl.userEntity=userEntity;
    };
    
    HMCommonArrowItem *useCloud=[HMCommonArrowItem itemWithTitle:@"怎么云盘"];
    useCloud.operation= ^{
        HMGeneralViewController *addMemberUrl=[[HMGeneralViewController alloc] init];
        [self.navigationController pushViewController:addMemberUrl animated:YES];
        HMurlStr *userEntity = [[HMurlStr alloc] init];
        userEntity.urlStr = @"http://kd77.cn/help/CloudDisk.html";
        addMemberUrl.title=@"怎么云盘";
        addMemberUrl.userEntity=userEntity;
    };
    
    group.items=@[addMember,useNotice,setKaoqin,addLiucheng,useTask,workHuibao,MemberManage,MemberVisit,customChance,useCloud];
    
}
@end

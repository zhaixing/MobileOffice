//
//  HMCloudDiskViewController.m
//  口袋助理
//
//  Created by sam on 16/4/21.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMCloudDiskViewController.h"
#import "HMGlobal.h"
#import "HMCommonGroup.h"
#import "HMCommonArrowItem.h"
#import "HMCloudDetailViewController.h"
@interface HMCloudDiskViewController ()

@end

@implementation HMCloudDiskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGroup0];
    [self setupGroup1];
}

-(void)setupGroup0
{
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    group.header=@"公司共享";
    group.footer=@"我的文件";
    HMCommonArrowItem *cloud=[HMCommonArrowItem itemWithTitle:@"共享文件夹" icon:@"CDCompanyDir"];
    cloud.destVcClass=[HMCloudDetailViewController class];
    
    group.items=@[cloud];
}

-(void)setupGroup1
{
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    HMCommonArrowItem *myComment=[HMCommonArrowItem itemWithTitle:@"我的文档" icon:@"CDDir"];
    myComment.destVcClass=[HMCloudDetailViewController class];

    HMCommonArrowItem *myPic=[HMCommonArrowItem itemWithTitle:@"我的图片" icon:@"CDDir"];
    myPic.destVcClass=[HMCloudDetailViewController class];
    
    HMCommonArrowItem *myMusic=[HMCommonArrowItem itemWithTitle:@"我的音乐" icon:@"CDDir"];
    myMusic.destVcClass=[HMCloudDetailViewController class];
    
    group.items=@[myComment,myPic,myMusic];
}
#pragma mark - 自学 提醒框
//-(void) someButtonClicked{
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                     message:@"您点击了动态按钮！"
//                                                    delegate:self
//                                           cancelButtonTitle:@"确定"
//                                           otherButtonTitles:@"第二项", @"第三项", nil] ;
//    [alert show];
//}
@end

//
//  HMNoticeViewController.m
//  口袋助理
//
//  Created by sam on 16/4/25.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMNoticeViewController.h"
#import "HMCommonArrowItem.h"
#import "HMCommonGroup.h"
@interface HMNoticeViewController ()

@end

@implementation HMNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroupSend];
    
    [self setupGroupReceive];
}

-(void)setupGroupSend
{
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    group.header=@"发送的通知";
    group.footer=@"收到的通知";
    HMCommonArrowItem *sendNotice=[HMCommonArrowItem itemWithTitle:@"发送的通知"];
    group.items=@[sendNotice];
}

-(void)setupGroupReceive
{
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    
    HMCommonArrowItem *receiveNotice=[HMCommonArrowItem itemWithTitle:@"收到的通知"];
    group.items=@[receiveNotice];
}
@end

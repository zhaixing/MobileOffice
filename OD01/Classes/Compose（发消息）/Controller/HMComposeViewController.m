//
//  HMComposeViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMComposeViewController.h"
#import "HMGlobal.h"
@interface HMComposeViewController ()

@end

@implementation HMComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"写消息";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled=NO;
}
/**
 *  取消事件实现
 */
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发送事件实现
 */
-(void)send
{
    HMLog(@"send---");
}
@end

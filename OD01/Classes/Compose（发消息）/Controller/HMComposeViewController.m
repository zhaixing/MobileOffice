//
//  HMComposeViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMComposeViewController.h"
#import "HMGlobal.h"
#import "HMTextView.h"

@interface HMComposeViewController ()
@property (nonatomic, weak) HMTextView *textView;
@end

@implementation HMComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏按钮
    [self setNavBar];
    
    //添加输入控件UITextView
    [self setupTextView];
    
}

/**
 *  添加输入控件UITextView 的实现
 */
-(void)setupTextView
{
    //1.创建控件
    HMTextView *textView=[[HMTextView alloc] init];
    textView.frame=self.view.bounds;
    [self.view addSubview:textView];
    self.textView=textView;
    
    //2.设置提醒文字（站位文字）
    textView.placehoder=@"分享到同事圈...";
    //3.设置字体
    textView.font=[UIFont systemFontOfSize:15];
}
/**
 *  添加导航栏按钮的实现
 */
-(void)setNavBar
{
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

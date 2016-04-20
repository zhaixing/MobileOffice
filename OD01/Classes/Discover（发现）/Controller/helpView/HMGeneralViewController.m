//
//  HMGeneralViewController.m
//  猫头鹰助理
//
//  Created by sam on 16/4/20.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMGeneralViewController.h"

@interface HMGeneralViewController ()

@end

@implementation HMGeneralViewController

//NSString *urlStr=@"http://www.itcast.cn";
- (void)viewDidLoad {
    [super viewDidLoad];
//     NSLog(@"2222%@",self.userEntity.urlStr);
    //1.创建webView
    UIWebView *webView=[[UIWebView alloc] init];
    webView.frame=self.view.bounds;
    [self.view addSubview:webView];
    
    //2.加载对应的帮助页面
    NSString *urlStr=self.userEntity.urlStr;
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    //3.设置代理
    webView.delegate=self;
    
}
@end

//
//  HMCustomerServeViewController.m
//  口袋助理
//
//  Created by sam on 16/4/20.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMCustomerServeViewController.h"
#import "HMGlobal.h"

@interface HMCustomerServeViewController ()

@end

@implementation HMCustomerServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"我的客服";
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createBtn2];//客服电话
    
    [self createBtn];//客服qq

}

//客服电话
-(void)createBtn2
{
    //1.创建button
    UIButton *phone =[[UIButton alloc]init];
    
    //2.尺寸
    CGFloat x = self.view.frame.size.width * 0.05;
    phone.frame=CGRectMake(x,80,self.view.frame.size.width * 0.9,110);
    
    //3.设置内容
    NSString *prefix = @"客服电话";
    NSString *name = @"18633848128";
    NSString *text = [NSString stringWithFormat:@"%@\n%@", prefix, name];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[text rangeOfString:prefix]];//prefix的样式
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text rangeOfString:name]];//name的样式
    phone.titleLabel.numberOfLines=0;//允许换行
    phone.titleLabel.attributedText=string;//把设计好的字符串 赋值给 控件
    phone.titleLabel.textAlignment = 0;
    
    //    NSString *text = [NSString stringWithFormat:@"  客服QQ\n  8110 0093"];
    //    [phone setTitle:string forState:UIControlStateNormal];
    [phone setAttributedTitle:string forState:UIControlStateNormal];//把设计好的字符串 赋值给 控件
    
    [phone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *name3 = [UIImage resizedImage:@"locate_bubble.png"];
    [phone setBackgroundImage:name3 forState:UIControlStateNormal];
    
    [phone setImage:[UIImage imageNamed:@"me_serviceA"] forState:UIControlStateNormal];
    
    //[button setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#向上偏移量>, <#CGFloat left#向左偏移量>, <#CGFloat bottom#向下偏移量>, <#CGFloat right#向右上偏移量>)];
    [phone setImageEdgeInsets:UIEdgeInsetsMake(15, -30, 15, 15)];
    
    //    [phone setTitle:@"喜欢"forState:UIControlStateHighlighted];
    //    [phone setTitleColor:[UIColor orangeColor]forState:UIControlStateHighlighted];
    //    UIImage *name4 = [UIImage imageNamed:@"locate_bubble.png"];
    //    [phone setImage:name4 forState:UIControlStateHighlighted];
    [phone addTarget:self action:@selector(btn1Clik)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phone];
}

//客服qq
-(void)createBtn
{
//    //快速创建自定义按钮，
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    //设置按钮的大小和位置
//    CGRect huge = CGRectMake(50,50,100,50);
//    [button1 setFrame:huge];
//    //设置按钮在普通状态下的文字
//    [button1 setTitle:@"别摸我"forState:UIControlStateNormal];
//    //设置文字在普通状态下的颜色
//    [button1 setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
//    //给按钮设置在普通状态下的图片
//    UIImage *name1 = [UIImage imageNamed:@"locate_bubble.png"];
//    [button1 setImage:name1 forState:UIControlStateNormal];
//    //设置文字在高亮状态下的文字
//    [button1 setTitle:@"就摸你" forState:UIControlStateHighlighted];
//    //高亮状态下的文字颜色
//    [button1 setTitleColor:[UIColor greenColor]forState:UIControlStateHighlighted];
//    //高亮状态下按钮的图片
//    UIImage *name2 = [UIImage imageNamed:@"locate_bubble.png"];
//    [button1 setImage:name2 forState:UIControlStateHighlighted];
//    //把按钮添加到view中显示出来
//    [self.view addSubview:button1];
//    //给按钮添加一个点击事件
//    [button1 addTarget:self action:@selector(btn1Clik)forControlEvents:UIControlEventTouchUpInside];
    
    
   
    
    
    
    
    //第二种创建按钮的方法，通过alloc创建
    //1.创建button
    UIButton *button2 =[[UIButton alloc]init];
    
    //2.尺寸
    CGFloat x = self.view.frame.size.width * 0.05;
    button2.frame=CGRectMake(x,200,self.view.frame.size.width * 0.9,110);
    
    //3.设置内容
    NSString *prefix = @"客服QQ";
    NSString *name = @"2769156718 ";
    NSString *text = [NSString stringWithFormat:@"%@\n%@", prefix, name];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[text rangeOfString:prefix]];//prefix的样式
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text rangeOfString:name]];//name的样式
    button2.titleLabel.numberOfLines=0;//允许换行
    button2.titleLabel.attributedText=string;//把设计好的字符串 赋值给 控件
    button2.titleLabel.textAlignment = 0;
    
//    NSString *text = [NSString stringWithFormat:@"  客服QQ\n  8110 0093"];
//    [button2 setTitle:string forState:UIControlStateNormal];
    [button2 setAttributedTitle:string forState:UIControlStateNormal];//把设计好的字符串 赋值给 控件
    
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *name3 = [UIImage resizedImage:@"locate_bubble.png"];
    [button2 setBackgroundImage:name3 forState:UIControlStateNormal];
    
    [button2 setImage:[UIImage imageNamed:@"me_serviceB"] forState:UIControlStateNormal];
    
    //[button setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#向上偏移量>, <#CGFloat left#向左偏移量>, <#CGFloat bottom#向下偏移量>, <#CGFloat right#向右上偏移量>)];
    [button2 setImageEdgeInsets:UIEdgeInsetsMake(15, -30, 15, 15)];
    
//    [button2 setTitle:@"喜欢"forState:UIControlStateHighlighted];
//    [button2 setTitleColor:[UIColor orangeColor]forState:UIControlStateHighlighted];
//    UIImage *name4 = [UIImage imageNamed:@"locate_bubble.png"];
//    [button2 setImage:name4 forState:UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(btn2Clik)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

//打电话
-(void)btn1Clik
{
//    //1、系统的打电话代码，不返回当前程序：
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1008611"]];
    
    //2、用UIWebView来实现，打电话结束后会返回当前应用程序：
    
    UIWebView *callPhoneWebVw = [[UIWebView alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://18633848128"]];
    [callPhoneWebVw loadRequest:request];
    [self.view addSubview:callPhoneWebVw];
}

-(void)btn2Clik
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURL *url = [NSURL URLWithString:@"mqq://im/chat?chat_type=wpa&uin=2817782031&version=1&src_type=web"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
    [self.view addSubview:webView];
}


-(void)learn
{
#pragma mark - 图文混排（learn）
//    // 构建文字
//    NSString *prefix = @"发动态";
//    NSString *text = [NSString stringWithFormat:@"%@\n%@", prefix, name];
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
//    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[text rangeOfString:prefix]];
//    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[text rangeOfString:name]];
//    
//    // 创建label
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.attributedText = string;
//    titleLabel.numberOfLines = 0;
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.width = 100;
//    titleLabel.height = 44;
//    self.navigationItem.titleView = titleLabel;

    
#pragma mark - 代码创建button （learn）
//    //快速创建自定义按钮，
//    UIButton*button1 = [UIButtonbuttonWithType:UIButtonTypeCustom];
//    //设置按钮的大小和位置
//    CGRecthuge =CGRectMake(50,50,100,50);
//    [button1setFrame:huge ];
//    //设置按钮在普通状态下的文字
//    [button1setTitle:@"别摸我"forState:UIControlStateNormal];
//    //设置文字在普通状态下的颜色
//    [button1setTitleColor:[UIColorredColor]forState:UIControlStateNormal];
//    //给按钮设置在普通状态下的图片
//    UIImage*name1 = [UIImageimageNamed:@"sub_black_add.png"];
//    [button1setImage:name1forState:UIControlStateNormal];
//    //设置文字在高亮状态下的文字
//    [button1setTitle:@"就摸你"forState:UIControlStateHighlighted];
//    //高亮状态下的文字颜色
//    [button1setTitleColor:[UIColorgreenColor]forState:UIControlStateHighlighted];
//    //高亮状态下按钮的图片
//    UIImage*name2 = [UIImageimageNamed:@"sub_blue_add.png"];
//    [button1setImage:name2forState:UIControlStateHighlighted];
//    //把按钮添加到view中显示出来
//    [self.viewaddSubview:button1];
//    //给按钮添加一个点击事件
//    [button1addTarget:selfaction:@selector(btnClik:)forControlEvents:UIControlEventTouchUpInside];
//    
//    //第二种创建按钮的方法，通过alloc创建
//    UIButton*button2 =[[UIButtonalloc]init];
//    button2.frame=CGRectMake(100,100,200,50);
//    [button2setTitle:@"你喜欢我吗"forState:UIControlStateNormal];
//    [button2setTitleColor:[UIColorpurpleColor]forState:UIControlStateNormal];
//    UIImage*name3 = [UIImageimageNamed:@"sub_black_down.png"];
//    [button2setImage:name3forState:UIControlStateNormal];
//    [button2setTitle:@"喜欢"forState:UIControlStateHighlighted];
//    [button2setTitleColor:[UIColororangeColor]forState:UIControlStateHighlighted];
//    UIImage*name4 = [UIImageimageNamed:@"sub_blue_down.png"];
//    [button2setImage:name4forState:UIControlStateHighlighted];
//    [button2addTarget:selfaction:@selector(btnClik:)forControlEvents:UIControlEventTouchUpInside];
//    [self.viewaddSubview:button2];
}
@end

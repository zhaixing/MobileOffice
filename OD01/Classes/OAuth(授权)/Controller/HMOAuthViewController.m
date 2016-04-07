//
//  HMOAuthViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMOAuthViewController.h"
#import "HMTabBarViewController.h"
#import "HMNewfeatureViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
@interface HMOAuthViewController () <UIWebViewDelegate>

@end

@implementation HMOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建UIWebView
    UIWebView *webView=[[UIWebView alloc] init];
    webView.frame=self.view.bounds;
    [self.view addSubview:webView];
    
    //2.加载登录界面
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=558495401&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    //3.设置代理
    webView.delegate=self;
    
}

/**
 *  UIWebView开始加载资源的时候调用（开始发送请求）
 */
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"加载中..."];
}

/**
 *  UIWebView加载完毕的时候调用（请求完毕）
 */
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

/**
 *  UIWebView加载失败的时候调用（请求失败）
 */
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

/**
 *  UIWebView每当发送一个请求之前，都会先调用这个代理方法（询问代理允不允许加载这个请求）
 *
 *  @param request        即将发送的请求
 
 *  @return YES : 允许加载， NO : 禁止加载
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 1.获得请求地址
    NSString *url = request.URL.absoluteString;
    
    // 2.判断url是否为回调地址
    /**
     url = http://www.itheima.com/?code=a3db74011c311e629bafce3e50c25339
     range.location == 0
     range.length > 0
     */
    /**
     url =  https://api.weibo.com/oauth2/authorize
     range.location == NSNotFound
     range.length == 0
     */
    NSRange range = [url rangeOfString:@"http://www.baidu.com/?code="];
    if (range.location != NSNotFound) { // 是回调地址
        //    if (range.length != 0)
        
        // 截取授权成功后的请求标记
        int from = range.location + range.length;
        NSString *code = [url substringFromIndex:from];
        
        // 根据code获得一个accessToken
        [self accessTokenWithCode:code];
        
        // 禁止加载回调页面
        return NO;
    }
    
    return YES;
}

/**
 *  根据code获得一个accessToken
 *
 *  @param code 授权成功后的请求标记
 */
- (void)accessTokenWithCode:(NSString *)code
{
    // 1.获得请求管理者
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"558495401";
    params[@"client_secret"] = @"862e3e02417afdf4bdbbb07751551b08";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    
    // 3.发送POST请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        // 隐藏HUD
        [MBProgressHUD hideHUD];
        
        NSLog(@"请求成功--%@", responseObject);
        
        // 存储授权成功的帐号信息
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filepath = [doc stringByAppendingPathComponent:@"account.plist"];
        [responseObject writeToFile:filepath atomically:YES];
        
        
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[HMTabBarViewController alloc] init];
//        // 切换控制器(可能去新特性\tabbar)
//        // 如何知道第一次使用这个版本？比较上次的使用情况
//        NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
//        
//        // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        NSString *lastVersion = [defaults objectForKey:versionKey];
//        
//        // 获得当前打开软件的版本号
//        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
//        
//        UIWindow *window = [UIApplication sharedApplication].keyWindow;
//        if ([currentVersion isEqualToString:lastVersion]) { // 当前版本号 == 上次使用的版本：显示HMTabBarViewController
//            window.rootViewController = [[HMTabBarViewController alloc] init];
//        } else { // 当前版本号 != 上次使用的版本：显示版本新特性
//            window.rootViewController = [[HMNewfeatureViewController alloc] init];
//            
//            // 存储这次使用的软件版本
//            [defaults setObject:currentVersion forKey:versionKey];
//            [defaults synchronize];
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 隐藏HUD
        [MBProgressHUD hideHUD];
        
        NSLog(@"请求失败--%@", error);
    }];
}

/**
 Request failed: unacceptable content-type: text/plain
 */


@end

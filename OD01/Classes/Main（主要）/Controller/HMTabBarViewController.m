//
//  HMTabBarViewController.m
//  OD01
//
//  Created by sam on 16/4/5.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMTabBarViewController.h"
#import "HMHomeViewController.h"
#import "HMMessageViewController.h"
#import "HMDiscoverViewController.h"
#import "HMProfileTableViewController.h"

@interface HMTabBarViewController ()

@end

@implementation HMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加子控制器
    HMHomeViewController *home=[[HMHomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"icon_home_nor" selectedImageName:@"icon_home_pre"];
    
    HMMessageViewController *message=[[HMMessageViewController alloc] init];
    [self addOneChildVc:message title:@"消息" imageName:@"icon_message_nor" selectedImageName:@"icon_message_pre"];
    
    HMDiscoverViewController *discover =[[HMDiscoverViewController alloc] init];
    [self addOneChildVc:discover title:@"发现" imageName:@"icon_find_nor" selectedImageName:@"icon_find_pre"];
    
    HMProfileTableViewController *me=[[HMProfileTableViewController alloc] init];
    [self addOneChildVc:me title:@"我" imageName:@"icon_setting_nor" selectedImageName:@"icon_setting_pre"];
}
/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中图标
 */
-(void)addOneChildVc:
(UIViewController *)childVc
               title:(NSString *)title
           imageName:(NSString *)imageName
   selectedImageName:(NSString *)selectedImageName
{
    //设置随机色
    childVc.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    //设置标题
    childVc.tabBarItem.title=title;
    //设置图片
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    //设置选中图片
    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
    selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage=selectedImage;
    
    
    [self addChildViewController:childVc];

}
@end

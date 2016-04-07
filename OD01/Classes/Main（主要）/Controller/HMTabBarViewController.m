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
#import "HMNavigationController.h"
#import "HMTabBar.h"
#import "UIImage+Extension.h"
#import "HMGloBal.h"
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
    
    // 调整tabbar
    HMTabBar *customTabBar = [[HMTabBar alloc] init];
//    customTabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
//    customTabBar.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_button_background"];
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
    
    // 设置代理（监听控制器的切换， 控制器一旦切换了子控制器，就会调用代理的tabBarController:didSelectViewController:）
    self.delegate = self;
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
//    childVc.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    //设置标题
    childVc.title=title;
//    self.tabBar.tintColor=themeColor;
//    childVc.tabBarItem.title=title;
//    childVc.navigationItem.title=title;
    //设置图片
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    //设置选中图片
    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
    selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage=selectedImage;
    
    HMNavigationController *nav=[[HMNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];

}
@end

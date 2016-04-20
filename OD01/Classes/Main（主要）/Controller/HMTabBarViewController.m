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
#import "HMProfileViewController.h"
#import "HMNavigationController.h"
#import "HMTabBar.h"
#import "UIImage+Extension.h"
#import "HMGloBal.h"
#import "HMComposeViewController.h"
#import "HMUserTool.h"
#import "HMAccount.h"
#import "HMAccountTool.h"

@interface HMTabBarViewController () <HMTabBarDelegate>
@property (nonatomic, weak) HMHomeViewController *home;//为了让人拿到这个控件
@property (nonatomic, weak) UIViewController *lastSelectedViewContoller;
@end

@implementation HMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    //添加所有子控制器
    [self addAllChildVcs];
    
    //自定义tabbar
    [self addCustomTabBar];
    
    
    // 利用定时器获得用户的未读数
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getUnreadCount) userInfo:nil repeats:YES];//时间10s比较合理
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];//处理细节，
  
}
//监听home按钮点击事件
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
{
    UIViewController *vc = [viewController.viewControllers firstObject];
    if ([vc isKindOfClass:[HMHomeViewController class]]) {
        if (self.lastSelectedViewContoller == vc) {
            [self.home refresh:YES];
        } else {
            [self.home refresh:NO];
        }
    }
    
    self.lastSelectedViewContoller = vc;

    //与上面冲突
    //    UIViewController *vc =[viewController.viewControllers firstObject];
//    if ([vc isKindOfClass:[HMHomeViewController class]]) {
//        HMLog(@"点击了首页");
//    }
}


- (void)getUnreadCount
{
    // 1.请求参数
    HMUnreadCountParam *param = [HMUnreadCountParam param];
    param.uid = [HMAccountTool account].uid;
    
    // 2.获得未读数
    [HMUserTool unreadCountWithParam:param success:^(HMUnreadCountResult *result) {
//        // 显示微博未读数
//        if (result.status == 0) {
//            self.home.tabBarItem.badgeValue = nil;
//        } else {
//            self.home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
//        }
//        
//        // 显示消息未读数
//        if (result.messageCount == 0) {
//            self.message.tabBarItem.badgeValue = nil;
//        } else {
//            self.message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.messageCount];
//        }
//        
//        // 显示新粉丝数
//        if (result.follower == 0) {
//            self.profile.tabBarItem.badgeValue = nil;
//        } else {
//            self.profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
//        }
//        
//        // 在图标上显示所有的未读数
//        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
//        HMLog(@"总未读数--%d", result.totalCount);
//        HMLog(@"%d--%d",result.status,result.dm);//测试看成功否，与上面都冲突
        
        if (result.status==0) {
            self.home.tabBarItem.badgeValue=nil;
        }else{
            self.home.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.status];
        }
        
        //iOS8和更高的版本需要给图标显示数字功能添加 授权
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
            UIUserNotificationType myType = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
            UIUserNotificationSettings *mySetting = [UIUserNotificationSettings settingsForTypes:myType categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:mySetting];
        }else{
            UIRemoteNotificationType myType = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myType];
        }
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.status;//后台运行，有新消息，就在图标的右上角显示个数
        HMLog(@"新数据--%d",result.status);//测试看成功否，与上面都冲突
    } failure:^(NSError *error) {
        HMLog(@"获得未读数失败---%@", error);
    }];
}


/**
 *  创建自定义tabbar
 */
-(void)addCustomTabBar
{
    /**
     * 自定义tabbar，中间的加号
     */
    // 调整tabbar
    HMTabBar *customTabBar = [[HMTabBar alloc] init];
    //    customTabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
    //    customTabBar.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_button_background"];
    // 更换系统自带的tabbar
    
    /**
     * 中间加号的点击事件
     */
    
    customTabBar.tabBarDelegate=self;
    
    
    [self setValue:customTabBar forKeyPath:@"tabBar"];
    
    // 设置代理（监听控制器的切换， 控制器一旦切换了子控制器，就会调用代理的tabBarController:didSelectViewController:）
    //    self.delegate = self;
}

/**
 *  添加所有自控制器
 */
-(void)addAllChildVcs
{
    /**
     * 添加自控制器
     */
    //添加子控制器
    HMHomeViewController *home=[[HMHomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"icon_home_nor" selectedImageName:@"icon_home_pre"];
    self.home=home;//为了让人拿到这个控件
    
    HMMessageViewController *message=[[HMMessageViewController alloc] init];
    [self addOneChildVc:message title:@"消息" imageName:@"icon_message_nor" selectedImageName:@"icon_message_pre"];
    
    HMDiscoverViewController *discover =[[HMDiscoverViewController alloc] init];
    [self addOneChildVc:discover title:@"应用" imageName:@"icon_find_nor" selectedImageName:@"icon_find_pre"];
    
    HMProfileViewController *me=[[HMProfileViewController alloc] init];
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
//    childVc.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    //设置标题
    childVc.title=title;
//    self.tabBar.tintColor=themeColor;
    
    //设置选中的时候字体是主题色
    NSMutableDictionary *selectedAttrs=[NSMutableDictionary dictionary];
    selectedAttrs[UITextAttributeTextColor]=themeColor;
    [childVc.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
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
/**
 *  代理方式，中间加号点击事件的实现
 *
 *  @return <#return value description#>
 */
#pragma mark -HMTabBarDelegate
-(void)tabBarDidClickedPlusButton:(HMTabBar *)tabBar
{
    //弹出发消息控制器
    HMComposeViewController *compose=[[HMComposeViewController alloc] init];
    HMNavigationController *nav=[[HMNavigationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}
@end

//
//  HMNavigationController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "HMGlobal.h"
@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 *  当第一次使用这个类的时候调用一次
 */
+(void)initialize
{
    //通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance=[UIBarButtonItem appearance];
    //设置普通状态的文字属性
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=themeColor;
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态（disable）的文字属性
    NSMutableDictionary *disableTextAttrs=[NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateNormal];
}
/**
 *  能拦截所有push进来的子控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0){
        viewController.hidesBottomBarWhenPushed=YES;

        //设置导航栏控制按钮
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end

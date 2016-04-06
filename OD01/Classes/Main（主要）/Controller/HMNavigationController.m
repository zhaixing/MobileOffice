//
//  HMNavigationController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMNavigationController.h"

@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 *  能拦截所有push进来的子控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0){
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end

//
//  HMTabBar.h
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMTabBar;
@protocol HMTabBarDelegate <NSObject>
@optional
-(void)tabBarDidClickedPlusButton:(HMTabBar *)tabBar;
@end

@interface HMTabBar : UITabBar
@property (nonatomic,weak) id<HMTabBarDelegate> delegate;
@end

//
//  HMTabBar.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMTabBar.h"
#import "HMGlobal.h"
@interface HMTabBar()
@property (nonatomic,weak) UIButton *plusButton;
@end
@implementation HMTabBar
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UIButton *plusButton=[[UIButton alloc] init];
        //设置背景
        [plusButton setImage:[UIImage imageNamed:@"icon_edit_modify"] forState:UIControlStateNormal];
        [plusButton setTitleShadowColor:[UIColor lightGrayColor] forState:UIControlEventTouchUpInside];
//        plusButton.sizeToFit;
        [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
        self.plusButton=plusButton;
    }
    return self;
}
-(void)plusClick
{
    NSLog(@"plusClick---");
    //通知代理
    if([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]){
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置plusButton的frame
    [self setupPlusButtonFrame];
    
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
    
    
    
    }

/**
 *  设置所有plusButton的frame
 */
- (void)setupPlusButtonFrame
{
//    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
//    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    self.plusButton.sizeToFit;
    self.plusButton.center=CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height *0.5);

}


/**
 *  设置所有tabbarButton的frame
 */
- (void)setupAllTabBarButtonsFrame
{
//    int index = 0;
//    
//    // 遍历所有的button
//    for (UIView *tabBarButton in self.subviews) {
//        // 如果不是UITabBarButton， 直接跳过
//        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
//        
//        // 根据索引调整位置
//        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
//        
//        // 遍历UITabBarButton中的所有子控件
//        [self setupTabBarButtonTextColor:tabBarButton atIndex:index];
//        
//        // 索引增加
//        index++;
//    }

    int index=0;
    CGFloat buttonW=self.bounds.size.width/5;
    CGFloat buttonH=self.bounds.size.height;
    CGRect rect=CGRectMake(0, 0, buttonW, buttonH);
    //遍历所有button
    for (UIView *tabbarButton in self.subviews) {
        //如果不是UITabbarButton，直接跳过
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            tabbarButton.frame=CGRectOffset(rect, index * buttonW, 0);
//            NSLog(@"%d",index);
            index += index == 1 ? 2 :1;
            
//            BOOL selected=NO;
//            for(UIView *buttonChild in tabbarButton.subviews){
//                if([buttonChild isKindOfClass:NSClassFromString(@"UITabBarSelectionIndicatorView")]){
//                    selected=YES;
//                }
//                if([buttonChild isKindOfClass:[UILabel class]]){
//                    UILabel *label=(UILabel *)buttonChild;
//                    if(selected){
//                        label.textColor=themeColor;
//                    }else{
//                        label.textColor=[UIColor blackColor];
//                    }
//                }
//            }
        }
        
    }
    //没有效果的代码
//    for(UILabel *label in self.subviews){
//        if (![label isKindOfClass:[UILabel class]])continue;
//        int selectedIndex=[self.items indexOfObject:self.selectedItem];
//        if ( selectedIndex == index) {
//            label.textColor=themeColor;
//        }else{
//            label.textColor=[UIColor blackColor];
//        }
//    }
}
@end

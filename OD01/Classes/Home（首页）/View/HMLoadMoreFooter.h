//
//  HMLoadMoreFooter.h
//  猫头鹰助理
//
//  Created by sam on 16/4/9.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMLoadMoreFooter : UIView
+(instancetype)footer;
-(void)beginRefreshing;
-(void)endRefreshing;
@property (nonatomic,assign,getter=isRefreshing) BOOL refreshing;
@end

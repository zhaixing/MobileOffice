//
//  HMStatusDetailView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusDetailView.h"
#import "HMStatusReweetedView.h"
#import "HMStatusOriginalView.h"

@interface HMStatusDetailView()
@property (nonatomic,weak) HMStatusOriginalView *originaleView;
@property (nonatomic,weak) HMStatusReweetedView *retweetedView;

@end
@implementation HMStatusDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {//初始化子控件
        //1.添加原创数据
        [self setupOriginalView];
        
        //2.添加转发数据
        [self setupRetweetedView];
    }
    return self;
}

/**
 *  添加原创信息
 */
-(void)setupOriginalView
{
    HMStatusOriginalView *originalView=[[HMStatusOriginalView alloc] init];
    [self addSubview:originalView];
    self.originaleView=originalView;
}

/**
 *  添加转发数据
 */
-(void)setupRetweetedView
{
    HMStatusReweetedView *retweetedView=[[HMStatusReweetedView alloc] init];
    [self addSubview:retweetedView];
    self.retweetedView=retweetedView;
    
}

@end

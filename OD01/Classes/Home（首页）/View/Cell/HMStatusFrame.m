//
//  HMStatusFrame.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMGlobal.h"
#import "HMStatusFrame.h"
#import "HMStatus.h"
#import "HMStatusDetailFrame.h"

@implementation HMStatusFrame

- (void)setStatus:(HMStatus *)status
{
    _status = status;
    
    // 1.计算微博具体内容（微博整体）
    [self setupDetailFrame];
    
    // 2.计算底部工具条
    [self setupToolbarFrame];
    
    // 3.计算cell的高度
    self.cellHeight = CGRectGetMaxY(self.toolbarFrame);
}

/**
 *  计算微博具体内容（微博整体）
 */
- (void)setupDetailFrame
{
    HMStatusDetailFrame *detailFrame = [[HMStatusDetailFrame alloc] init];
    detailFrame.status = self.status;
    self.detailFrame = detailFrame;
}

/**
 *  计算底部工具条
 */
- (void)setupToolbarFrame
{
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.detailFrame.frame);
    CGFloat toolbarW = HMScreenW;
    CGFloat toolbarH = 35;
    self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
}

@end

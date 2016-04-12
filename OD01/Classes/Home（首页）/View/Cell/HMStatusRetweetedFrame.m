//
//  HMStatusRetweetedFrame.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMStatusRetweetedFrame.h"
#import "HMStatus.h"
#import "HMUser.h"

@implementation HMStatusRetweetedFrame

- (void)setRetweetedStatus:(HMStatus *)retweetedStatus
{
    _retweetedStatus = retweetedStatus;
    
    // 1.昵称
    CGFloat nameX = HMStatusCellInset;
    CGFloat nameY = HMStatusCellInset;
    CGSize nameSize = [retweetedStatus.user.name sizeWithFont:HMStatusRetweetedNameFont];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 2.正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + HMStatusCellInset;
    CGFloat maxW = HMScreenW - 2 * textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [retweetedStatus.text sizeWithFont:HMStatusRetweetedTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 0; // 高度 = 原创微博最大的Y值
    CGFloat w = HMScreenW;
    CGFloat h = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
    self.frame = CGRectMake(x, y, w, h);
}

@end

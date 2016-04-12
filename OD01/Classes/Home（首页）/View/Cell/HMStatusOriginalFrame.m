//
//  HMStatusOriginalFrame.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMGlobal.h"
#import "HMStatusOriginalFrame.h"
#import "HMStatus.h"
#import "HMUser.h"

@implementation HMStatusOriginalFrame

- (void)setStatus:(HMStatus *)status
{
    _status = status;
    
    // 1.头像
    CGFloat iconX = HMStatusCellInset;
    CGFloat iconY = HMStatusCellInset;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + HMStatusCellInset;
    CGFloat nameY = iconY;
    CGSize nameSize = [status.user.name sizeWithFont:HMStatusOrginalNameFont];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 3.时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + HMStatusCellInset;
    CGSize timeSize = [status.created_at sizeWithFont:HMStatusOrginalTimeFont];
    self.timeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    // 4.来源
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame) + HMStatusCellInset;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:HMStatusOrginalSourceFont];
    self.sourceFrame = (CGRect){{sourceX, sourceY}, sourceSize};
    
    // 5.正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconFrame) + HMStatusCellInset;
    CGFloat maxW = HMScreenW - 2 * textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [status.text sizeWithFont:HMStatusOrginalTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = HMScreenW;
    CGFloat h = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
    self.frame = CGRectMake(x, y, w, h);
}

@end

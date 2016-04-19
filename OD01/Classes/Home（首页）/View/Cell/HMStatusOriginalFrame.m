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
#import "HMStatusPhotosView.h"

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
    
    if (status.user.isVip) { // 计算会员图标的位置
        CGFloat vipX = CGRectGetMaxX(self.nameFrame) + HMStatusCellInset;
        CGFloat vipY = nameY;
        CGFloat vipH = nameSize.height;
        CGFloat vipW = vipH;
        self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    // 3.正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconFrame) + HMStatusCellInset * 0.5;
    CGFloat maxW = HMScreenW - 2 * textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [status.attributedText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    // 4.配图相册
    CGFloat h = 0;
    if (status.pic_urls.count) {
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(self.textFrame) + HMStatusCellInset * 0.5;
        CGSize photosSize = [HMStatusPhotosView sizeWithPhotosCount:status.pic_urls.count];
        self.photosFrame = (CGRect){{photosX, photosY}, photosSize};
        
        h = CGRectGetMaxY(self.photosFrame) + HMStatusCellInset;
    } else {
        h = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
    }
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = HMScreenW;
    self.frame = CGRectMake(x, y, w, h);
}

@end

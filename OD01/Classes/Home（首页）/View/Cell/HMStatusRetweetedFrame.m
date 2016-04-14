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
#import "HMStatusPhotosView.h"
#import "UIDevice+Resolutions.h"

@implementation HMStatusRetweetedFrame

- (void)setRetweetedStatus:(HMStatus *)retweetedStatus
{
    _retweetedStatus = retweetedStatus;
    
    // 1.昵称
    CGFloat nameX = HMStatusCellInset;
    CGFloat nameY = HMStatusCellInset;
    NSString *name=[NSString stringWithFormat:@"@%@",retweetedStatus.user.name];
    CGSize nameSize = [name sizeWithFont:HMStatusRetweetedNameFont];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 2.正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + HMStatusCellInset*0.5;
    CGFloat maxW = HMScreenW - 2 * textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [retweetedStatus.text sizeWithFont:HMStatusRetweetedTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    // 3.配图相册
    CGFloat h = 0;
    if (retweetedStatus.pic_urls.count) {
        
        /*
        //屏幕尺寸
        CGRect rect = [[UIScreen mainScreen] bounds];
        CGSize size = rect.size;
        CGFloat width = size.width;
        CGFloat height = size.height;
        NSLog(@"print %f,%f",width,height);
        
        //分辨率
        CGFloat scale_screen = [UIScreen mainScreen].scale;
        HMLog(@"%f,%f",width*scale_screen,height*scale_screen);
        */
        
        
//        HMLog(@"%lu",(unsigned long)[UIDevice currentResolution]);
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
        CGSize photosSize = [HMStatusPhotosView sizeWithPhotosCount:retweetedStatus.pic_urls.count];
        self.photosFrame = (CGRect){{photosX, photosY}, photosSize};
        
        h = CGRectGetMaxY(self.photosFrame) + HMStatusCellInset;
    } else {
        h = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
    }
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 0; // 高度 = 原创微博最大的Y值
    CGFloat w = HMScreenW;
//    CGFloat h = CGRectGetMaxY(self.textFrame) + HMStatusCellInset;
    self.frame = CGRectMake(x, y, w, h);
}

@end

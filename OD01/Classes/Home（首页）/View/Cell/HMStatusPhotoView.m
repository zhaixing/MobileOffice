//
//  HMStatusPhotoView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/13.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusPhotoView.h"
#import "HMPhoto.h"
#import "HMGlobal.h"
#import "UIImageView+WebCache.h"

@implementation HMStatusPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPhoto:(HMPhoto *)photo
{
    _photo = photo;
    
    // 1.下载图片
//    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
    
    //http://ww3.sinaimg.cn/thumbnail/7f9147a5gw1f2wc3xrrxdj20j60qugq2.jpg
//    NSURL *url=[NSURL URLWithString:photo.thumbnail_pic];
//        [self setImageWithURL:url placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
//    HMLog(@"%@" ,photo[@"thumbnail_pic"]);
    
#pragma mark - 能演示的
        NSURL *url=[NSURL URLWithString:@"http://ww3.sinaimg.cn/thumbnail/7f9147a5gw1f2wc3xrrxdj20j60qugq2.jpg"];
            [self setImageWithURL:url placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];

}

@end
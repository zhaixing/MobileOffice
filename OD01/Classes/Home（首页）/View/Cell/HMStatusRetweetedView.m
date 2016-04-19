//
//  HMStatusRetweetedView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMStatusRetweetedView.h"
#import "HMStatusRetweetedFrame.h"
#import "HMStatus.h"
#import "HMUser.h"
#import "HMStatusPhotosView.h"
#import "HMStatusLabel.h"

@interface HMStatusRetweetedView()
/**  昵称 */
//@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) HMStatusLabel *textLabel;
/** 配图相册 */
@property (nonatomic, weak) HMStatusPhotosView *photosView;
@end

@implementation HMStatusRetweetedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImage:@"timeline_retweet_background"];
        
        // 1.昵称
        //        UILabel *nameLabel = [[UILabel alloc] init];
        //        nameLabel.textColor = HMStatusHighTextColor;
        //        nameLabel.font = HMStatusRetweetedNameFont;
        //        [self addSubview:nameLabel];
        //        self.nameLabel = nameLabel;
        
        // 2.正文（内容）
        HMStatusLabel *textLabel = [[HMStatusLabel alloc] init];
//        textLabel.font = HMStatusRetweetedTextFont;
//        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // 3.配图相册
        HMStatusPhotosView *photosView = [[HMStatusPhotosView alloc] init];
        [self addSubview:photosView];
        self.photosView = photosView;
    }
    return self;
}

- (void)setRetweetedFrame:(HMStatusRetweetedFrame *)retweetedFrame
{
    _retweetedFrame = retweetedFrame;
    
    self.frame = retweetedFrame.frame;
    
    // 取出微博数据
    HMStatus *retweetedStatus = retweetedFrame.retweetedStatus;
    // 取出用户数据
    //    HMUser *user = retweetedStatus.user;
    
    // 1.昵称
    //    self.nameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    //    self.nameLabel.frame = retweetedFrame.nameFrame;
    
    // 2.正文（内容）
    self.textLabel.attributedText = retweetedStatus.attributedText;
    self.textLabel.frame = retweetedFrame.textFrame;
    
    // 3.配图相册
    if (retweetedStatus.pic_urls.count) { // 有配图
        self.photosView.frame = retweetedFrame.photosFrame;
        self.photosView.pic_urls = retweetedStatus.pic_urls;
        self.photosView.hidden = NO;
    } else {
        self.photosView.hidden = YES;
    }
}

@end
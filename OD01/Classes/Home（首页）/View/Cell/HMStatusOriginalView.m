//
//  HMStatusOriginalView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMStatusOriginalView.h"
#import "HMStatusOriginalFrame.h"
#import "HMStatus.h"
#import "HMUser.h"
#import "UIImageView+WebCache.h"

@interface HMStatusOriginalView()
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *textLabel;
/** 来源 */
@property (nonatomic, weak) UILabel *sourceLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;

/** 头像 */
@property (nonatomic, weak) UIImageView *iconView;
@end

@implementation HMStatusOriginalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = HMStatusOrginalNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 2.正文（内容）
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = HMStatusOrginalTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // 3.时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = HMStatusOrginalTimeFont;
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 4.来源
        UILabel *sourceLabel = [[UILabel alloc] init];
        sourceLabel.font = HMStatusOrginalSourceFont;
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        // 5.头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}

- (void)setOriginalFrame:(HMStatusOriginalFrame *)originalFrame
{
    _originalFrame = originalFrame;
    
    self.frame = originalFrame.frame;
    
    // 取出微博数据
    HMStatus *status = originalFrame.status;
    // 取出用户数据
    HMUser *user = status.user;
    
    // 1.昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = originalFrame.nameFrame;
    
    // 2.正文（内容）
    self.textLabel.text = status.text;
    self.textLabel.frame = originalFrame.textFrame;
    
    // 3.时间
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = originalFrame.timeFrame;
    
    // 4.来源
    self.sourceLabel.text = status.source;
    self.sourceLabel.frame = originalFrame.sourceFrame;
    
    // 5.头像
    self.iconView.frame = originalFrame.iconFrame;
    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
}

@end

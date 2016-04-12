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

@interface HMStatusRetweetedView()
/**  昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation HMStatusRetweetedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.image = [UIImage resizedImage:@"timeline_card_background_highlighted"];
        // 1.昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = HMStatusRetweetedNameFont;
        nameLabel.textColor= HMColor(74, 102, 105,1.0);
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 2.正文（内容）
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = HMStatusRetweetedTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
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
    HMUser *user = retweetedStatus.user;
    
    // 1.昵称
    self.nameLabel.text = [NSString stringWithFormat:@"@%@",user.name];
    self.nameLabel.frame = retweetedFrame.nameFrame;
    
    // 2.正文（内容）
    self.textLabel.text = retweetedStatus.text;
    self.textLabel.frame = retweetedFrame.textFrame;
}

@end

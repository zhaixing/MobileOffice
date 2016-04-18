//
//  HMEmotionAttachment.h
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMEmotion;
@interface HMEmotionAttachment : NSTextAttachment
@property (nonatomic,strong) HMEmotion *emotion;
@end

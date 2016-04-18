//
//  HMEmotionTextView.h
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMTextView.h"
@class HMEmotion;

@interface HMEmotionTextView : HMTextView
/**
 *  拼接表情到最后面
 */
- (void)appendEmotion:(HMEmotion *)emotion;
/**
 *  具体的文字内容
 */
- (NSString *)realText;
@end

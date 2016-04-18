//
//  HMEmotionAttachment.m
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionAttachment.h"
#import "HMEmotion.h"

@implementation HMEmotionAttachment
-(void)setEmotion:(HMEmotion *)emotion
{
    _emotion=emotion;
    self.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@%@",emotion.directory,emotion.png]];
}
@end

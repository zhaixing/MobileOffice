//
//  HMEmotion.m
//  猫头鹰助理
//
//  Created by sam on 16/4/15.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotion.h"
#import "NSString+Emoji.h"

@implementation HMEmotion
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@ - %@", self.chs, self.png, self.code];
}

- (void)setCode:(NSString *)code
{
    _code = [code copy];
    
    self.emoji = [NSString emojiWithStringCode:code];
}
@end

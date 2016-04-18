//
//  HMEmotionTextView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionTextView.h"
#import "HMEmotion.h"

@implementation HMEmotionTextView

- (void)appendEmotion:(HMEmotion *)emotion
{
    if (emotion.emoji) {
        [self insertText:emotion.emoji];
    } else {
        [self insertText:emotion.chs];
    }
    
    // [表情]
    // 正则表达式
    // 有一定规定的字符串表达式
    // 作用：匹配
    //    HMLog(@"%@", self.text);
    
    // 1.先拥有textView之前的富文本
    //    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //
    //    // 2.拼接表情
    //    if (emotion.emoji) { // 拼接emoji字符
    //        NSAttributedString *substr = [[NSAttributedString alloc] initWithString:emotion.emoji];
    //        [attributedText appendAttributedString:substr];
    //    } else { // 拼接图片表情
    //        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    //        attach.image = [UIImage imageWithName:[NSString stringWithFormat:@"%@/%@", emotion.directory, emotion.png]];
    //        // 设置图片尺寸和字体大小一致
    //        CGFloat imageW = self.font.lineHeight;
    //        CGFloat imageH = imageW;
    //        attach.bounds = CGRectMake(0, -3, imageW, imageH);
    //        NSAttributedString *substr = [NSAttributedString attributedStringWithAttachment:attach];
    //        [attributedText appendAttributedString:substr];
    //    }
    //    [attributedText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attributedText.length)];
    //
    //    // text文字的大小由font属性决定
    //    // attributedText文字的大小由- (void)addAttribute:(NSString *)name value:(id)value range:(NSRange)range;方法决定
    //    
    //    // 3.重新表情
    //    self.attributedText = attributedText;
}

@end

//
//  HMEmotionGridView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/15.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionGridView.h"
#import "HMEmotion.h"
#import "HMGlobal.h"
#import "HMEmotionView.h"



@interface HMEmotionGridView()
@property (nonatomic, weak) UIButton *deleteButton;
@property (nonatomic, strong) NSMutableArray *emotionViews;
@end

@implementation HMEmotionGridView

- (NSMutableArray *)emotionViews
{
    if (!_emotionViews) {
        self.emotionViews = [NSMutableArray array];
    }
    return _emotionViews;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加删除按钮
        UIButton *deleteButton = [[UIButton alloc] init];
        [deleteButton setImage:[UIImage imageWithName:@"compose_emotion_delete"] forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageWithName:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
    }
    return self;
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    // 添加新的表情
    int count = emotions.count;
    int currentEmotionViewCount = self.emotionViews.count;
    for (int i = 0; i<count; i++) {
        HMEmotionView *emotionView = nil;
        
        if (i >= currentEmotionViewCount) { // emotionView不够用
            emotionView = [[HMEmotionView alloc] init];
            emotionView.backgroundColor = HMRandomColor;
            [self addSubview:emotionView];
            [self.emotionViews addObject:emotionView];
        } else { // emotionView够用
            emotionView = self.emotionViews[i];
        }
        // 传递模型数据
        emotionView.emotion = emotions[i];
        emotionView.hidden = NO;
    }
    
    // 隐藏多余的emotionView
    for (int i = count; i<currentEmotionViewCount; i++) {
        UIButton *emotionView = self.emotionViews[i];
        emotionView.hidden = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat leftInset = 15;
    CGFloat topInset = 15;
    //1.排列所有的表情
    int count = self.emotionViews.count;
    CGFloat emotionViewW = (self.width - 2 * leftInset) / HMEmotionMaxCols;
    CGFloat emotionViewH = (self.height - topInset) / HMEmotionMaxRows;
    for (int i = 0; i<count; i++) {
        UIButton *emotionView = self.emotionViews[i];
        emotionView.x = leftInset + (i % HMEmotionMaxCols) * emotionViewW;
        emotionView.y = topInset + (i / HMEmotionMaxCols) * emotionViewH;
        emotionView.width = emotionViewW;
        emotionView.height = emotionViewH;
    }
    //2.删除按钮
    self.deleteButton.width=emotionViewW;
    self.deleteButton.height=emotionViewH;
    self.deleteButton.x=self.width-leftInset -self.deleteButton.width;
    self.deleteButton.y=self.height-self.deleteButton.height;
}

@end

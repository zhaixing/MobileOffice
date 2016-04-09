//
//  HMComposeToolBar.h
//  猫头鹰助理
//
//  Created by sam on 16/4/9.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HMComposeToolBarButtonTypePicture,//相册
    HMComposeToolBarButtonTypeCamera,//照相机
    HMComposeToolBarButtonTypeMention,//提到@
    //    HMComposeToolBarButtonTypeTrend,//
    HMComposeToolBarButtonTypeAudio,//语音
    HMComposeToolBarButtonTypeCamaro,//视频
    HMComposeToolBarButtonTypeEmotion//表情
} HMComposeToolbarButtonType;

@class HMComposeToolbar;

@protocol HMComposeToolbarDelegate <NSObject>

@optional
- (void)composeTool:(HMComposeToolbar *)toolbar didClickedButton:(HMComposeToolbarButtonType)buttonType;

@end

@interface HMComposeToolbar : UIView
@property (nonatomic, weak) id<HMComposeToolbarDelegate> delegate;
@end

//
//  HMStatusPhotoView.h
//  猫头鹰助理
//
//  Created by sam on 16/4/13.
//  Copyright © 2016年 sam. All rights reserved.
//  一个HMStatusPhotoView代表一张配图

#import <UIKit/UIKit.h>
@class HMPhoto;
@interface HMStatusPhotoView : UIImageView
@property (nonatomic, strong) HMPhoto *photo;
@end

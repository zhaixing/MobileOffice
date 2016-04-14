//
//  HMStatusPhotosView.h
//  猫头鹰助理
//
//  Created by sam on 16/4/13.
//  Copyright © 2016年 sam. All rights reserved.
//  微博cell里面的相册，里面包含N个HMStatusPhotoView

#import <UIKit/UIKit.h>

@interface HMStatusPhotosView : UIView
/**
 *  根据图片个数计算相册的最终尺寸
 */
+(CGSize )sizeWithPhotosCount:(int)photosCount;
@end

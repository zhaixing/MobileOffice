//
//  HMStatusPhotosView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/13.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusPhotosView.h"
#import "HMGlobal.h"

@implementation HMStatusPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

+(CGSize )sizeWithPhotosCount:(int)photosCount
{
    CGFloat photoW;
    if ([UIDevice isRunningOniPhone5]) {
         photoW=93;
    }else if([UIDevice isRunningOniPhone6]){
         photoW=112;
    }else if ([UIDevice isRunningOniPhone6Plus]){
        photoW=125;
    }
//    HMLog(@"%f",photoW);
    CGFloat photoH=photoW;
    CGFloat photoMargin = 10;
    
    //一行最多几列
    int maxCols=3;
    
    //总列数
    int totalCols=photosCount >= maxCols ?  maxCols : photosCount;
    
    // 总行数
    // 知道总个数
    // 知道每一页最多显示多少个
    // 能算出一共能显示多少页
    int totalRows = (photosCount + maxCols - 1) / maxCols;
    
    // 计算尺寸
    CGFloat photosW = totalCols * photoW + (totalCols - 1) * photoMargin;
    CGFloat photosH = totalRows * photoH + (totalRows - 1) * photoMargin;
    
    return CGSizeMake(photosW, photosH);
}
//        int totalRows = 0;
//        if (status.pic_urls.count % maxCols == 0) {
//            totalRows = status.pic_urls.count / maxCols;
//        } else {
//            totalRows = status.pic_urls.count / maxCols + 1;
//        }



@end

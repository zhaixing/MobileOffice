//
//  HMStatusPhotosView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/13.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusPhotosView.h"
#import "HMStatusPhotoView.h"
#import "HMGlobal.h"
#import "HMPhoto.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "HMStatus.h"

//
//#define HMStatusPhotosMaxCount 9
//#define HMStatusPhotosMaxCols(photosCount) ((photosCount==4)?2:3)
//#define HMStatusPhotoW 70
//#define HMStatusPhotoH HMStatusPhotoW
//#define HMStatusPhotoMargin 10
//
//@implementation HMStatusPhotosView
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
////        self.backgroundColor = [UIColor redColor];
//        // 预先创建9个图片控件
//        for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
//            HMStatusPhotoView *photoView = [[HMStatusPhotoView alloc] init];
//            [self addSubview:photoView];
//        }
//    }
//    return self;
//}
//
//-(void)setPic_urls:(NSArray *)pic_urls
//{
//    _pic_urls=pic_urls;
//    for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
//        HMStatusPhotoView *photoView = self.subviews[i];
//        
//        if (i < pic_urls.count) { // 显示图片
//            photoView.photo = pic_urls[i];
//            photoView.hidden = NO;
//        } else { // 隐藏
//            photoView.hidden = YES;
//        }
//    }
//}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
////    //根据iPhone的型号确定单张图片的大小
////    CGFloat HMStatusPhotoW;
////    if ([UIDevice isRunningOniPhone5]) {
////        HMStatusPhotoW=93;
////    }else if([UIDevice isRunningOniPhone6]){
////        HMStatusPhotoW=112;
////    }else if ([UIDevice isRunningOniPhone6Plus]){
////        HMStatusPhotoW=125;
////    }
////    CGFloat HMStatusPhotoH=HMStatusPhotoW;
//    
//    int count = self.pic_urls.count;
//    int maxCols = HMStatusPhotosMaxCols(count);
//    for (int i = 0; i<count; i++) {
//        HMStatusPhotoView *photoView = self.subviews[i];
//        photoView.width = HMStatusPhotoW;
//        photoView.height = HMStatusPhotoH;
//        photoView.x = (i % maxCols) * (HMStatusPhotoW + HMStatusPhotoMargin);
//        photoView.y = (i / maxCols) * (HMStatusPhotoH + HMStatusPhotoMargin);
//    }
//}
//
//+(CGSize )sizeWithPhotosCount:(int)photosCount
//{
////    CGFloat photoW;
////    if ([UIDevice isRunningOniPhone5]) {
////         photoW=93;
////    }else if([UIDevice isRunningOniPhone6]){
////         photoW=112;
////    }else if ([UIDevice isRunningOniPhone6Plus]){
////        photoW=125;
////    }
//////    HMLog(@"%f",photoW);
////    CGFloat photoH=photoW;
////    CGFloat photoMargin = 10;
////    
////    //一行最多几列
////    int maxCols=3;
////    
////    //总列数
////    int totalCols=photosCount >= maxCols ?  maxCols : photosCount;
////    
////    // 总行数
////    // 知道总个数
////    // 知道每一页最多显示多少个
////    // 能算出一共能显示多少页
////    int totalRows = (photosCount + maxCols - 1) / maxCols;
////    
////    // 计算尺寸
////    CGFloat photosW = totalCols * photoW + (totalCols - 1) * photoMargin;
////    CGFloat photosH = totalRows * photoH + (totalRows - 1) * photoMargin;
////    
////    return CGSizeMake(photosW, photosH);
//    int maxCols = HMStatusPhotosMaxCols(photosCount);
//    
//    // 总列数
//    int totalCols = photosCount >= maxCols ?  maxCols : photosCount;
//    
//    // 总行数
//    int totalRows = (photosCount + maxCols - 1) / maxCols;
//    
////    //根据iPhone的型号确定单张图片的大小
////    CGFloat HMStatusPhotoW;
////    if ([UIDevice isRunningOniPhone5]) {
////        HMStatusPhotoW=93;
////    }else if([UIDevice isRunningOniPhone6]){
////        HMStatusPhotoW=112;
////    }else if ([UIDevice isRunningOniPhone6Plus]){
////        HMStatusPhotoW=125;
////    }
////    CGFloat HMStatusPhotoH=HMStatusPhotoW;
//    
//    
//    // 计算尺寸
//    CGFloat photosW = totalCols * HMStatusPhotoW + (totalCols - 1) * HMStatusPhotoMargin;
//    CGFloat photosH = totalRows * HMStatusPhotoH + (totalRows - 1) * HMStatusPhotoMargin;
//    
//    return CGSizeMake(photosW, photosH);
//}
////        int totalRows = 0;
////        if (status.pic_urls.count % maxCols == 0) {
////            totalRows = status.pic_urls.count / maxCols;
////        } else {
////            totalRows = status.pic_urls.count / maxCols + 1;
////        }
//
//
//
//@end


#define HMStatusPhotosMaxCount 9
#define HMStatusPhotosMaxCols(photosCount) ((photosCount==4)?2:3)
#define HMStatusPhotoW 70
#define HMStatusPhotoH HMStatusPhotoW
#define HMStatusPhotoMargin 10

@implementation HMStatusPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 预先创建9个图片控件
        for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
            HMStatusPhotoView *photoView = [[HMStatusPhotoView alloc] init];
            [self addSubview:photoView];
        }
    }
    return self;
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;
//    HMLog(@"pic_urls---%@",pic_urls);
    for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
        HMStatusPhotoView *photoView = self.subviews[i];
        
        if (i < pic_urls.count) { // 显示图片
            photoView.photo = pic_urls[i];
            HMPhoto *photo= _pic_urls[i];
//            HMLog(@"photo>>>%@",photo);
//            NSMutableDictionary *photoDictArray = [HMStatus keyValuesArrayWithObjectArray:photo];
//            HMLog(@">>>%@",photoDictArray);http://ww4.sinaimg.cn/thumbnail/006lL3Vbgw1f2rgjapk7aj30zk0no0w7.jpg
            
            
            // 赋值
//            [imageV sd_setImageWithURL:photo.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
//            [photoView setImageWithURL: [NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
            
//            [photoView setImageWithURL:[NSURL URLWithString:pic_urls[@"thumbnail_pic"]] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
            
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
    
//    for (int i=0; i<pic_urls.count; i++) {
//        HMStatusPhotoView *photoView=self.subviews[i];
//        photoView.photo =pic_urls[i];
//        photoView.hidden=NO;
//    }
//    for (int i=pic_urls.count; i<self.subviews.count; i++) {
//        HMStatusPhotoView *photoView=self.subviews[i];
//        photoView.hidden=YES;
//    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.pic_urls.count;
    int maxCols = HMStatusPhotosMaxCols(count);
    for (int i = 0; i<count; i++) {
        HMStatusPhotoView *photoView = self.subviews[i];
        photoView.width = HMStatusPhotoW;
        photoView.height = HMStatusPhotoH;
        photoView.x = (i % maxCols) * (HMStatusPhotoW + HMStatusPhotoMargin);
        photoView.y = (i / maxCols) * (HMStatusPhotoH + HMStatusPhotoMargin);
    }
}

+ (CGSize)sizeWithPhotosCount:(int)photosCount
{
    int maxCols = HMStatusPhotosMaxCols(photosCount);
    
    // 总列数
    int totalCols = photosCount >= maxCols ?  maxCols : photosCount;
    
    // 总行数
    int totalRows = (photosCount + maxCols - 1) / maxCols;
    
    // 计算尺寸
    CGFloat photosW = totalCols * HMStatusPhotoW + (totalCols - 1) * HMStatusPhotoMargin;
    CGFloat photosH = totalRows * HMStatusPhotoH + (totalRows - 1) * HMStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
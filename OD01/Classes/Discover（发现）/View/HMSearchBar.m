//
//  HMSearchBar.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMSearchBar.h"
#import "UIImage+Extension.h"

@implementation HMSearchBar
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame: frame];
    if (self) {

        self.background=[UIImage resizedImage:@"searchbar_textfield_background"];
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        
        //设置左边显示一个放大镜
        UIImageView *leftView=[[UIImageView alloc] init];
        leftView.image=[UIImage imageWithName:@"searchbar_textfield_search_icon"];
//        leftView.width=leftView.image.size.width+10;
//        leftView.height=leftView.image.size.height;
        //设置leftView的内容居中
        leftView.contentMode=UIViewContentModeCenter;
        self.leftView=leftView;
        
        //设置左边的view永远显示
        self.leftViewMode = UITextFieldViewModeAlways;
        
        //设置右边永远显示清楚按钮
        self.clearButtonMode=UITextFieldViewModeAlways;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)searchBar
{
    return [[self alloc] init];
}
@end

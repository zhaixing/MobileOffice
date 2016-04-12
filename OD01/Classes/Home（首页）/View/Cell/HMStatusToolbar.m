//
//  HMStatusToolbar.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusToolbar.h"

@implementation HMStatusToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        UIButton *buttonLeft=[[UIButton alloc] init];
        
        
        [self addSubview:buttonLeft];
        
        UIButton *buttonMid=[[UIButton alloc] init];
        
        UIButton *buttonRight=[[UIButton alloc] init];
        
        
    }
    return self;
}



@end

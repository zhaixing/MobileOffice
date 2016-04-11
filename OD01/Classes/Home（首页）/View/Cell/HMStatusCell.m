//
//  HMStatusCell.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusCell.h"
#import "HMStatusDetailView.h"
#import "HMStatusToolbar.h"

@interface HMStatusCell()
@property (nonatomic,weak) HMStatusDetailView *detailView;
@property (nonatomic,weak) HMStatusToolbar *toolbar;

@end
@implementation HMStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {//初始化子控件
        //1.添加微博具体内容
        [self setupDetailView];
        
        //2.添加工具条
        [self setupToolbar];
    }
    return self;
}
/**
 *  添加微博具体内容
 */
-(void)setupDetailView
{
    HMStatusDetailView *detailView=[[HMStatusDetailView alloc] init];
    [self.contentView addSubview:detailView];
    self.detailView=detailView;
}

/**
 *  添加工具条
 */
-(void)setupToolbar
{
    HMStatusToolbar *toolbar=[[HMStatusToolbar alloc] init];
    [self.contentView addSubview:toolbar];
    self.toolbar=toolbar;
}
@end

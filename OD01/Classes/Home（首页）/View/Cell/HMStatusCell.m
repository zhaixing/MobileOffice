//
//  HMStatusCell.m
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMGlobal.h"
#import "HMStatusCell.h"
#import "HMStatusDetailView.h"
#import "HMStatusToolbar.h"
#import "HMStatusFrame.h"

@interface HMStatusCell()
@property (nonatomic, weak) HMStatusDetailView *detailView;
@property (nonatomic, weak) HMStatusToolbar *toolbar;
@end

@implementation HMStatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HMStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        // 1.添加微博具体内容
        HMStatusDetailView *detailView = [[HMStatusDetailView alloc] init];
        [self.contentView addSubview:detailView];
        self.detailView = detailView;
        
        // 2.添加工具条
        HMStatusToolbar *toolbar = [[HMStatusToolbar alloc] init];
        [self.contentView addSubview:toolbar];
        self.toolbar = toolbar;
        
        //3.cell颜色设置
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

- (void)setStatusFrame:(HMStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.微博具体内容的frame数据
    self.detailView.detailFrame = statusFrame.detailFrame;
    
    // 2.底部工具条的frame数据
    self.toolbar.frame = statusFrame.toolbarFrame;
    self.toolbar.status=statusFrame.status;
}
@end
//
//  HMLoadMoreFooter.m
//  猫头鹰助理
//
//  Created by sam on 16/4/9.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMLoadMoreFooter.h"
@interface HMLoadMoreFooter()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

@end

@implementation HMLoadMoreFooter

+(instancetype)footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HMLoadMoreFooter" owner:nil options:nil] lastObject];
}
-(void)beginRefreshing
{
    self.statusLabel.text=@"加载中...";
    [self.loadingView startAnimating];
    self.refreshing =YES;
}

-(void)endRefreshing
{
    self.statusLabel.text=@"上拉加载更多";
    [self.loadingView stopAnimating];
    self.refreshing=NO;
}

@end

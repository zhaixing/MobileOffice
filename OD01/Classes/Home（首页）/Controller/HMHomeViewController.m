//
//  HMHomeViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMHomeViewController.h"
#import "UIView+Extension.h"
#import "HMGlobal.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"

@interface HMHomeViewController ()

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏按钮
//    UIButton *leftButton=[[UIButton alloc] init];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRange"] forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRangeSelected"] forState:UIControlStateHighlighted];
//    //设置按钮的尺寸为图片的尺寸 
//    leftButton.size=leftButton.currentBackgroundImage.size;
//    
//    [leftButton addTarget:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //设置导航栏按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    //设置导航栏中间的标题按钮
    UIButton *titleButton=[[UIButton  alloc] init];
    //设置文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleButton.titleLabel.font=HMNavigationTitleFont;
    //设置图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //高亮的时候不需要调整内部的图片为灰色
//    titleButton.adjustsImageWhenHighlighted=NO;
    //设置背景
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"]forState:UIControlStateHighlighted];
    titleButton.width=65;
    titleButton.height=35;
    [titleButton addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=titleButton;
}
-(void)titleClicked:(UIButton *)titleButton
{
    if(titleButton.tag==0){
        titleButton.tag=10;
        //换成箭头向上
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }else{
        titleButton.tag=0;
        //换成箭头向下
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
//    UIImage *downImage=[UIImage imageNamed:@"navigationbar_arrow_down"];
//    if(titleButton.currentImage==downImage){
//        //换成箭头向上
//        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
//    }else{
//        //换成箭头向下
//        [titleButton setImage:downImage forState:UIControlStateNormal];
//    }
}
-(void)friendSearch
{
    HMLog(@"friendSearch---");
}
-(void)pop
{
    HMLog(@"pop---");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"首页测试数据----%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc=[[UIViewController alloc] init];
    newVc.view.backgroundColor=[UIColor blueColor];
    newVc.title=@"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}
@end

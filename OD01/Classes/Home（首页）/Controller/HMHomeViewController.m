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
#import "AFNetworking.h"
#import "HMAccountTool.h"
#import "HMAccount.h"
#import "UIImageView+WebCache.h"


@interface HMHomeViewController ()
/**
 *  微博数组，存放着所有微博数据
 */
@property (nonatomic,strong) NSArray *statuses;
@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的内容
    [self setupNavBar];
    
    // 加载最新的微博数据
    [self loadNewStatus];
}
/**
 *  加载最新的微博数据
 */
- (void)loadNewStatus
{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HMAccountTool account].access_token;
    NSLog(@"参数token---%@",params[@"access_token"]);
    // 3.发送GET请求
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *resultDict) {
        HMLog(@"请求成功--%@", resultDict);
        
//        // 赋值数组数据
        self.statuses = resultDict[@"statuses"];
        
        // 重新刷新表格,因为异步刷新数据，需要重新刷新表格
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        HMLog(@"请求失败--%@", error);
    }];
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

/**
 *  设置导航栏的内容
 */
- (void)setupNavBar
{
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
//    return 12;
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //行里面显示什么数据
//    cell.textLabel.text=[NSString stringWithFormat:@"首页测试数据----%ld",(long)indexPath.row];
    // 取出这行对应的微博字典数据
    NSDictionary *statusDict = self.statuses[indexPath.row];
    cell.textLabel.text = statusDict[@"text"];
    
    // 取出用户字典数据
    NSDictionary *userDict = statusDict[@"user"];
    cell.detailTextLabel.text = userDict[@"name"];
    
    // 下载头像
    NSString *imageUrlStr = userDict[@"profile_image_url"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
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

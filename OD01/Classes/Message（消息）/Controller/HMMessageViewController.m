//
//  HMMessageViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMMessageViewController.h"
#import "HMGlobal.h"
@interface HMMessageViewController ()

@end

@implementation HMMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
//    UIBarButtonItem *appearance=[UIBarButtonItem appearance];
//    //设置普通状态的文字属性
//    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName]=themeColor;
//    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    //设置不可用状态（disable）的文字属性
//    NSMutableDictionary *disableTextAttrs=[NSMutableDictionary dictionary];
//    disableTextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
//    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateNormal];

    
    //右上角的写私信
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"写私信" forState:UIControlStateNormal];
    [button setTitleColor:themeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    button.sizeToFit;
    
     // 监听按钮点击
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(xieSiXin) forControlEvents:UIControlEventTouchUpInside];
//     self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写消息" style:UIBarButtonItemStyleDone target:nil action:nil];
    //让这个按钮不可用
//    self.navigationItem.rightBarButtonItem.enabled=YES;
    
}
-(void)xieSiXin
{
    HMLog(@"xieSiXin---");
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationItem.rightBarButtonItem.enabled=NO;
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
    cell.textLabel.text=[NSString stringWithFormat:@"消息测试数据----%ld",(long)indexPath.row];
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

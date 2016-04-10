//
//  HMHomeViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

/**
 44 : cell的默认高度、导航栏的可见高度
 49 : UITabBar的默认高度
 64 : 从窗口顶部到导航栏底部
 20 : 状态栏高度
 320 : 竖屏情况下的屏幕宽度
 480 : 竖屏情况下的3.5 inch 的屏幕高度
 568 : 竖屏情况下的4.0 inch 的屏幕高度
 */
#import "HMHomeViewController.h"
//#import "UIView+Extension.h"
#import "HMGlobal.h"
//#import "UIBarButtonItem+Extension.h"
//#import "UIImage+Extension.h"
//#import "AFNetworking.h"
#import "HMAccountTool.h"
#import "HMAccount.h"
#import "UIImageView+WebCache.h"
#import "HMStatus.h"
#import "HMUser.h"
#import "MJExtension.h"
#import "HMLoadMoreFooter.h"
#import "HMTitleButton.h"
#import "HMStatusTool.h"
#import "HMUserTool.h"

@interface HMHomeViewController ()
/**
 *  微博数组，存放着所有微博数据
 */
@property (nonatomic,strong) NSMutableArray *statuses;
@property (nonatomic,weak) HMLoadMoreFooter *footer;
@property (nonatomic, weak) UIButton *titleButton;
@end

@implementation HMHomeViewController
-(NSMutableArray *)statuses
{
    if(_statuses==nil){
        _statuses=[NSMutableArray array];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的内容
    [self setupNavBar];
    
//    // 加载最新的微博数据
//    [self loadNewStatus];
    
    //集成刷新数据
    [self setupRefresh];
    
    //把“首页”->“用户昵称”
    // 获得用户信息
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self setupUserInfo];
    //    });
}

/**
 *  把首页换成用户昵称
 */
-(void)setupUserInfo
{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    params[@"uid"] = [HMAccountTool account].uid;
//    
//    // 3.发送GET请求
//    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params
//     success:^(AFHTTPRequestOperation *operation, NSDictionary *userDict) {
//         // 字典转模型
//         HMUser *user = [HMUser objectWithKeyValues:userDict];
//         
//         // 设置用户的昵称为标题
//         [self.titleButton setTitle:user.name forState:UIControlStateNormal];
//         
//         // 存储帐号信息
//         HMAccount *account = [HMAccountTool account];
//         account.name = user.name;
//         [HMAccountTool save:account];
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         
//     }];
    
#pragma mark - 第一次封装，面向字典
//    //封装之后
//    // 1.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    params[@"uid"] = [HMAccountTool account].uid;
//    
//    // 2.发送请求
//    [HMHttpTool get:@"https://api.weibo.com/2/users/show.json" params:params success:^(id repsonseObj){
//        // 字典转模型
//        HMUser *user = [HMUser objectWithKeyValues:repsonseObj];
//        
//        // 设置用户的昵称为标题
//        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
//        
//        // 存储帐号信息
//        HMAccount *account = [HMAccountTool account];
//        account.name = user.name;
//        [HMAccountTool save:account];
//    } failure:^(NSError *error){
//        HMLog(@"请求失败-------%@", error);
//    }];

#pragma mark - 第二次封装，面向模型
    // 1.封装请求参数
    HMUserInfoParam *param = [[HMUserInfoParam alloc] init];
    param.access_token = [HMAccountTool account].access_token;
    param.uid = [HMAccountTool account].uid;
    
    // 2.加载用户信息
    [HMUserTool userInfoWithParam:param success:^(HMUserInfoResult *user) {
        // 设置用户的昵称为标题
        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
        
        // 存储帐号信息
        HMAccount *account = [HMAccountTool account];
        account.name = user.name;
        [HMAccountTool save:account];
    } failure:^(NSError *error) {
        HMLog(@"请求失败-------%@", error);
    }];
}
/**
 *  设置导航栏的内容
 */
- (void)setupNavBar
{
    //设置导航栏按钮
        UIButton *leftButton=[[UIButton alloc] init];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRange"] forState:UIControlStateNormal];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRangeSelected"] forState:UIControlStateHighlighted];
        //设置按钮的尺寸为图片的尺寸
        leftButton.size=leftButton.currentBackgroundImage.size;
        [leftButton addTarget:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //设置导航栏按钮
//    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    //设置导航栏中间的标题按钮
    UIButton *titleButton=[[UIButton  alloc] init];
    //设置文字
    NSString *name=[HMAccountTool account].name;//从沙盒里面取
    [titleButton setTitle:name ? name:@"首页" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    titleButton.titleLabel.font=HMNavigationTitleFont;
    //设置图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //高亮的时候不需要调整内部的图片为灰色
    //    titleButton.adjustsImageWhenHighlighted=NO;
    //设置背景
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"]forState:UIControlStateHighlighted];
    titleButton.width=150;
    titleButton.height=35;
    [titleButton addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=titleButton;
    self.titleButton=titleButton;
    
}



/**
 *  集成刷新数据 实现
 */
-(void)setupRefresh
{
    // 1.添加下拉刷新控件
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refreshControl];
    
    // 2.监听状态
    [refreshControl addTarget:self action:@selector(refreshControlStateChange:) forControlEvents:UIControlEventValueChanged];
    
    //出来就有数据这样写
    //让刷新控件自动进入刷新状态
    [refreshControl beginRefreshing];
    //加载数据
    [self refreshControlStateChange:refreshControl];
//    模拟网速慢，跟上面一行冲突
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [self refreshControlStateChange:refreshControl];
    //    });
    
    
    //5.添加上拉加载更多控件
    HMLoadMoreFooter *footer=[HMLoadMoreFooter footer];
    self.tableView.tableFooterView=footer;
    self.footer=footer;
}
/**
 *  当下拉刷新控件进入刷新状态（转圈）的时候会自动调用
 */
- (void)refreshControlStateChange:(UIRefreshControl *) refreshContrl
{
    [self loadNewStatuses:refreshContrl];
}
#pragma mark - 加载微博数据
/**
 *  加载最新的微博数据
 */
-(void)loadNewStatuses:(UIRefreshControl *)refreshControl
{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    HMStatus *firstStatus =  [self.statuses firstObject];
//    if (firstStatus) {
//        // since_id 	false 	int64 	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
//        params[@"since_id"] = firstStatus.idstr;
//    }
//    
//    // 3.发送GET请求
//    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params
//     success:^(AFHTTPRequestOperation *operation, NSDictionary *resultDict) {
//         // 微博字典数组
//         NSArray *statusDictArray = resultDict[@"statuses"];
//         // 微博字典数组 ---> 微博模型数组
//         NSArray *newStatuses = [HMStatus objectArrayWithKeyValuesArray:statusDictArray];
//         
//         // 将新数据插入到旧数据的最前面
//         NSRange range = NSMakeRange(0, newStatuses.count);
//         NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
//         [self.statuses insertObjects:newStatuses atIndexes:indexSet];
//         
//         // 重新刷新表格
//         [self.tableView reloadData];
//         
//         // 让刷新控件停止刷新（恢复默认的状态）
//         [refreshControl endRefreshing];
//         
//         // 提示用户最新的微博数量
//         [self showNewStatusesCount:newStatuses.count];
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         HMLog(@"请求失败--%@", error);
//         // 让刷新控件停止刷新（恢复默认的状态）
//         [refreshControl endRefreshing];
//     }];
    
#pragma mark - 第一次封装
    //封装之后
    // 1.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HMAccountTool account].access_token;
    HMStatus *firstStatus =  [self.statuses firstObject];
    if (firstStatus) {
        params[@"since_id"] = firstStatus.idstr;
    }
    
    // 2.发送请求
    [HMHttpTool get:@"https://api.weibo.com/2/statuses/home_timeline.json" params:params success:^(id responseObj) {
        // 微博字典数组
        NSArray *statusDictArray = responseObj[@"statuses"];
        // 微博字典数组 ---> 微博模型数组
        NSArray *newStatuses = [HMStatus objectArrayWithKeyValuesArray:statusDictArray];
        
        // 将新数据插入到旧数据的最前面
        NSRange range = NSMakeRange(0, newStatuses.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.statuses insertObjects:newStatuses atIndexes:indexSet];
        
        // 重新刷新表格
        [self.tableView reloadData];
        
        // 让刷新控件停止刷新（恢复默认的状态）
        [refreshControl endRefreshing];
        
        // 提示用户最新的微博数量
        [self showNewStatusesCount:newStatuses.count];
    } failure:^(NSError *error) {
        HMLog(@"请求失败--%@", error);
        // 让刷新控件停止刷新（恢复默认的状态）
        [refreshControl endRefreshing];
    }];
    
#pragma mark - 第二次封装 面向模型开发，封装了业务
//    // 1.封装请求参数
//    HMHomeStatusesParam *param = [[HMHomeStatusesParam alloc] init];
//    param.access_token = [HMAccountTool account].access_token;
////    param.count=4;
//    HMStatus *firstStatus =  [self.statuses firstObject];
//    if (firstStatus) {
//        param.since_id = @([firstStatus.idstr longLongValue]);
//    }
//    
//    // 2.加载微博数据
//    [HMStatusTool homeStatusesWithParam:param success:^(HMHomeStatusesResult *result) {
//        // 获得最新的微博数组
//
//        NSArray *newStatuses = result.statuses ;
//
//        // 将新数据插入到旧数据的最前面
//        NSRange range = NSMakeRange(0, newStatuses.count);
//        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
//        [self.statuses insertObjects:newStatuses atIndexes:indexSet];
//
//        // 重新刷新表格
//        [self.tableView reloadData];
//
//        // 让刷新控件停止刷新（恢复默认的状态）
//        [refreshControl endRefreshing];
//        
//        // 提示用户最新的微博数量
//        [self showNewStatusesCount:newStatuses.count];
//        
//        
//        
//    } failure:^(NSError *error) {
//        HMLog(@"请求失败--%@", error);
//        // 让刷新控件停止刷新（恢复默认的状态）
//        [refreshControl endRefreshing];
//    }];
}
/**
 *  加载更多的数据
 */
-(void)loadMoreStatuses
{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    HMStatus *lastStatus =  [self.statuses lastObject];
//    if (lastStatus) {
//        // max_id	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
//        params[@"max_id"] = @([lastStatus.idstr longLongValue] - 1);
//    }
//    
//    // 3.发送GET请求
//    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params
//     success:^(AFHTTPRequestOperation *operation, NSDictionary *resultDict) {
//         // 微博字典数组
//         NSArray *statusDictArray = resultDict[@"statuses"];
//         // 微博字典数组 ---> 微博模型数组
//         NSArray *newStatuses = [HMStatus objectArrayWithKeyValuesArray:statusDictArray];
//         
//         // 将新数据插入到旧数据的最后面
//         [self.statuses addObjectsFromArray:newStatuses];
//         
//         // 重新刷新表格
//         [self.tableView reloadData];
//         
//         // 让刷新控件停止刷新（恢复默认的状态）
//         [self.footer endRefreshing];
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         HMLog(@"请求失败--%@", error);
//         // 让刷新控件停止刷新（恢复默认的状态）
//         [self.footer endRefreshing];
//     }];

#pragma mark - 第一次封装，面向字典开发
    //封装之后
    // 1.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HMAccountTool account].access_token;
    HMStatus *lastStatus =  [self.statuses lastObject];
    if (lastStatus) {
        params[@"max_id"] = @([lastStatus.idstr longLongValue] - 1);
    }
    
    // 2.发送请求
    [HMHttpTool get:@"https://api.weibo.com/2/statuses/home_timeline.json" params:params success:^(id responseObj) {
        // 微博字典数组
        NSArray *statusDictArray = responseObj[@"statuses"];
        // 微博字典数组 ---> 微博模型数组
        NSArray *newStatuses = [HMStatus objectArrayWithKeyValuesArray:statusDictArray];
        
        // 将新数据插入到旧数据的最后面
        [self.statuses addObjectsFromArray:newStatuses];
        
        // 重新刷新表格
        [self.tableView reloadData];
        
        // 让刷新控件停止刷新（恢复默认的状态）
        [self.footer endRefreshing];
    } failure:^(NSError *error) {
        HMLog(@"请求失败--%@", error);
        // 让刷新控件停止刷新（恢复默认的状态）
        [self.footer endRefreshing];
    }];
    
#pragma mark - 第二次封装，面向模型，封装业务
//    // 1.封装请求参数
//    HMHomeStatusesParam *param = [[HMHomeStatusesParam alloc] init];
//    param.access_token = [HMAccountTool account].access_token;
//    HMStatus *lastStatus =  [self.statuses lastObject];
//    if (lastStatus) {
//        param.max_id = @([lastStatus.idstr longLongValue] - 1);
//    }
//    
//    // 2.加载微博数据
//    [HMStatusTool homeStatusesWithParam:param success:^(HMHomeStatusesResult *result) {
//        // 微博模型数组
//        NSArray *newStatuses = result.statuses;
//        
//        // 将新数据插入到旧数据的最后面
//        [self.statuses addObjectsFromArray:newStatuses];
//        
//        // 重新刷新表格
//        [self.tableView reloadData];
//        
//        // 让刷新控件停止刷新（恢复默认的状态）
//        [self.footer endRefreshing];
//    } failure:^(NSError *error) {
//        HMLog(@"请求失败--%@", error);
//        // 让刷新控件停止刷新（恢复默认的状态）
//        [self.footer endRefreshing];
//    }];
}

/**
 *  提示用户最新的微博数量
 *
 *  @param count 最新的微博数量
 */
-(void)showNewStatusesCount:(int)count
{
    //1.创建一个label
    UILabel *label=[[UILabel alloc] init];
    //2.显示文字
    if(count){
        label.text=[NSString stringWithFormat:@"%d条动态",count];
    }else{
        label.text=@"没动态，哦啦啦！";
    }
    
    //3.设置背景
    label.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor whiteColor];
    
    //4.设置frame
    label.width=self.view.width;
    label.height=35;
    label.x=0;
//    label.y=self.navigationController.navigationBar.height -label.height;
    label.y=64 -label.height;
    
    //5.添加到导航控制器的view
    [self.navigationController.view insertSubview:label
                                          belowSubview:self.navigationController.navigationBar];
    
    //6.动画
    
    CGFloat duration=1.0;
    label.alpha=0.0;
    [UIView animateWithDuration:duration animations:^{
        //往下移动一个label的高度
        label.transform=CGAffineTransformMakeTranslation(0, label.height);
        label.alpha=0.95;
    }completion:^(BOOL finished) {
        //向下移动完毕
        //延迟delay秒后，在执行动画
        CGFloat delay=1.0;
        
        [UIView animateWithDuration:duration
                              delay:delay
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             //恢复到原来的位置
                             label.transform=CGAffineTransformIdentity;
                             label.alpha=0.0;
                         } completion:^(BOOL finished) {
                             //删除控件
                             [label removeFromSuperview];
                         }];
    }];
    
}
/**
 UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // 开始：由慢到快，结束：由快到慢
 UIViewAnimationOptionCurveEaseIn               = 1 << 16, // 由慢到块
 UIViewAnimationOptionCurveEaseOut              = 2 << 16, // 由快到慢
 UIViewAnimationOptionCurveLinear               = 3 << 16, // 线性，匀速
 */


//
///**
// *  加载最新的微博数据
// */
//- (void)loadNewStatus
//{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
////    NSLog(@"参数token---%@",params[@"access_token"]);
//    // 3.发送GET请求
//    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *resultDict) {
//        HMLog(@"请求成功--%@", resultDict);
//        
//        
////        // 赋值数组数据
////        self.statuses = resultDict[@"statuses"];
//        
////        self.statuses=[NSMutableArray array];
//        
//        //微博字典数组
//        NSArray *statusDictArray=resultDict[@"statuses"];
//        
//        //微博字典数组--->微博模型数组
//        self.statuses=[HMStatus objectArrayWithKeyValuesArray:statusDictArray];
//        
////        for (NSDictionary *statusDict in statusDictArray) {
////            HMStatus *status=[HMStatus statusWithDict:statusDict];
////            [self.statuses addObject:status];
////        }
//        
//        // 重新刷新表格,因为异步刷新数据，需要重新刷新表格
//        [self.tableView reloadData];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        HMLog(@"请求失败--%@", error);
//    }];
//}

-(void)titleClicked:(UIButton *)titleButton
{
    HMLog(@"ddd");
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
//    return 12;
#warning 为什么写在这里：为了监听tableView每次显示数据的过程
    self.footer.hidden = self.statuses.count == 0;
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
    HMStatus *status = self.statuses[indexPath.row];
    cell.textLabel.text = status.text;
    
    // 取出用户
    HMUser *user = status.user;
    cell.detailTextLabel.text = user.name;
    
    // 下载头像
    NSString *imageUrlStr = user.profile_image_url;
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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statuses.count <= 0 || self.footer.isRefreshing) return;
    
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = self.view.height - self.tabBarController.tabBar.height;
    
    // 2.如果能看见整个footer
    if (delta <= (sawFooterH - 0)) {
        // 进入上拉刷新状态
        [self.footer beginRefreshing];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 加载更多的微博数据
            [self loadMoreStatuses];
        });
    }
}

@end

//
//  HMNewfeatureViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMNewfeatureViewController.h"
#import "HMGlobal.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "HMTabBarViewController.h"

#define HMNewfeatureImageCount 5

@interface HMNewfeatureViewController ()

@end

@implementation HMNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加UIScrollView
    [self setupScrollView];
    //2.添加pageControl,地下的小圆点.图片自带圆点，所以这次不学了。
//    [self setupPageControl];
}
/**
 *  添加UIScrollView
 */
-(void)setupScrollView
{
    //1.添加UIScrollView
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.frame=self.view.bounds;//充满屏幕
    [self.view addSubview:scrollView];//添加进去
    
    //2.添加图片
    CGFloat imageW=scrollView.frame.size.width;
    CGFloat imageH=scrollView.frame.size.height;
    for (int i=0; i<HMNewfeatureImageCount; i++) {
        //创建UIImageView
        UIImageView *imageView=[[UIImageView alloc] init];
        NSString *name=[NSString stringWithFormat:@"Guide0%d",i+1];
//        if ([UIScreen mainScreen].bounds.size.height==568.0) {
//            name=[name stringByAppendingString:@"-568h"];
//        }
        imageView.image=[UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
//        NSLog(@"---%@",name);
//        NSLog(@"---%@",imageView.image);
        //设置frame
        imageView.y=0;
        imageView.width=imageW;
        imageView.height=imageH;
        imageView.x=i*imageW;
        
        //给最后一个view添加“立即体验”按钮
        if(i==HMNewfeatureImageCount-1){
            [self setupLastImageView:imageView];
        }
    }
    //设置其他属性
    scrollView.contentSize=CGSizeMake(HMNewfeatureImageCount*imageW, 0);//可以向右滑动了
    scrollView.pagingEnabled=YES;//
    scrollView.showsHorizontalScrollIndicator=NO;//去掉水平控制条
    scrollView.backgroundColor=[UIColor colorWithRed:106/255.0 green:198/255.0 blue:78/255.0 alpha:1.0];//左边的弹性设置
    
}

/**
 *  <#Description#>
 */
//-(void)setupPageControl
//{
//    //1.添加
//    UIPageControl *pageControl=[[UIPageControl alloc] init];
//    pageControl.numberOfPages=HMNewfeatureImageCount;
//
//    
////    pageControl.centerXAnchor=self.view.width*0.5;
////    pageControl.centerYAnchor=self.view.height-30;
//    [self.view addSubview:pageControl];
//    
//    //2.设置原点的样式
//    pageControl.currentPageIndicatorTintColor=themeColor;//当前页的圆点颜色
//    pageControl.pageIndicatorTintColor=themeColor;//非当前页
//    
//}

/**
 *  设置最后一个UIImageView的内容
 *
 *  @param imageView <#imageView description#>
 */
-(void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled=YES;
    //添加开始按钮
    [self setupStartButton:imageView];
}

/**
 *  开始按钮
 */
-(void)setupStartButton:(UIImageView *)imageView
{
    //1.添加开始按钮
    UIButton *startButton=[[UIButton alloc] init];
    [imageView addSubview:startButton];
    
    //设置背景图片
//    [startButton setBackgroundColor:[UIColor ]];
    //设置frame
    startButton.frame=CGRectMake(self.view.width*0.22, self.view.height*0.84, 180, 38);
    //设置文字
//    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  start按钮实现
 */
-(void)start
{
//    NSLog(@"start---");
    //显示主窗口
    //三种方法
    
    //1.push 浪费内存
    
    //2.model 浪费内存
//    HMTabBarViewController *vc=[[HMTabBarViewController alloc] init];
//    [self presentViewController:vc animated:NO completion:nil];
    
    //3.window.rootViewController
    HMTabBarViewController *vc=[[HMTabBarViewController alloc] init];
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    window.rootViewController=vc;

}
@end


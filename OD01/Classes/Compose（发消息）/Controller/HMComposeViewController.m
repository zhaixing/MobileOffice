//
//  HMComposeViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMComposeViewController.h"
#import "HMGlobal.h"
#import "HMTextView.h"
#import "HMComposeToolBar.h"

@interface HMComposeViewController () <HMComposeToolbarDelegate,UITextViewDelegate>
@property (nonatomic, weak) HMTextView *textView;
@end

@implementation HMComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏按钮
    [self setNavBar];
    
    //添加输入控件UITextView
    [self setupTextView];
    
    //添加工具条
    [self setupToolBar];
    
}

/**
 *  添加工具条 实现
 */
-(void)setupToolBar
{
    //1.创建
    HMComposeToolbar *toolbar=[[HMComposeToolbar alloc] init];
    toolbar.bounds=CGRectMake(0, 0, self.view.frame.size.width, 34);
    toolbar.delegate=self;
    //2.显示
    self.textView.inputAccessoryView=toolbar;
    
}

/**
 *  添加输入控件UITextView 的实现
 */
-(void)setupTextView
{
    //1.创建控件
    HMTextView *textView=[[HMTextView alloc] init];
    textView.alwaysBounceVertical=YES;//垂直方向上的弹簧效果
    textView.frame=self.view.bounds;
    textView.delegate=self;//遵守代理
    [self.view addSubview:textView];
    self.textView=textView;
    
    //2.设置提醒文字（站位文字）
    textView.placehoder=@"分享到同事圈...";
    //3.设置字体
    textView.font=[UIFont systemFontOfSize:15];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //成为第一响应者（叫出键盘）
    [self.textView becomeFirstResponder];
}

/**
 *  添加导航栏按钮的实现
 */
-(void)setNavBar
{
    self.title=@"写消息";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled=NO;
}
/**
 *  取消事件实现
 */
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发送事件实现
 */
-(void)send
{
    HMLog(@"send---");
}


#pragma mark - UITextViewDelegate
/**
 *  当用户开始拖拽scrollView时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - HMComposeToolbarDelegate
/**
 *  监听toolbar内部按钮的点击
 */
- (void)composeTool:(HMComposeToolbar *)toolbar didClickedButton:(HMComposeToolbarButtonType)buttonType
{
    switch (buttonType) {
        case HMComposeToolBarButtonTypePicture://相册
            HMLog(@"打开相册");
            break;
            
        case HMComposeToolBarButtonTypeCamera://照相机
            HMLog(@"打开照相机");
            break;
            
        case HMComposeToolBarButtonTypeMention://提到@
            HMLog(@"打开提到@");
            break;
        case HMComposeToolBarButtonTypeAudio://语音
            NSLog(@"语音");
            break;
        case HMComposeToolBarButtonTypeCamaro://视频
            NSLog(@"视频");
            break;
        case HMComposeToolBarButtonTypeEmotion://表情:
            NSLog(@"表情");
            break;
        default:
            break;
    }
}
//    UIImage *image = [button imageForState:UIControlStateNormal];
//    if (image == [UIImage imageWithName:@"compose_camerabutton_background"]) {
//        HMLog(@"打开照相机");
//    } else if (image == [UIImage imageWithName:@"compose_toolbar_picture"]) {
//        HMLog(@"打开相册");
//    }

//    switch (button.tag) {
//        case 3:
//            <#statements#>
//            break;
//
//        default:
//            break;
//    }
@end

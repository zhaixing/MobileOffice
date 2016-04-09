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
#import "HMComposePhotosView.h"
#import "UIView+Extension.h"

@interface HMComposeViewController () <HMComposeToolbarDelegate,UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, weak) HMTextView *textView;
@property (nonatomic,weak) HMComposeToolbar *toolbar;
@property (nonatomic,weak) HMComposePhotosView *photosView;
@end

@implementation HMComposeViewController
#pragma mark - 初始化方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏按钮
    [self setNavBar];
    
    //添加输入控件UITextView
    [self setupTextView];
    
    //添加工具条
    [self setupToolBar];
    
    //添加显示图片的相册控件
    [self setupPhotosView];
}

/**
 *  添加显示图片的相册控件
 */
-(void)setupPhotosView
{
    HMComposePhotosView *photosView=[[HMComposePhotosView alloc] init];
    photosView.width = self.textView.width;
    photosView.height = self.textView.height;
    photosView.y = 70;
    [self.textView addSubview:photosView];
    self.photosView = photosView;
}

/**
 *  添加工具条
 */
-(void)setupToolBar
{
    HMComposeToolbar *toolbar = [[HMComposeToolbar alloc] init];
    toolbar.width = self.view.width;
    toolbar.delegate = self;
    toolbar.height = 34;
    self.toolbar = toolbar;
    //2.显示
    toolbar.y = self.view.height - toolbar.height;
    [self.view addSubview:toolbar];
    
    
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
    
    // 4.监听键盘
    // 键盘的frame(位置)即将改变, 就会发出UIKeyboardWillChangeFrameNotification
    // 键盘即将弹出, 就会发出UIKeyboardWillShowNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘即将隐藏, 就会发出UIKeyboardWillHideNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
/**
 *  view显示完毕的时候再弹出键盘，避免显示控制器view 的时候回卡住
 */
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

#pragma mark - 私有方法
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

#pragma mark - 键盘处理
/**
 *  键盘即将隐藏
 */
-(void)keyboardWillHide:(NSNotification *)note
{
    //1.键盘弹出需要的时间
    CGFloat duration=[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //2.动画
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform=CGAffineTransformIdentity;
    }];
}
/**
 *  键盘即将弹出
 */
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘高度
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.toolbar.transform = CGAffineTransformMakeTranslation(0, - keyboardH);
    }];
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
//            HMLog(@"打开相册");
            [self openAlbum];
            break;
            
        case HMComposeToolBarButtonTypeCamera://照相机
            HMLog(@"打开照相机");
            [self openCamera];
            break;
            
        case HMComposeToolBarButtonTypeMention://提到@
            HMLog(@"打开提到@");
            break;
        case HMComposeToolBarButtonTypeAudio://语音
            HMLog(@"打开语音");
            break;
        case HMComposeToolBarButtonTypeCamaro://视频
            HMLog(@"打开视频");
//            [self openVideo];
            break;
        case HMComposeToolBarButtonTypeEmotion://表情:
            HMLog(@"打开表情");
            [self openEmotion];
            break;
        default:
            break;
    }
}

/**
 *  打开照相机
 */
-(void)openCamera
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openAlbum
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开表情
 */
- (void)openEmotion
{
    HMLog(@"添加表情");
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 1.取出选中的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 2.添加图片到相册中
    [self.photosView addImage:image];
}
@end

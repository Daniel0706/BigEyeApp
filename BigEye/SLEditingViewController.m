//
//  SLEditingViewController.m
//  BigEye
//
//  Created by 张鹤 on 2017/4/19.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "SLEditingViewController.h"

@interface SLEditingViewController ()<UITextViewDelegate>
{
    UIView      *_toolView; // 工具栏
    UITextView  *_textView;
    UILabel     *_placeholder;
    NSInteger    keyBoardHeight;

}
@end

@implementation SLEditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];

}

-(void)creatUI
{
    
    //编辑框
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64.f)];
    
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:22.0f];
    [self.view addSubview:_textView];
    _textView.returnKeyType = UIReturnKeyDone;
    
    //提示文字
    _placeholder = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 40)];
    _placeholder.enabled = NO;
    _placeholder.text = @"有什么想说的";
    _placeholder.font = [UIFont systemFontOfSize:22.0f];
    _placeholder.textColor = [UIColor lightGrayColor];
    [_textView addSubview:_placeholder];
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    _toolView  = [[UIView alloc]init];
       _toolView.backgroundColor = [UIColor cyanColor];
    _toolView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 50);
    [self.view addSubview:_toolView];
    
    UIButton *losebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    losebtn.frame = CGRectMake(20, 0, 50, 50);
    //[btn setBackgroundColor:[UIColor whiteColor]];
    [losebtn addTarget:self action:@selector(imageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [losebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [losebtn setTitle:@"图片" forState:UIControlStateNormal];
    losebtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_toolView addSubview:losebtn];
    
    
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageBtn setTitle:@"链接" forState:UIControlStateNormal];
    imageBtn.frame = CGRectMake(20 + 50, 0, 50, 50);
    [imageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    imageBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [imageBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:imageBtn];
    
//    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [cameraBtn setTitle:@"相机" forState:UIControlStateNormal];
//    cameraBtn.frame = CGRectMake(ScreenWidth-50, 0, 50, 50);
//    [cameraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [cameraBtn addTarget:self action:@selector(cameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [_toolView addSubview:cameraBtn];
//    
//    UIButton *canclebtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [canclebtn setTitle:@"取消" forState:UIControlStateNormal];
//    canclebtn.frame = CGRectMake(ScreenWidth-150, 0, 50, 50);
//    [canclebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [canclebtn addTarget:self action:@selector(canclebtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [_toolView addSubview:canclebtn];
    
}
#pragma mark 弹下
-(void)btnClick
{
    [_textView resignFirstResponder];
}
#pragma mark 当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyBoardHeight = keyboardRect.size.height;
    //    NSLog(@"%ld",(long)keyBoardHeight);
    [UIView animateWithDuration:0.1 animations:^{
        _textView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-keyBoardHeight-50);
        _toolView.frame = CGRectMake(0, ScreenHeight-keyBoardHeight-50, ScreenWidth, 50);
    }];
    
}

#pragma mark 当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.1 animations:^{
        _textView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _toolView.frame = CGRectMake(0, ScreenHeight+50, ScreenWidth, 50);
    }];
}
#pragma mark 根据文字长度   是否显示提示文字
- (void)textViewDidChange:(UITextView *)textView;
{
    if (_textView.textStorage.length == 0)
    {
        _placeholder.hidden = NO;
    }
    else
    {
        _placeholder.hidden = YES;
    }
    if ([textView.text isEqualToString: @"\n"]) {
        [textView endEditing:YES];
    }
}


@end

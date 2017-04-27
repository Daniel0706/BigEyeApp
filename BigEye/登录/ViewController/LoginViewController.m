//
//  LoginViewController.m
//  BigEye
//
//  Created by 张鹤 on 2017/4/20.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self initBaseView];
    
}

- (void) initBaseView{

    UITextField *phoneTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:phoneTextField];
    [phoneTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:100];
    [phoneTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [phoneTextField autoSetDimension:ALDimensionWidth toSize:ScreenWidth - 20];
    [phoneTextField autoSetDimension:ALDimensionHeight toSize:50];
    phoneTextField.placeholder = @"  邮箱/手机号";
    phoneTextField.backgroundColor = RGB(233, 233, 233);
    
    UITextField *codeTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:codeTextField];
    [codeTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:phoneTextField withOffset:20];
    [codeTextField autoSetDimension:ALDimensionWidth toSize:ScreenWidth - 20];
    [codeTextField autoSetDimension:ALDimensionHeight toSize:50];
    codeTextField.backgroundColor = RGB(233, 233, 233);
    codeTextField.placeholder = @"  请输入密码";
    
    UIButton *loginBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:loginBtn];
    [loginBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:codeTextField withOffset:20];
    [loginBtn autoSetDimension:ALDimensionWidth toSize:ScreenWidth - 20];
    [loginBtn autoSetDimension:ALDimensionHeight toSize:50];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    [loginBtn setBackgroundColor:RGB(160, 180, 195)];
    
    UIButton *registBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:registBtn];
    [registBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [registBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:30];
    [registBtn autoSetDimension:ALDimensionHeight toSize:40];
    [registBtn autoSetDimension:ALDimensionWidth toSize:100];
    [registBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:RGB(160, 180, 195) forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(jumpRegistVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *forgetBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:forgetBtn];
    [forgetBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-10];
    [forgetBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:30];
    [forgetBtn autoSetDimension:ALDimensionHeight toSize:40];
    [forgetBtn autoSetDimension:ALDimensionWidth toSize:100];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:RGB(160, 180, 195) forState:UIControlStateNormal];
    
}

- (void) jumpRegistVC{

    RegistViewController *registVC = [[RegistViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
    
}
@end

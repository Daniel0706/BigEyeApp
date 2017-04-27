//
//  RegistViewController.m
//  BigEye
//
//  Created by 张鹤 on 2017/4/23.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"


@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self initBaseView];
    
}
- (void) initBaseView{
    UITextField *phoneTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:phoneTextField];
    [phoneTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:100];
    [phoneTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [phoneTextField autoSetDimension:ALDimensionWidth toSize:ScreenWidth - 20];
    [phoneTextField autoSetDimension:ALDimensionHeight toSize:50];
    phoneTextField.placeholder = @" 请输入手机号";
    phoneTextField.backgroundColor = RGB(233, 233, 233);
    
    UITextField *codeTextField = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:codeTextField];
    [codeTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [codeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-150];
    [codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:phoneTextField withOffset:20];
    [codeTextField autoSetDimension:ALDimensionHeight toSize:50];
    codeTextField.backgroundColor = RGB(233, 233, 233);
    codeTextField.placeholder = @"  请输入验证码";
    
    UIButton    *codeBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:codeBtn];
    [codeBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:codeTextField withOffset:10];
    [codeBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:phoneTextField withOffset:20];
    [codeBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-10];
    [codeBtn autoSetDimension:ALDimensionHeight toSize:50];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeBtn setTitleColor:RGB(160, 180, 195) forState:UIControlStateNormal];
    codeBtn.layer.borderWidth = 0.5;
    codeBtn.layer.borderColor = RGB(160, 180, 195).CGColor;
    
    
    UIButton *nextBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:nextBtn];
    [nextBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:codeBtn withOffset:50];
    [nextBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [nextBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-10];
    [nextBtn autoSetDimension:ALDimensionHeight toSize:50];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.backgroundColor = RGB(160, 180, 195);
    
    UILabel *infoLabel = [[UILabel alloc] initForAutoLayout];
    [self.view addSubview:infoLabel];
    [infoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:(ScreenWidth- 150)/2];
    [infoLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:nextBtn withOffset:50];
    [infoLabel autoSetDimension:ALDimensionHeight toSize:30];
    [infoLabel autoSetDimension:ALDimensionWidth toSize:75];
    infoLabel.font = [UIFont systemFontOfSize:14];
    infoLabel.textColor = [UIColor blackColor];
    infoLabel.text = @"已有账号?";
    
    UIButton *loginBtn = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:loginBtn];
    [loginBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:infoLabel withOffset:0];
    [loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:nextBtn withOffset:50];
    [loginBtn autoSetDimension:ALDimensionHeight toSize:30];
    [loginBtn autoSetDimension:ALDimensionWidth toSize:75];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:RGB(0, 145, 255) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(jumpLoginVC) forControlEvents:UIControlEventTouchUpInside];
    

}
- (void) jumpLoginVC {

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}


@end

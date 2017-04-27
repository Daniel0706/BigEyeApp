//
//  MineViewController.m
//  BigEye
//
//  Created by 张鹤 on 2017/4/20.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"


@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    UIButton *registButton = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:registButton];
    [registButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:100];
    [registButton autoCenterInSuperviewAlongAxis:ALAxisVertical];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.titleLabel.textColor = RGB(150, 150, 150);
    [registButton addTarget:self action:@selector(jumpLoginVC) forControlEvents:UIControlEventTouchUpInside];
    registButton.backgroundColor = [UIColor redColor];
}

- (void)jumpLoginVC {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

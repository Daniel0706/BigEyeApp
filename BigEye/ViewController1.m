//
//  ViewController1.m
//  BigEye
//
//  Created by CR-IOS on 2017/4/8.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "ViewController1.h"
#import "SLEditingViewController.h"



@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *editVC = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:editVC];
    [editVC autoCenterInSuperviewAlongAxis:ALAxisVertical];
    [editVC autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
    [editVC autoSetDimension:ALDimensionHeight toSize:100];
    [editVC autoSetDimension:ALDimensionWidth toSize:100];
    [editVC addTarget:self action:@selector(jumpEditVC) forControlEvents:UIControlEventTouchUpInside];
    [editVC setTitle:@"编辑" forState:UIControlStateNormal];
    [editVC setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}
- (void) jumpEditVC {
    
    SLEditingViewController *editVC = [[SLEditingViewController alloc] init];
    [self.navigationController pushViewController:editVC animated:YES];
    
    
}


@end

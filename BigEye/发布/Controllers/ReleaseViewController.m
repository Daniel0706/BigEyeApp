//
//  ReleaseViewController.m
//  BigEye
//
//  Created by 张鹤 on 2017/4/27.
//  Copyright © 2017年 CR-IOS. All rights reserved.
//

#import "ReleaseViewController.h"

@interface ReleaseViewController ()

@end

@implementation ReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布";
    [self setBackBtn];
    
    
}
- (void)setBackBtn {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    UIImage *image = [UIImage imageNamed:@"icon_返回"];//Back_Arrow
    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 10)];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    /* leftBarButton设置 */
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:-10];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,left];
    
}

/* 返回按钮点击调用方法 */
- (void)backBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end

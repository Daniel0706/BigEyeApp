//
//  FeatureViewController.m
//  DXFZ1.0
//
//  Created by kaka on 16/3/23.
//  Copyright © 2016年 DXFZTeam. All rights reserved.
//

#import "FeatureViewController.h"
#import "MyTabbarViewController.h"
#import "UIView+AutoLayout.h"
#define FeartureCount  4
#define SCREENWIDTH self.view.frame.size.width
#define SCREENHEIGHT self.view.frame.size.height

@interface FeatureViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
    NSArray       *_launchImageArray;
}
@property (nonatomic,assign) BOOL  isFirstLaunch;

@end

@implementation FeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1，初始化一个scroll
    _launchImageArray = @[@"page1",@"page2",@"page3",@"page4"];
    CGFloat scrollW = self.view.frame.size.width;
    CGFloat scrollH = self.view.frame.size.height;
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, scrollW, scrollH)];
    
    scroll.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scroll];
    
    //2.初始化图片
    for (int i = 0; i < FeartureCount; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"page%d",i + 1]];
        imageView.frame = CGRectMake(scrollW * i , 0, scrollW, scrollH);
        
        [scroll addSubview:imageView];
        
        if (i == 3) {
            [self getLastImageView:imageView];
        }
    }
    
    //设置scroll 及pageControl的部分属性
    scroll.contentSize = CGSizeMake(scrollW * FeartureCount, 0);
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.pagingEnabled = YES;
    scroll.delegate = self;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(scrollW / 2.0, scrollH - 20, 100, 10)];
    _pageControl.numberOfPages = FeartureCount;
    _pageControl.pageIndicatorTintColor = RGB(223, 223, 223) ;
    _pageControl.currentPageIndicatorTintColor = RGB(83, 83, 83) ;
    [_pageControl setCenter:CGPointMake(scrollW / 2.0, scrollH - 20)];
    _pageControl.clipsToBounds = YES;
//    _pageControl.layer.borderColor = RGB(13, 161, 82).CGColor;
//    _pageControl.layer.borderWidth = 1;
    [self.view addSubview:_pageControl];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //方法1；直接偏移法
    //    int page =( scrollView.contentOffset.x + __ScreenW * 0.5) / __ScreenW;
    //    _pageControl.currentPage = page;
    //方法2；四舍五入法
    
    double page = scrollView.contentOffset.x / SCREENWIDTH;
    _pageControl.currentPage = (int)(page + 0.5);
    
}

- (void)getLastImageView:(UIImageView *)imageView;
{
    //打开父类图片的用户交互
    imageView.userInteractionEnabled = YES;

    //创立进入按钮
    UIButton *startButton = [[UIButton alloc]initForAutoLayout];
    [imageView addSubview:startButton];

    [startButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:imageView withOffset:-50];
    [startButton autoCenterInSuperviewAlongAxis:ALAxisVertical];
    [startButton autoSetDimension:ALDimensionWidth toSize:120];
    [startButton autoSetDimension:ALDimensionHeight toSize:30];
//    [startButton setImage:[UIImage imageNamed:@"立即体验按钮"] forState:UIControlStateNormal];
//    [startButton setImage:[UIImage imageNamed:@"立即体验按钮-按下"] forState:UIControlStateSelected];
    startButton.backgroundColor = [UIColor whiteColor];
    startButton.layer.cornerRadius = 4.0f;
    //设置按钮的大小和图片的一样大
   // startButton.size = startButton.currentBackgroundImage.size;
    //跳转页面到跟视图控制器
    [startButton addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)shareClick:(UIButton *)button
{
    button.selected = !button.isSelected;
}

- (void)startAction
{
//    获得window窗口记住是appdelegate下的可显示窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MyTabbarViewController alloc]init];
    

}


@end

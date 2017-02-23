//
//  ViewController.m
//  AutoFixedTheView
//
//  Created by 王少泽 on 17/2/21.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "ViewController.h"

#import "SZMainMenuScrollView.h"
@interface ViewController ()<UIScrollViewDelegate,SZMainScrollViewDelegate>

@end

@implementation ViewController
{
    SZMainMenuScrollView *mainScrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self lazyLoadMainScrollView];
}

- (void)lazyLoadMainScrollView
{
    if (!mainScrollView) {
        mainScrollView = [[SZMainMenuScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        mainScrollView.contentSize = CGSizeMake(0, 867);
        mainScrollView.delegate = self;
        mainScrollView.menuDelegate = self;
        [self.view addSubview:mainScrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSNumber *tag;
    NSLog(@"scrollY:%.2f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y >= 200) {
        tag = @1;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeScroll" object:tag];
    }
    else
    {
        tag = @2;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeScroll" object:tag];
    }
}
- (void)tryMainScrollToTop:(UIButton *)sender
{
    [UIView beginAnimations:@"scrollTopAnimation" context:nil];
    [UIView setAnimationDuration:0.3f];
    CGPoint point = CGPointMake(0, 0);
    [mainScrollView setContentOffset:point];
    [UIView commitAnimations];
}
//下滑到评论界面
- (void)tryToScrollComment:(UIButton *)sender
{
    [UIView beginAnimations:@"commentAnimation" context:nil];
    [UIView setAnimationDuration:0.4f];
    CGPoint point = CGPointMake(0, 200);
    [mainScrollView setContentOffset:point];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

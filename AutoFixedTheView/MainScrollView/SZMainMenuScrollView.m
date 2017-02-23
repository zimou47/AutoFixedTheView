//
//  SZMainMenuScrollView.m
//  AutoFixedTheView
//
//  Created by 王少泽 on 17/2/21.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "SZMainMenuScrollView.h"

#import "SZCommentView.h"
#import "SZShopShowView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface SZMainMenuScrollView ()<SZCommecntViewDelegate>


@end
@implementation SZMainMenuScrollView
{
    UIButton *quickButton;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
        [self createQuickScrollToTop];
        //接收监听controller层的ScrollView的Y值变化
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidenButton:) name:@"changeScroll" object:nil];
    }
    return self;
}

- (void)hidenButton:(NSNotification *)noti
{
    if ([noti.object integerValue] == 1) {
        quickButton.hidden = NO;
    }
    if ([noti.object integerValue] == 2) {
        quickButton.hidden = YES;
    }
}

- (void)loadSubViews
{
    //添加商品视图到主View上
    SZShopShowView *shopShow = [[SZShopShowView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [self addSubview:shopShow];
    //添加评论界面到主视图上
    SZCommentView *commentView = [[SZCommentView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 544)];
    commentView.delegate = self;
    [self addSubview:commentView];
}
//创建返回顶部的快捷按钮
- (void)createQuickScrollToTop
{
    quickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [quickButton setBackgroundImage:[UIImage imageNamed:@"上箭头"] forState:UIControlStateNormal];
    quickButton.frame = CGRectMake(WIDTH - 40, HEIGHT - 40, 20, 20);
    [quickButton addTarget:self action:@selector(quickScrollToTop:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:quickButton];
}
//传递按钮到Controller层
- (void)quickScrollToTop:(UIButton *)sender
{
    if ([self.menuDelegate respondsToSelector:@selector(tryMainScrollToTop:)]) {
        [self.menuDelegate tryMainScrollToTop:sender];
    }
}
//传递代理方法到Controller层
- (void)scrollToTopScroll:(UIButton *)sender
{
    if ([self.menuDelegate respondsToSelector:@selector(tryToScrollComment:)]) {
        [self.menuDelegate tryToScrollComment:sender];
    }
}

@end

//
//  SZCommentView.m
//  AutoFixedTheView
//
//  Created by 王少泽 on 17/2/21.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "SZCommentView.h"

@interface SZCommentView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation SZCommentView
{
    UITableView *_commentTable;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createCommentButton];
        [self createCommentTableView];
        //接收监听的滚动值变化
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollType:) name:@"changeScroll" object:nil];
    }
    return self;
}
//接收滚动事件
- (void)changeScrollType:(NSNotification *)noti
{
    if ([noti.object integerValue] == 1) {
        _commentTable.scrollEnabled = YES;
    }
    if ([noti.object integerValue] == 2) {
        _commentTable.scrollEnabled = NO;
    }
    
}

- (void)createCommentButton
{
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    [self addSubview:commentBtn];
    [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commentBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    [commentBtn addTarget:self action:@selector(scrollToTop:) forControlEvents:UIControlEventTouchUpInside];
}

//专递按钮的点击事件,来完成动画效果
- (void)scrollToTop:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(scrollToTopScroll:)]) {
        [self.delegate scrollToTopScroll:sender];
    }
}

- (void)createCommentTableView
{
    _commentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 500) style:UITableViewStylePlain];
    _commentTable.dataSource = self;
    _commentTable.delegate = self;
    _commentTable.scrollEnabled = NO;
    [self addSubview:_commentTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"哈哈哈";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 100;
}
//UITableview遵守UISCrollView协议
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y == 0 ) {
        _commentTable.scrollEnabled = NO;
    }
}
@end

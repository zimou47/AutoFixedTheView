//
//  SZMainMenuScrollView.h
//  AutoFixedTheView
//
//  Created by 王少泽 on 17/2/21.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZMainMenuScrollView;
@protocol SZMainScrollViewDelegate <NSObject>

//传递方法,让评论视图完整的滚动到顶部
- (void)tryToScrollComment:(UIButton *)sender;
//传递方法,让用户可以直接从底部回到顶层视图
- (void)tryMainScrollToTop:(UIButton *)sender;

@end
@interface SZMainMenuScrollView : UIScrollView

@property (nonatomic,weak)id<SZMainScrollViewDelegate> menuDelegate;

@end

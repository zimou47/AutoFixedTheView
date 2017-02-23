//
//  SZCommentView.h
//  AutoFixedTheView
//
//  Created by 王少泽 on 17/2/21.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZCommentView;
@protocol SZCommecntViewDelegate <NSObject>

- (void)scrollToTopScroll:(UIButton *)sender;

@end
@interface SZCommentView : UIView

@property (nonatomic,weak)id<SZCommecntViewDelegate> delegate;

@end

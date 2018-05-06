//
//  YZFActionEmptyView.h
//  PSEmptyView
//
//  Created by Pan on 2017/5/19.
//  Copyright © 2017年 PPPan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZFActionEmptyView;

@protocol YZFActionEmptyViewDelegate <NSObject>

- (void)emptyView:(YZFActionEmptyView *)emptyView didTouchActionButton:(UIButton *)button;

@end

@interface YZFActionEmptyView : UIView

@property (nonatomic, weak) id<YZFActionEmptyViewDelegate> delegate;

@end

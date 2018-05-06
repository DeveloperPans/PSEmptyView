//
//  YZFActionEmptyView.m
//  PSEmptyView
//
//  Created by Pan on 2017/5/19.
//  Copyright © 2017年 PPPan. All rights reserved.
//

#import "YZFActionEmptyView.h"



@implementation YZFActionEmptyView

- (IBAction)touchActionButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(emptyView:didTouchActionButton:)]) {
        [self.delegate emptyView:self didTouchActionButton:sender];
    }
}

@end

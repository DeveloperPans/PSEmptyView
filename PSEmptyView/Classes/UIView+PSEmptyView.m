//
//  UIView+PSEmptyView.m
//  PSEmptyView
//
//  Created by Pan on 2017/5/19.
//  Copyright © 2017年 PPPan. All rights reserved.
//

#import "UIView+PSEmptyView.h"
#import <objc/runtime.h>

@implementation UIView (PSEmptyView)

- (void)ps_showEmptyViewIfNeeded {
    if (!self.ps_emptyView) {
        return;
    }
    NSInteger dataCount = [self ps_totalDataCount];
    self.ps_emptyView.hidden = dataCount > 0;
    self.ps_emptyView.frame = CGRectMake(0,
                                         0,
                                         CGRectGetWidth(self.frame),
                                         CGRectGetHeight(self.frame));
}


#pragma mark - Private

- (NSInteger)ps_totalDataCount
{
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        
        for (NSInteger section = 0; section<tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        
        for (NSInteger section = 0; section<collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}


#pragma mark - Getter && Setter

- (UIView *)ps_emptyView {
    return objc_getAssociatedObject(self, @selector(ps_emptyView));
}

- (void)setPs_emptyView:(UIView *)ps_emptyView {
    [self.ps_emptyView removeFromSuperview];
    [self insertSubview:ps_emptyView atIndex:0];
    [self willChangeValueForKey:NSStringFromSelector(@selector(ps_emptyView))]; // for support KVO
    objc_setAssociatedObject(self, @selector(ps_emptyView), ps_emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(ps_emptyView))]; // for support KVO
}

@end

@implementation UITableView (YZEmptyView)


+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(layoutSubviews)),
                                   class_getInstanceMethod(self, @selector(ps_layoutSubviews)));
}

- (void)ps_layoutSubviews {
    [self ps_layoutSubviews];
    [self ps_showEmptyViewIfNeeded];
}


@end

@implementation UICollectionView (YZEmptyView)


+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(layoutSubviews)),
                                   class_getInstanceMethod(self, @selector(ps_layoutSubviews)));
}

- (void)ps_layoutSubviews {
    [self ps_layoutSubviews];
    [self ps_showEmptyViewIfNeeded];
}

@end


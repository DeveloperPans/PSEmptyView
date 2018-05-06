//
//  UIView+PSEmptyView.h
//  PSEmptyView
//
//  Created by Pan on 2017/5/19.
//  Copyright © 2017年 PPPan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PSEmptyView)

/**
 The view will be display when there is non any data-dependence view in UIScrollView.
 It will hide automaticlly when data source has been filled.
 
 The frame of ps_emptyView is same as the host View，you should arrange your empty view correctly.
 
 For now, it's support UITableView and UICollectionView.
 */
@property (nonatomic, strong) UIView *ps_emptyView UI_APPEARANCE_SELECTOR;

@end

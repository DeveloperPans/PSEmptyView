//
//  PSAppDelegate.m
//  PSEmptyView
//
//  Created by DeveloperPans on 05/06/2018.
//  Copyright (c) 2018 DeveloperPans. All rights reserved.
//

#import "PSAppDelegate.h"
@import PSEmptyView;

@implementation PSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // just one line, set all table view's empty view.
    [UITableView appearance].ps_emptyView = [[[NSBundle mainBundle] loadNibNamed:@"YZFCommonEmptyView" owner:nil options:nil]
                                             firstObject];
    return YES;
}


@end

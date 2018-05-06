//
//  PSViewController.m
//  PSEmptyView
//
//  Created by DeveloperPans on 05/06/2018.
//  Copyright (c) 2018 DeveloperPans. All rights reserved.
//

#import "PSViewController.h"
#import "YZFActionEmptyView.h"

@import PSEmptyView;

@interface PSViewController () <UITableViewDelegate, UITableViewDataSource, YZFActionEmptyViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *dataSource;


@end

@implementation PSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YZFActionEmptyView *emptyView = [[[NSBundle mainBundle] loadNibNamed:@"YZFActionEmptyView"
                                                                   owner:nil options:nil]
                                     firstObject];
    emptyView.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.ps_emptyView = emptyView;
    
}

- (void)emptyView:(YZFActionEmptyView *)emptyView didTouchActionButton:(UIButton *)button {
    
    [self.dataSource addObject:@"新数据来了"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])
                                                            forIndexPath:indexPath];
    NSString *title = self.dataSource[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (IBAction)touchClearButton:(id)sender {
    [self.dataSource removeAllObjects];
    [self.tableView reloadData];
}

- (IBAction)touchAddButton:(id)sender {
    [self.dataSource addObject:@"这是一条数据"];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataSource.count - 1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (NSMutableArray<NSString *> *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray<NSString *> alloc] init];
    }
    return _dataSource;
}

@end

//
//  XCViewController2.m
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCViewController2.h"
#import "XCNetWork.h"
#import "XCDataSource.h"
#import "XCTableViewCell.h"
#import "XCTableViewCell+Layout.h"

static NSString* const cellStr = @"cell2";

@interface XCViewController2 ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) XCDataSource *dataSource;

@end

@implementation XCViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //对薄MVC进行去薄，形成更轻量级的ViewController（原理：将DataSource从C中抽离出来）
    [self.view addSubview:self.myTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //FIXME: 这里做网络请求
    [[XCNetWork shareGlobalUrl] getUserInfoComplation:^(__kindof NSArray *modelArray) {
        [self setUpTableViewWithArray:modelArray];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setter And Getter
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.rowHeight = 40;
    }
    return _myTableView;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击的cell 为第%ld区，第%ld行",(long)indexPath.section,(long)indexPath.row);
}

#pragma mark - Private
- (void)setUpTableViewWithArray:(NSArray *)modelArray {
    
    TableViewCellConfig cellConfig = ^(XCTableViewCell *cell, XCModel *model){
        [cell layoutViewsWithModel:model];
        cell.buttonClick = ^{
            NSLog(@"点击了");
        };
    };
    
    self.dataSource = [[XCDataSource alloc] initWithItems:modelArray
                                           withIdentifier:cellStr
                                      withCellConfigBlock:cellConfig];
    _myTableView.dataSource = self.dataSource;
}

@end

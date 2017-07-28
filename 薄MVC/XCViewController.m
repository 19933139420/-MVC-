//
//  XCViewController.m
//  薄MVC
//
//  Created by superMan on 2017/7/27.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCViewController.h"
#import "XCNetWork.h"
#import "XCTableViewCell.h"
#import "XCTableViewCell+Layout.h"

static NSString* const cellStr = @"cell";

@interface XCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) NSArray <XCModel *>*items;
@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation XCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//FIXME: 这里做网络请求
    [[XCNetWork shareGlobalUrl] getUserInfoComplation:^(__kindof NSArray *modelArray) {
        _items = modelArray;
        [_myTableView reloadData];
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
        _myTableView.dataSource = self;
        _myTableView.rowHeight = 40;
    }
    return _myTableView;
}

#pragma mark - UITableViewDelegate And DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[XCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    //[cell layoutViewsWithModel:_items[indexPath.row]];这句话的作用等同于setModel，我是为了区分界面和赋值才将这个类单独抽出来做了一个Layout，只是为了更好的管理代码
    [cell layoutViewsWithModel:_items[indexPath.row]];
    
    cell.buttonClick = ^{
        //按钮点击了
        NSLog(@"按钮点击了");
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击的cell 为第%ld区，第%ld行",(long)indexPath.section,(long)indexPath.row);
}

@end

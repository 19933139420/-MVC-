//
//  ViewController.m
//  薄MVC
//
//  Created by superMan on 2017/7/27.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray *_infoArray;
}

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /****
     我们知道MVC的方式会使C中的代码量异常的大，而我在项目中平时用的也是这种，无论逻辑，交互，还是网络请求全部都放到了C中，这无疑使C中的代码阅读困难，而如果界面逻辑稍微复杂的情况下，一个C中有一千行代码也不会让人大惊小怪（本人实际项目中C的代码有6000多行）这无疑使开发的人经常找不到关键代码，而且也让单元测试变得举步维艰，也为合作的人带来不便。而这种厚重的MVC方式，被称为“厚MVC”。那么有厚自然就有薄，薄MVC的概念就是将厚重的MVC中的代码更合理的抽离，网络请求放到M中，但是这样也会有一点，就是M生命周期的问题。而今天的MVC则是更加轻量级的MVC，是在薄MVC的基础上对C进行削薄。
     XCViewController:薄MVC
     XCViewController2:薄MVC削薄
     ***/
    
    _infoArray = @[@{@"text":@"XCViewController",@"placeholder":@"重点看代码,重点看代码,重点看代码,重要的事说三遍"},@{@"text":@"XCViewController2",@"placeholder":@"重点看代码,重点看代码,重点看代码,重要的事说三遍"}];
    
    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"title"];
    cell.textLabel.text = _infoArray[indexPath.row][@"text"];
    cell.detailTextLabel.text = _infoArray[indexPath.row][@"placeholder"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _infoArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[NSClassFromString(_infoArray[indexPath.row][@"text"]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end

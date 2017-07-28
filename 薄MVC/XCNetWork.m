//
//  XCNetWork.m
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCNetWork.h"
#import "XCModel.h"

@implementation XCNetWork

XCNetWork *netWork = nil;
+ (instancetype)shareGlobalUrl {
    return [[super alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (netWork == nil) {
            netWork = [super allocWithZone:zone];
        }
    });
    return netWork;
}

- (void)getUserInfoComplation:(void (^)(__kindof NSArray *))complation {
    //正常来说这里写网络请求，但是由于是模拟所以自己写的数据
    _modelArray = [NSMutableArray new];
    for (NSInteger i = 0; i < 100; i++) {
        XCModel *model = [XCModel new];
        NSString *nameStr = (i % 3 == 1) ? @"张三" : (i % 3 == 2) ? @"李四" : @"王五";
        model.name = nameStr;
        model.studentId = i;
        model.age = [NSString stringWithFormat:@"%d岁",arc4random()%10 + 20];
        [_modelArray addObject:model];
    }
    complation(_modelArray);
}

@end

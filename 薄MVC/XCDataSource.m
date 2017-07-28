//
//  XCDataSource.m
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCDataSource.h"

@interface XCDataSource ()

@property (nonatomic, retain) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfig configCellBlock;

@property (nonatomic, retain) NSArray *typeArray;

@end

@implementation XCDataSource

- (id)init {
    return nil;
}

- (NSArray *)typeArray {
    if (!_typeArray) {
        _typeArray = @[@"XCTableViewCell"];
    }
    return _typeArray;
}

- (id)initWithItems:(NSArray *)items withIdentifier:(NSString *)identifier withCellConfigBlock:(TableViewCellConfig)cellConfigBlock
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = identifier;
        self.configCellBlock = [cellConfigBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        cell = [[NSClassFromString(self.typeArray[0]) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    id item = [self itemAtIndexPath:indexPath];
    self.configCellBlock(cell, item);
    return cell;
}


@end

//
//  XCDataSource.h
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfig)(id cell, id item);

@interface XCDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)items
     withIdentifier:(NSString *)identifier
withCellConfigBlock:(TableViewCellConfig)cellConfigBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

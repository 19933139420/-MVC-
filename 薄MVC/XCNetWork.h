//
//  XCNetWork.h
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCNetWork : NSObject

@property (nonatomic, retain) NSMutableArray *modelArray;

+ (instancetype)shareGlobalUrl;

- (void)getUserInfoComplation:(void(^)(__kindof NSArray *modelArray))complation;

@end

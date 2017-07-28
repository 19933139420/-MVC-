//
//  XCTableViewCell.h
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *studentIdLabel;
@property (nonatomic, strong) UIButton *goNextViewControllerButton;

@property (nonatomic, copy) void(^buttonClick)();


@end

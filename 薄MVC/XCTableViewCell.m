//
//  XCTableViewCell.m
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCTableViewCell.h"

@interface XCTableViewCell ()


@end

@implementation XCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.ageLabel];
        [self.contentView addSubview:self.studentIdLabel];
        [self.contentView addSubview:self.goNextViewControllerButton];
    }
    return self;
}

#pragma mark -- Lazzy Loading
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:20.f];
        _nameLabel.textColor = [UIColor grayColor];
    }
    return _nameLabel;
}

- (UILabel *)ageLabel {
    if (!_ageLabel) {
        _ageLabel = [UILabel new];
        _ageLabel.font = [UIFont systemFontOfSize:20.f];
        _ageLabel.textColor = [UIColor redColor];
    }
    return _ageLabel;
}

- (UILabel *)studentIdLabel {
    if (!_studentIdLabel) {
        _studentIdLabel = [UILabel new];
        _studentIdLabel.textColor = [UIColor blueColor];
        _studentIdLabel.font = [UIFont systemFontOfSize:20.f];
    }
    return _studentIdLabel;
}

- (UIButton *)goNextViewControllerButton {
    if (!_goNextViewControllerButton) {
        _goNextViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goNextViewControllerButton addTarget:self
                                        action:@selector(goNextViewController:) forControlEvents:UIControlEventTouchUpInside];
        _goNextViewControllerButton.backgroundColor = [UIColor grayColor];
        [_goNextViewControllerButton setTitle:@"点击" forState:UIControlStateNormal];
        [_goNextViewControllerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _goNextViewControllerButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    return _goNextViewControllerButton;
}

- (void)goNextViewController:(UIButton *)button {
    if (self.buttonClick) {
        _buttonClick();
    }
}

@end

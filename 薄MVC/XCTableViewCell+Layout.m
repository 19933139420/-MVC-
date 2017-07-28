//
//  XCTableViewCell+Layout.m
//  薄MVC
//
//  Created by superMan on 2017/7/28.
//  Copyright © 2017年 徐学超. All rights reserved.
//

#import "XCTableViewCell+Layout.h"

@implementation XCTableViewCell (Layout)

- (void)layoutViewsWithModel:(XCModel *)model {
    //正常来说 这里是用masonry布局
    self.nameLabel.frame = CGRectMake(0, 0, 80, 40);
    self.ageLabel.frame = CGRectMake(80, 0, 80, 40);
    self.studentIdLabel.frame = CGRectMake(160, 0, 80, 40);
    self.goNextViewControllerButton.frame = CGRectMake(240, 0, 80, 40);
    
    //赋值
    self.nameLabel.text = model.name;
    self.ageLabel.text = model.age;
    self.studentIdLabel.text = [NSString stringWithFormat:@"%ld",(long)model.studentId];
}

@end


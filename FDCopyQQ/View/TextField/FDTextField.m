//
//  FDTextField.m
//  FDCopyQQ
//
//  Created by fergusding on 15/7/24.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDTextField.h"

@implementation FDTextField

- (void)awakeFromNib {
    // left view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end

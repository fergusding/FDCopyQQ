//
//  LeftTableViewCell.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/22.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDLeftTableViewCell.h"

@interface FDLeftTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FDLeftTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Custom Accessors

- (void)setImage:(UIImage *)image {
    _image = image;
    self.iconImageView.image = image;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end

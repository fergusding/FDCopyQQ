//
//  UIColor+Hex.h
//  FDCopyQQ
//
//  Created by fergusding on 07/24/15.
//  Copyright (c) 2015 com.fergus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString AndAlpha:(CGFloat)alpha;

@end

//
//  UIColor+Hex.m
//  FDCopyQQ
//
//  Created by fergusding on 07/24/15.
//  Copyright (c) 2015 com.fergus. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [UIColor colorWithHexString:hexString AndAlpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString AndAlpha:(CGFloat)alpha {
    hexString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (hexString.length < 6) {
        NSLog(@"Wrong color hex string!");
        return [UIColor clearColor];
    }
    
    if ([hexString hasPrefix:@"0X"] || [hexString hasPrefix:@"0x"]) {
        hexString = [hexString substringFromIndex:2];
    }
    
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    if (hexString.length != 6) {
        NSLog(@"Wrong color hex string!");
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.length = 2;
    range.location = 0;
    NSString *colorRString = [hexString substringWithRange:range];
    range.location = 2;
    NSString *colorGString = [hexString substringWithRange:range];
    range.location = 4;
    NSString *colorBString = [hexString substringWithRange:range];
    
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:colorRString] scanHexInt:&red];
    if (red > 255) {
        return  [UIColor clearColor];
    }
    [[NSScanner scannerWithString:colorGString] scanHexInt:&green];
    if (green > 255) {
        return  [UIColor clearColor];
    }
    [[NSScanner scannerWithString:colorBString] scanHexInt:&blue];
    if (blue > 255) {
        return  [UIColor clearColor];
    }
    
    if (alpha > 1) {
        alpha = 1;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    
    UIColor *color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
    return color;
}

@end

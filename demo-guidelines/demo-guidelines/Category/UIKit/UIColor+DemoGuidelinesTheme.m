//
//  UIColor+DemoGuidelinesTheme.m
//  demo-guidelines
//
//  Created by Jens Goeman on 03/12/13.
//  Copyright (c) 2013 iDA-MediaFoundry. All rights reserved.
//

#import "UIColor+DemoGuidelinesTheme.h"

@implementation UIColor (DemoGuidelinesTheme)

+ (UIColor *)idaRedColor {
    static UIColor *color = nil;
    if (!color) color = [UIColor colorWithRed:238.0/255 green:28.0/255 blue:37.0/255 alpha:1.0];
    return color;
}

+ (UIColor *)idaRedColorWithAlpha:(CGFloat)alpha {
    static UIColor *color = nil;
    if (!color) color = [[UIColor idaRedColor] colorWithAlphaComponent:alpha];
    return color;
}

+ (UIColor *)idaBlackColor {
    static UIColor *color = nil;
    if (!color) color = [UIColor colorWithRed:34.0/255 green:34.0/255 blue:34.0/255 alpha:1.0];
    return color;
}

+ (UIColor *)idaBlackColorWithAlpha:(CGFloat)alpha {
    static UIColor *color = nil;
    if (!color) color = [[UIColor idaBlackColor] colorWithAlphaComponent:alpha];
    return color;
}

+ (UIColor *)idaDarkGrayColor {
    static UIColor *color = nil;
    if (!color) color = [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1.0];
    return color;
}

+ (UIColor *)idaDarkGrayWithAlpha:(CGFloat)alpha {
    static UIColor *color = nil;
    if (!color) color = [[UIColor idaDarkGrayColor] colorWithAlphaComponent:alpha];
    return color;
}

@end

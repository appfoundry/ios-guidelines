//
// Created by Jens Goeman on 03/12/13.
// Copyright (c) 2013 iDA-MediaFoundry. All rights reserved.
//


#import "UIFont+DemoGuidelinesTheme.h"

@implementation UIFont (DemoGuidelinesTheme)

+ (UIFont *)istokRegularWithSize:(CGFloat)size {
    static UIFont *font = nil;
    if (!font) font = [UIFont fontWithName:@"Istok-Regular" size:size];
    return font;
}

+ (UIFont *)istokBoldWithSize:(CGFloat)size {
    static UIFont *font = nil;
    if (!font) font = [UIFont fontWithName:@"Istok-Bold" size:size];
    return font;
}

+ (UIFont *)istokItalicWithSize:(CGFloat)size {
    static UIFont *font = nil;
    if (!font) font = [UIFont fontWithName:@"Istok-Italic" size:size];
    return font;
}

+ (UIFont *)istokBoldItalicWithSize:(CGFloat)size {
    static UIFont *font = nil;
    if (!font) font = [UIFont fontWithName:@"Istok-BoldItalic" size:size];
    return font;
}

@end
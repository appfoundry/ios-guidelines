//
//  HomeView.m
//  demo-guidelines
//
//  Created by Jens Goeman on 03/12/13.
//  Copyright (c) 2013 iDA-MediaFoundry. All rights reserved.
//

#import "HomeView.h"
#import "UIColor+DemoGuidelinesTheme.h"
#import "UIFont+DemoGuidelinesTheme.h"

#define MARGIN_BETWEEN_VIEWS 0.0

@interface HomeView () {
    UILabel *_titleLabel;
    UILabel *_subLabel;
}

@end

@implementation HomeView

#pragma mark - Object life cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupHomeView];
    }
    return self;
}

- (void)_setupHomeView {
    self.backgroundColor = [UIColor whiteColor];
    [self _configureTitleLabel];
    [self _configureSubLabel];
}


#pragma mark - View life cycle

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = [self _rectForCompanyLabel];
    _subLabel.frame = [self _rectForSubLabel];
}


#pragma mark - View configuration
- (void)_configureTitleLabel {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor idaRedColor];
    _titleLabel.font = [UIFont istokBoldWithSize:26.0];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.frame = [self _rectForCompanyLabel];
    _titleLabel.text = @"iDA-MediaFoundry";
    [self addSubview:_titleLabel];
}

- (CGRect)_rectForCompanyLabel {
    return CGRectMake(0.0, self.bounds.size.height/4, self.bounds.size.width, _titleLabel.font.lineHeight);
}

- (void)_configureSubLabel {
    _subLabel = [[UILabel alloc] init];
    _subLabel.backgroundColor = [UIColor clearColor];
    _subLabel.textColor = [UIColor idaDarkGrayColor];
    _subLabel.font = [UIFont istokRegularWithSize:14.0];
    _subLabel.textAlignment = NSTextAlignmentCenter;
    _subLabel.frame = [self _rectForSubLabel];
    _subLabel.text = @"iOS Coding Guidelines";
    [self addSubview:_subLabel];
}

- (CGRect)_rectForSubLabel {
    return CGRectMake(0.0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + MARGIN_BETWEEN_VIEWS , self.bounds.size.width, _titleLabel.font.lineHeight);
}

@end

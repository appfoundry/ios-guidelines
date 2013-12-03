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

@interface HomeView () {
    UILabel *_companyLabel;
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
    [self _configureCompanyLabel];
}

#pragma mark - View life cycle

- (void)layoutSubviews {
    [super layoutSubviews];
    _companyLabel.frame = [self _rectForCompanyLabel];
}


#pragma mark - View configuration
- (void)_configureCompanyLabel {
    _companyLabel = [[UILabel alloc] init];
    _companyLabel.backgroundColor = [UIColor clearColor];
    _companyLabel.textColor = [UIColor idaRedColor];
    _companyLabel.font = [UIFont istokBoldWithSize:26.0];
    _companyLabel.textAlignment = NSTextAlignmentCenter;
    _companyLabel.frame = [self _rectForCompanyLabel];
    _companyLabel.text = @"iDA-MediaFoundry";
    [self addSubview:_companyLabel];
}

- (CGRect)_rectForCompanyLabel {
    return CGRectMake(0.0, self.bounds.size.height/4, self.bounds.size.width, _companyLabel.font.lineHeight);
}

@end

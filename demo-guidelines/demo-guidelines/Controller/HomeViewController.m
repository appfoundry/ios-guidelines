//
//  HomeViewController.m
//  demo-guidelines
//
//  Created by Jens Goeman on 03/12/13.
//  Copyright (c) 2013 iDA-MediaFoundry. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController () {
    HomeView *_homeView;
}

@end

@implementation HomeViewController

#pragma mark - Object life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _setupHomeViewController];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _setupHomeViewController];
}

- (void)_setupHomeViewController {
    self.title = NSLocalizedString(@"home_title", @"This title will show up in the top bar of the home screen");
}

#pragma mark - View life cycle
- (void)loadView {
    _homeView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _homeView;
}

@end

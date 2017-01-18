//
//  SSIAlertController.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/15/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIAlertController.h"
#import "PureLayout.h"

@interface SSIAlertViewControllerAbstract ()

@property (strong, nonatomic) NSString *message;
@property (assign, nonatomic) NSInteger style;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic, readwrite) NSArray<SSIAlertAction *> *actions;
@property (strong, nonatomic) UIView *customView;

- (void)layoutConstraints;

@end

@implementation SSIAlertController

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message style:(SSIAlertViewControllerStyle)style {
    SSIAlertController *instance = [SSIAlertController new];
    [instance setTitle:title];
    [instance setMessage:message];
    [instance setStyle:style];
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [super layoutConstraints];    
}

- (void)layoutConstraints {
    [super layoutConstraints];
}

- (void)setCustomView:(UIView *)customView {
    [super setCustomView:customView];
}

@end

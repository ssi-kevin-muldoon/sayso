//
//  SSIAlertViewControllerAbstract.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/11/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

//#import <SSICoreLib/SSICoreLib.h>

#import "SSIAlertViewControllerAbstract.h"
#import "SSILionTransitioningProxy.h"
#import "SSITigerTransitioningProxy.h"
#import "PureLayout.h"

static NSString *SSIAlertActionButtonStyleDefaultImage = @"alertActionButtonStyleDefaultImage";
static NSString *SSIAlertActionButtonStyleInfoImage = @"alertActionButtonStyleInfoImage";
static NSString *SSIAlertActionButtonStyleWarningImage = @"alertActionButtonStyleWarningImage";
static NSString *SSIAlertActionButtonStyleCancelImage = @"alertActionButtonStyleCancelImage";

static CGFloat SSIAlertViewControllerContentViewWidth = 280.0f;

static NSString *SSIAlertViewControllerTitleFont = @"HelveticaNeue-Bold";
static CGFloat SSIAlertViewControllerTitleFontSize = 20.0f;

static NSString *SSIAlertViewControllerMessageFont = @"HelveticaNeue-Light";
static CGFloat SSIAlertViewControllerMessageFontSize = 14.0f;

static NSString *SSIAlertActionButtonTitleLabelFont = @"HelveticaNeue";
static CGFloat SSIAlertActionButtonTitleLabelFontSize = 17.0f;

static CGFloat SSIAlertActionButtonHeight = 44.0f;
static CGFloat SSIAlertActionButtonInset = 0.0f;

@interface SSIAlertViewControllerAbstract ()

@property (strong, nonatomic, readwrite) NSArray<SSIAlertAction *> *actions;
@property (strong, nonatomic) NSString *message;
@property (assign, nonatomic) NSInteger style;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;
@end

@implementation SSIAlertViewControllerAbstract

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTransitioningProxy:[SSILionTransitioningProxy new]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.messageLabel];
}

- (void)layoutConstraints {
    
    [self.contentView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [self.contentView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
    [self.contentView autoSetDimension:ALDimensionWidth toSize:SSIAlertViewControllerContentViewWidth];
    
    [NSLayoutConstraint autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
        [self.titleLabel autoSetContentHuggingPriorityForAxis:ALAxisVertical];}];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:33.0f];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:33.0f];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18.0f];
    
    [NSLayoutConstraint autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
        [self.messageLabel autoSetContentHuggingPriorityForAxis:ALAxisVertical];}];
    [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:33.0f];
    [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:33.0f];
    [self.messageLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:((self.message) ? 8.0f : 10.0f)];
    
    UIView *spacer = [UIView newAutoLayoutView];
    [self.contentView addSubview:spacer];
    [spacer autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0f];
    [spacer autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0f];
    [spacer autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.messageLabel withOffset:18.0f];
    
    UIButton *previousButton;
    for (int i = 0; i < self.actions.count; i++) {
        
        SSIAlertAction *action = self.actions[i];
        UIButton *button = [SSIAlertViewControllerAbstract buttonWithAction:action target:self];
        [button setTag:i];
        [self.contentView addSubview:button];
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
            [button autoSetContentHuggingPriorityForAxis:ALAxisVertical];}];
        
        if (!previousButton) {
            [button autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spacer withOffset:0.0f];
        } else {
            [button autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:previousButton withOffset:0.0f];
        }
        
        [button autoSetDimension:ALDimensionHeight toSize:SSIAlertActionButtonHeight];
        [button autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:SSIAlertActionButtonInset];
        [button autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:SSIAlertActionButtonInset];
        
        previousButton = button;
    }
    
    [previousButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:SSIAlertActionButtonInset];
    
}

- (void)dealloc {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)addAction:(SSIAlertAction *)action {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.actions];
    [array addObject:action];
    self.actions = [[NSArray alloc] initWithArray:array];
    
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView newAutoLayoutView];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        [_contentView.layer setCornerRadius:8.0f];
        [_contentView.layer setShadowColor:[UIColor blackColor].CGColor];
        [_contentView.layer setShadowOpacity:0.8];
        [_contentView.layer setShadowRadius:4.0];
        [_contentView.layer setShadowOffset:CGSizeMake(4.0f, 4.0f)];
        [_contentView setClipsToBounds:YES];
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        [_titleLabel setNumberOfLines:0];
        [_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_titleLabel setText:self.title];
        [_titleLabel setTextColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f]];
        if (self.message) {
            [_titleLabel setFont:[UIFont fontWithName:SSIAlertViewControllerTitleFont size:SSIAlertViewControllerTitleFontSize]];
        } else {
            [_titleLabel setFont:[UIFont fontWithName:SSIAlertViewControllerMessageFont size:SSIAlertViewControllerMessageFontSize]];
        }
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel newAutoLayoutView];
        [_messageLabel setNumberOfLines:0];
        [_messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_messageLabel setText:self.message];
        [_messageLabel setTextColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f]];
        [_messageLabel setFont:[UIFont fontWithName:SSIAlertViewControllerMessageFont size:SSIAlertViewControllerMessageFontSize]];
        [_messageLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _messageLabel;
}

- (void)buttonAction:(UIButton *)sender {
    
    SSIAlertAction *action = self.actions[sender.tag];
    if (action.handler) action.handler();
    
}

- (void)setTransitioningProxy:(id<UIViewControllerTransitioningDelegate> )transitioningProxy {
    _transitioningProxy = transitioningProxy;
    [self setTransitioningDelegate:transitioningProxy];
    [self setModalPresentationStyle:UIModalPresentationCustom];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.presentingViewController.preferredStatusBarStyle;
}


+ (UIButton *)buttonWithAction:(SSIAlertAction *)action target:(id)target {
    
    UIButton *button = [UIButton newAutoLayoutView];
    [button setTitle:action.title forState:UIControlStateNormal];
    
    NSString *imageName;
    switch (action.style) {
        case SSIAlertActionButtonStyleDefault:
            imageName = SSIAlertActionButtonStyleDefaultImage;
            break;
            
        case SSIAlertActionButtonStyleInfo:
            imageName = SSIAlertActionButtonStyleInfoImage;
            
            break;
            
        case SSIAlertActionButtonStyleWarning:
            imageName = SSIAlertActionButtonStyleWarningImage;
            
            break;
            
        case SSIAlertActionButtonStyleCancel:
            imageName = SSIAlertActionButtonStyleCancelImage;
            
            break;
    }
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button.titleLabel setFont:[UIFont fontWithName:SSIAlertActionButtonTitleLabelFont size:SSIAlertActionButtonTitleLabelFontSize]];
    return button;
}

@end

@interface SSIAlertAction ()
@property (strong, nonatomic, readwrite) NSString *title;
@property (assign, nonatomic, readwrite) SSIAlertActionButtonStyle style;
@property (nonatomic, copy, readwrite) SSIAlertActionHandler handler;
@end

@implementation SSIAlertAction

+ (instancetype)title:(NSString *)title style:(SSIAlertActionButtonStyle)style handler:(void (^)(void))handler {
    SSIAlertAction *instance = [SSIAlertAction new];
    instance.title = title;
    instance.handler = handler;
    instance.style = style;
    return instance;
}

@end

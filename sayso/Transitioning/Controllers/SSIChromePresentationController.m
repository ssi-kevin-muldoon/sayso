//
//  SSIChromePresentationController.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/9/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIChromePresentationController.h"

static const CGFloat kChromeAlphaPresentationTransitionBegin = 0.0f;
static const CGFloat kChromeAlphaPresentationTransitionEnd = 0.618f;

@interface SSIChromePresentationController ()
@property (strong, nonatomic) UIView *chromeView;
@end

@implementation SSIChromePresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController {
    self = [super initWithPresentedViewController:presentedViewController
                         presentingViewController:presentingViewController];
    if (self) {
        [self chromeView];
    }
    return self;
}

- (CGRect)frameOfPresentedViewInContainerView {
    
    CGRect containerBounds = self.containerView.frame;
    return containerBounds;
}

- (void)presentationTransitionWillBegin {

    [self.containerView addSubview:self.chromeView];

    id <UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        [self.chromeView setAlpha:kChromeAlphaPresentationTransitionEnd];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        //code
    }];
}

- (void)dismissalTransitionWillBegin {
    
    id <UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.chromeView.alpha = kChromeAlphaPresentationTransitionBegin;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {

    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    if (!completed) {
        [self.chromeView removeFromSuperview];
    }
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    [self.chromeView setFrame:self.containerView.frame];
    [self.presentedView setFrame:self.containerView.frame];

}

#pragma mark - Getter methods

- (UIView *)chromeView {
    if (!_chromeView) {
        _chromeView = [UIView new];
        [_chromeView setBackgroundColor:[UIColor blackColor]];
        [_chromeView setAlpha:kChromeAlphaPresentationTransitionBegin];
    }
    return _chromeView;
}

@end

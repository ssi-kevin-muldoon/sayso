//
//  SSIFadePresentAnimatedTransitioning.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/12/15.
//  Copyright (c) 2015 Survey Sampling International. All rights reserved.
//

#import "SSIFadePresentAnimatedTransitioning.h"

@implementation SSIFadePresentAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioningDelegate Methods

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *view = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    [containerView addSubview:view];
    view.frame = containerView.frame;
    view.alpha = 0.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         view.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end

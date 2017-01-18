//
//  SSIFadeDismissAnimatedTransitioning.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/12/15.
//  Copyright (c) 2015 Survey Sampling International. All rights reserved.
//

#import "SSIFadeDismissAnimatedTransitioning.h"

@implementation SSIFadeDismissAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioningDelegate Methods

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromView.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end

//
//  SSIPopUpDismissAnimatedTransitioning.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/12/15.
//  Copyright (c) 2015 Survey Sampling International. All rights reserved.
//

#import "SSIDropDownDismissAnimatedTransitioning.h"

@implementation SSIDropDownDismissAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioningDelegate Methods

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.618f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *dismissedView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *containerView = [transitionContext containerView];
    CGRect endFrame = CGRectMake(dismissedView.frame.origin.x,
                                 containerView.frame.size.height,
                                 dismissedView.frame.size.width,
                                 dismissedView.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.8f
          initialSpringVelocity:0.8f
                        options:0
                     animations:^{
                         dismissedView.frame = endFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end

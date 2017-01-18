//
//  SSIPopUpSpringyPresentAnimatedTransitioning.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/12/15.
//  Copyright (c) 2015 Survey Sampling International. All rights reserved.
//

#import "SSIPopUpSpringyPresentAnimatedTransitioning.h"

@implementation SSIPopUpSpringyPresentAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioningDelegate Methods

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.65f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *presentedView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    [containerView addSubview:presentedView];
    
    CGRect endFrame = presentedView.frame;
    CGRect startFrame = CGRectMake(endFrame.origin.x, containerView.bounds.size.height,  endFrame.size.width, endFrame.size.height);
    
    presentedView.frame = startFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.8f
          initialSpringVelocity:0.8f
                        options:0
                     animations:^{
                         presentedView.frame = endFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end

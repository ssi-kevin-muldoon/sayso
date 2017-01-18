//
//  SSIVanillaPresentationController.m
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/11/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIVanillaPresentationController.h"

@implementation SSIVanillaPresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    
    CGRect containerBounds = self.containerView.frame;
    return containerBounds;
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    [self.presentedView setFrame:self.containerView.frame];
}

@end

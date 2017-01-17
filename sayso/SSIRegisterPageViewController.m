//
//  SSIRegisterPageViewController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/16/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIRegisterPageViewController.h"
#import "SSIRegisterPageContentViewController.h"
#import "UIColor+SSI.h"
#import "SSIRegistrationWelcomeAnimation.h"
#import "SSIRegistrationSurveysAnimation.h"
#import "SSIRegistrationAbilitiesAnimation.h"
#import "SSIRegistrationLevelUpAnimation.h"
#import "SSIRegistrationGiftCardAnimation.h"
#import "SSIRegistrationSocialAnimation.h"

static NSString *SSIRegisterPageContentViewControllerIdentifier = @"SSIRegisterPageContentViewController";

@interface SSIRegisterPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) NSArray *animations;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageBodys;

@end

@implementation SSIRegisterPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pageImages];
    [self pageTitles];
    [self pageBodys];
    [self setDataSource:self];
    [self setDelegate:self];

    __weak SSIRegisterPageViewController *weakSelf = self;

    [self setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        [weakSelf.pageControl setNumberOfPages:[weakSelf.pageImages count]];
    }];

}

#pragma mark - UIPageViewControllerDataSource Methods

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((SSIRegisterPageContentViewController *) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((SSIRegisterPageContentViewController *) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;

    if (index == [self.pageTitles count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0); {
    SSIRegisterPageContentViewController *viewController = (SSIRegisterPageContentViewController *) pendingViewControllers[0];
    
    [self pageControlCurrentPageHandler:viewController];
    [self alternateContentBackgroundColor:viewController];
    [self dismissLearnMoreLabelHandler];
}

- (void)pageControlCurrentPageHandler:(SSIRegisterPageContentViewController *)viewController {
    self.pageControl.currentPage = viewController.pageIndex;
}

- (void)dismissLearnMoreLabelHandler {
    
    if ([self.pageImages count] - 1 == self.pageControl.currentPage) {
        [UIView animateWithDuration:0.35f animations:^{
            [self.learnMoreLabel setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [self.learnMoreLabel setHidden:YES];
        }];
    }
}

- (void)alternateContentBackgroundColor:(SSIRegisterPageContentViewController *)viewController {
    [viewController.view setBackgroundColor:((viewController.pageIndex % 2) ? [UIColor seaFrolic] : [UIColor blueBurst])];
}

#pragma mark - Helper Methods

- (SSIRegisterPageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    SSIRegisterPageContentViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:SSIRegisterPageContentViewControllerIdentifier];
    viewController.imageName = self.pageImages[index];
    viewController.titleText = self.pageTitles[index];
    viewController.bodyText = self.pageBodys[index];
    viewController.pageIndex = index;
    viewController.animation = [[self.animations[index] alloc] init];
    
    return viewController;
}

#pragma mark - Lazy Getter Methods


- (NSArray *)animations {
    if (!_animations) {
        _animations = @[
                        [SSIRegistrationWelcomeAnimation class],
                        [SSIRegistrationSurveysAnimation class],
                        [SSIRegistrationAbilitiesAnimation class],
                        [SSIRegistrationLevelUpAnimation class],
                        [SSIRegistrationGiftCardAnimation class],
                        [SSIRegistrationSocialAnimation class]
                        ];
    }
    return _animations;
}

- (NSArray *)pageImages {
    if (!_pageImages) {
        _pageImages = @[
                        @"page1.png",
                        @"page2.png",
                        @"page2.png",
                        @"page3.png",
                        @"page3.png",
                        @"page3.png",
                        ];
    }
    return _pageImages;
}

- (NSArray *)pageTitles {
    if (!_pageTitles) {
        _pageTitles = @[
                        @"Welcome to sayso!",
                        @"Take surveys",
                        @"Unlock abilities",
                        @"Level up!",
                        @"Fabulous prizes!",
                        @"Be social!"
                        ];
    }
    return _pageTitles;
}

- (NSArray *)pageBodys {
    if (!_pageBodys) {
        _pageBodys = @[
                       @"The exciting polling app where you earn points, badges and prizes for participating in quizzes and surveys.",
                       @"Choose from a wide variety of quizzes and surveys. New ones every day. Always something to do!",
                       @"Unlock abilities to access high-value surveys which quickly earn $10 coins! Earn badges that recognize your experiences and share with friends.",
                       @"Every 10,000 points earns a level up and awards a coin redeemable for $10 prizes. Full members access high value surveys, so it doesn't take long to win prizes.",
                       @"Choose from iTunes gift cards, Amazon gift card, PayPal credit or even donate to your favorite charity.",
                       @"Tweet about that new gift card you earned! Facebook the charity you donated to. It's OK. You've earned bragging rights."
                       ];
    }
    return _pageBodys;
}

@end

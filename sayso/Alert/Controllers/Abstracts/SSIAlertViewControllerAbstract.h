//
//  SSIAlertViewControllerAbstract.h
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/11/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIViewControllerAbstract.h"

typedef void(^SSIAlertActionHandler)(void);

typedef NS_ENUM(NSInteger, SSIAlertViewControllerStyle) {
    SSIAlertViewControllerStyleDefault,
    SSIAlertViewControllerStyleWarning,
    SSIAlertViewControllerStyleInfo,
    SSIAlertViewControllerStyleMakeItRain
};

typedef NS_ENUM(NSInteger, SSIAlertActionButtonStyle) {
    SSIAlertActionButtonStyleDefault,
    SSIAlertActionButtonStyleInfo,
    SSIAlertActionButtonStyleWarning,
    SSIAlertActionButtonStyleCancel
};

@interface SSIAlertAction : NSObject
@property (strong, nonatomic, readonly) NSString *title;
@property (assign, nonatomic, readonly) SSIAlertActionButtonStyle style;
@property (nonatomic, copy, readonly) SSIAlertActionHandler handler;

+ (instancetype)title:(NSString *)title style:(SSIAlertActionButtonStyle)style handler:(void (^)(void))handler;

@end

@interface SSIAlertViewControllerAbstract : SSIViewControllerAbstract

@property (strong, nonatomic) id<UIViewControllerTransitioningDelegate> transitioningProxy;

- (void)addAction:(SSIAlertAction *)action;

@end



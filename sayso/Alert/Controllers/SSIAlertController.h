//
//  SSIAlertController.h
//  QuickThoughts
//
//  Created by Kevin Muldoon on 12/15/15.
//  Copyright © 2015 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIAlertViewControllerAbstract.h"

@interface SSIAlertController : SSIAlertViewControllerAbstract

@property (strong, nonatomic) UIImage *headerImage;

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message style:(SSIAlertViewControllerStyle)style;

@end

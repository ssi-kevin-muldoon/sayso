//
//  SSIAlertControllerFactory.m
//  sayso
//
//  Created by Kevin Muldoon on 1/18/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIAlertControllerFactory.h"
#import "SSIAlertController.h"

@implementation SSIAlertControllerFactory

+ (SSIAlertController *)helpIsOnTheWayAlert {
    
    NSString *title = @"Help is on the way!";
    NSString *message = @"But this button is not implemented yet. FPO only.";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }]];
    
    return alert;
}

@end

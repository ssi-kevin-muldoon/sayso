//
//  SSIRegisterPageContentViewController.h
//  sayso
//
//  Created by Kevin Muldoon on 1/16/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIViewControllerAbstract.h"
#import "SSIQuartzCodeAnimationProtocol.h"

@interface SSIRegisterPageContentViewController : SSIViewControllerAbstract

@property (assign, nonatomic) NSUInteger pageIndex;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *bodyText;
@property (strong, nonatomic) IBOutlet UIView<SSIQuartzCodeAnimationProtocol> *animation;

@end

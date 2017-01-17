//
//  ViewController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/11/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "ViewController.h"
#import "SSIToolBar+SSI.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SSIToolBar *animatedToolBar;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"saysoNavigationBarLogo"]];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.animatedToolBar close];
    [self.animatedToolBar percentValue:@"10%"];
}

- (IBAction)buttonAction:(id)sender {
    
    [self toggleAction:sender];
}

- (void)toggleAction:(id)sender {
    
    _button.tag = _button.tag +1;
    
    if (_button.tag % 2) {
        [self.animatedToolBar addRevealAnimation];
    } else {
        [self.animatedToolBar addDismissAnimation];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED { // Defaults to UIStatusBarStyleDefault
    return UIStatusBarStyleLightContent;
}

@end

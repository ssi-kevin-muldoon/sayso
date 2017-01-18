//
//  SSIPageViewContainerController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/16/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIRegisterContainerViewController.h"
#import "SSIRegisterPageViewController.h"
#import "SSIAlertController.h"
#import "SSITigerTransitioningProxy.h"

static NSString *SSIDashboardStoryboardSegueIdentifier = @"SSIDashboardStoryboardSegueIdentifier";

@interface SSIRegisterContainerViewController ()
@property (strong, nonatomic) SSIRegisterPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *learnMoreLabel;
@end

@implementation SSIRegisterContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SSIRegisterPageViewController"];
    [self.pageViewController setPageControl:self.pageControl];
    [self.pageViewController setLearnMoreLabel:self.learnMoreLabel];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.view sendSubviewToBack:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logInButtonAction:(id)sender {
    NSLog(@"logInButtonAction");
}

- (IBAction)signUpButtonAction:(id)sender {
    NSLog(@"signUpButtonAction");
}

- (IBAction)maybeLaterButtonAction:(id)sender {
    
    NSString *title = @"Are you sure?";
    NSString *message = @"You won't be able to earn points unless you're a member.";
    NSString *cancelButtonTitle = @"Cancel";
    NSString *okButtonTitle = @"Maybe later";

    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    
    [alert addAction:[SSIAlertAction title:cancelButtonTitle
                                     style:SSIAlertActionButtonStyleCancel
                                   handler:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
        
        [alert presentViewController:[self laterAlert] animated:YES completion:nil];
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (SSIAlertController *)laterAlert {
    
    NSString *title = @"No problem!";
    NSString *message = @"Non-members can participate in quizzes. To access high-value surveys, you can become a member at any time.";
    NSString *okButtonTitle = @"OK";

    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
   
    [alert setTransitioningProxy:[SSITigerTransitioningProxy new]];

    [alert addAction:[SSIAlertAction title:okButtonTitle style:SSIAlertActionButtonStyleDefault handler:^{
        [self dismissViewControllerAnimated:NO completion:^{
            [self performSegueWithIdentifier:SSIDashboardStoryboardSegueIdentifier sender:self];
        }];
    }]];
    
    return alert;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end

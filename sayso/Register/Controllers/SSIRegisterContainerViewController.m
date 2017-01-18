//
//  SSIPageViewContainerController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/16/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIRegisterContainerViewController.h"
#import "SSIRegisterPageViewController.h"

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
    [self performSegueWithIdentifier:SSIDashboardStoryboardSegueIdentifier sender:self];
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end

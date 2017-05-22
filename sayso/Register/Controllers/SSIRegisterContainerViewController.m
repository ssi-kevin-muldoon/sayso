//
//  SSIPageViewContainerController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/16/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIRegisterContainerViewController.h"
#import "SSIRegisterPageViewController.h"
#import "SSITigerTransitioningProxy.h"

static NSString *SSIDashboardStoryboardSegueIdentifier = @"SSIDashboardStoryboardSegueIdentifier";
static NSString *SSIRegisterPageViewControllerIdentifier = @"SSIRegisterPageViewController";

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
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:SSIRegisterPageViewControllerIdentifier];
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

- (void)foo {
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"<#Entity name#>" inManagedObjectContext:<#context#>];
//    [fetchRequest setEntity:entity];
//    // Specify criteria for filtering which objects to fetch
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//    [fetchRequest setPredicate:predicate];
//    // Specify how the fetched objects should be sorted
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
//                                                                   ascending:YES];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//    
//    NSError *error = nil;
//    NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
//    if (fetchedObjects == nil) {
//        <#Error handling code#>
//    }
    
    
}


- (IBAction)logInButtonAction:(id)sender {
    NSLog(@"logInButtonAction");
}

- (IBAction)signUpButtonAction:(id)sender {
    NSLog(@"signUpButtonAction");
}

- (IBAction)maybeLaterButtonAction:(id)sender {
    
    NSString *title = @"Are you sure?";
    NSString *message = @"Only members can earn points, collect badges and win prizes.";
    NSString *cancelButtonTitle = @"Cancel";
    NSString *okButtonTitle = @"I'm sure";

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
    NSString *message = @"You can participate right now. Become a member at any time from the account menu.";
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

- (void)performSegueToDashboard {
    [self performSegueWithIdentifier:SSIDashboardStoryboardSegueIdentifier sender:self];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end

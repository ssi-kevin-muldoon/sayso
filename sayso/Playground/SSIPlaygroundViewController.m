//
//  SSIPlaygroundViewController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/18/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIPlaygroundViewController.h"
#import "SSIAlertController.h"

@interface SSIPlaygroundViewController ()

@end

@implementation SSIPlaygroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)buttonAction:(id)sender {
    SSIAlertController *alert = [SSIAlertController alertWithTitle:@"Awesome title!" message:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed interdum finibus dolor, sed laoreet quam lobortis gravida. Donec sit amet massa commodo ex varius tincidunt" style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:@"Cancel" style:SSIAlertActionButtonStyleCancel handler:^{ [self dismissViewControllerAnimated:YES completion:nil]; }]];
    [alert addAction:[SSIAlertAction title:@"Let's do it anyway" style:SSIAlertActionButtonStyleDefault handler:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
